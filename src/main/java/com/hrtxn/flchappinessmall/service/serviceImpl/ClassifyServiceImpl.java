package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.common.ClassifyCommon;
import com.hrtxn.flchappinessmall.common.QiNiuYunKit;
import com.hrtxn.flchappinessmall.exception.ClassNotNullException;
import com.hrtxn.flchappinessmall.exception.ClassifyIndexOneException;
import com.hrtxn.flchappinessmall.exception.GoodsListNotNullException;
import com.hrtxn.flchappinessmall.exception.StoreListNotNullException;
import com.hrtxn.flchappinessmall.mapper.ClassifyMapper;
import com.hrtxn.flchappinessmall.mapper.GoodsMapper;
import com.hrtxn.flchappinessmall.mapper.StoreMapper;
import com.hrtxn.flchappinessmall.pojo.Classify;
import com.hrtxn.flchappinessmall.pojo.Store;
import com.hrtxn.flchappinessmall.pojo.pojoVo.GoodsVo;
import com.hrtxn.flchappinessmall.service.ClassifyService;
import com.hrtxn.flchappinessmall.tools.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Author:封润
 * Date:2018-10-26 上午 9:20
 * Description:<分类服务层>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)//事物默认隔离级别,回滚:任何异常都会回滚
public class ClassifyServiceImpl implements ClassifyService {

    @Autowired
    private ClassifyMapper classifyMapper;
    @Autowired
    private StoreMapper storeMapper;//店铺
    @Autowired
    private GoodsMapper goodsMapper;//商品

    /**
     * 获取分类列表(一级)
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true)//只读事务
    public List<Classify> getClassifyListByLevelOne() {
        List<Classify> classifyByLevel = classifyMapper.selectClassifyByLevel(ClassifyCommon.CLASSIFY_LEVEL_ONE);//常量值 1 代表 一级分类
        return classifyByLevel;
    }

    /**
     * 修改分类的显示隐藏
     */
    @Override
    public void modifyClassifyType(Integer id) {
        Classify classify = new Classify();
        classify.setId(id);
        //获取一级classify对象
        Classify classifyById = classifyMapper.selectClassifyById(id);

        Integer type = null;

        //获取属于当前一级分类的二级分类
        //根据父级id查询出子级  二级
        List<Classify> classifieList = classifyMapper.selectClassifyByParentId(id);

        if (ClassifyCommon.CLASSIFY_TYPE_FALSE == classifyById.getClassifyType()) {//常量值:2 代表隐藏
            classify.setClassifyType(ClassifyCommon.CLASSIFY_TYPE_TRUE);//常量值:1 代表显示
            type = ClassifyCommon.CLASSIFY_TYPE_TRUE;
            //修改一级分类状态
            classifyMapper.updateByPrimaryKeySelective(classify);
            //修改二级分类状态
            List<Classify> classifies = new ArrayList<Classify>();
            classifies.add(classifyById);
//修改为显示状态
            classifyMapper.updateClassifyTypeByPId1(classifies);

            //修改三级分类状态
            if (!classifieList.isEmpty()) {
                classifyMapper.updateClassifyTypeByPId1(classifieList);
            }

        } else if (ClassifyCommon.CLASSIFY_TYPE_TRUE == classifyById.getClassifyType()) {
            classify.setClassifyType(ClassifyCommon.CLASSIFY_TYPE_FALSE);
            type = ClassifyCommon.CLASSIFY_TYPE_FALSE;

            //修改一级分类状态
            classifyMapper.updateByPrimaryKeySelective(classify);
            //修改二级分类状态
            List<Classify> classifies = new ArrayList<Classify>();
            classifies.add(classifyById);
            //修改为隐藏状态
            classifyMapper.updateClassifyTypeByPId2(classifies);

            //修改三级分类状态
            if (!classifieList.isEmpty()) {
                classifyMapper.updateClassifyTypeByPId2(classifieList);
            }
        }

    }

    /**
     * 根据id获取分类
     *
     * @param id
     * @return
     */
    @Override
    public Classify getClassifyById(Integer id) {
        Classify classify = classifyMapper.selectClassifyById(id);
        return classify;
    }

    /**
     * 修改分类
     *
     * @param classify
     */
    @Override
    public void modifyClassify(Classify classify) {
        classifyMapper.updateByPrimaryKeySelective(classify);
    }

    /**
     * 添加分类
     *
     * @param classify
     */
    @Override
    public void addClassify(Classify classify) {
        classifyMapper.insertSelective(classify);
    }


    /**
     * 删除一级分类
     *
     * @param id
     */
    @Override
    public void delectClassify(Integer id) throws ClassNotNullException, StoreListNotNullException, GoodsListNotNullException {
        //通过一级分类查询  店铺  (不包含逻辑删除状态)
        List<Store> storeList = storeMapper.selectByClassifyId(id);
        //通过一级分类查询  商品  (不包含逻辑删除状态)
        List<GoodsVo> goodsVoList = goodsMapper.selectGoodsByOneClassifyId(id);

        //店铺不为空就抛出异常
        if (!storeList.isEmpty()) {
            throw new StoreListNotNullException("还有店铺在使用当前一级分类,无法删除!");
        }

        //商品不为空就抛出异常
        if (!goodsVoList.isEmpty()) {
            throw new GoodsListNotNullException("还有商品在使用当前一级分类,无法删除!");
        }

        //根据一级分类Id获取二级分类
        List<Classify> classifiesTwoList = classifyMapper.selectClassifyByParentId(id);

        List<Classify> classifiesThreeList = new ArrayList<Classify>();
        if (classifiesTwoList != null && !classifiesTwoList.isEmpty()) {
            //根据二级分类Id获取三级分类
            classifiesThreeList = classifyMapper.selectThreeClassifyByTwoPId(classifiesTwoList);
        }


        //根据一级分类获取一级分类对象
        Classify classify = classifyMapper.selectClassifyById(id);
        //删除七牛云的一级分类图片
        System.out.println(classify.getClassifyLogo());
        QiNiuYunKit.delectQiNiuYunImg(Constant.FEN_LEI,classify.getClassifyLogo());//***************
        //删除一级分类()
        classifyMapper.deleteByPrimaryKey(id);
        if (classifiesTwoList != null && !classifiesTwoList.isEmpty()) {
            //删除二级分类七牛云图片
            for (Classify classify1 : classifiesTwoList) {
                QiNiuYunKit.delectQiNiuYunImg(Constant.FEN_LEI,classify1.getClassifyLogo());//************
            }
            //删除二级分类
            classifyMapper.deleteByIdList(classifiesTwoList);
        }

        if (classifiesThreeList != null && !classifiesThreeList.isEmpty()) {

            //删除三级分类七牛云图片
            for (Classify classify1 : classifiesThreeList) {
                QiNiuYunKit.delectQiNiuYunImg(Constant.FEN_LEI,classify1.getClassifyLogo());//************
            }
            //删除三级分类
            classifyMapper.deleteByIdList(classifiesThreeList);

        }


    }


    /**
     * 删除二级分类
     *
     * @param id
     */
    public void delectClassifyTwo(Integer id) throws GoodsListNotNullException {
        List<Classify> classifyList = new ArrayList<Classify>();
        Classify classify2 = classifyMapper.selectClassifyById(id);
        classifyList.add(classify2);


        //通过二级分类获取三级分类
        List<Classify> classifiesThreeList = classifyMapper.selectThreeClassifyByTwoPId(classifyList);
        for (Classify classify1 : classifiesThreeList) {
            System.err.println("三级分类图片地址为:" + classify1.getClassifyLogo());
        }


        //通过二级分类查询  商品  (不包含逻辑删除状态)
        List<GoodsVo> goodsVoList = goodsMapper.selectGoodsByTwoClassifyId(id);


        //如果还有商品在使用该二级分类就不允许删除
        if (goodsVoList.size() > 0) {
            throw new GoodsListNotNullException("还有商品在使用当前二级分类,无法删除!");
        }


        //删除二级分类七牛云图片
        for (Classify classify1 : classifyList) {
            System.err.println("三级分类图片地址为:" + classify1.getClassifyLogo());
            QiNiuYunKit.delectQiNiuYunImg(Constant.FEN_LEI,classify1.getClassifyLogo());//*************
        }
        //删除二级分类
        classifyMapper.deleteByIdList(classifyList);


        //三级分类不为空则删除三级分类
        if (classifiesThreeList.size() > 0) {

            //删除三级分类七牛云图片
            for (Classify classify1 : classifiesThreeList) {
                System.err.println(classify1.getClassifyLogo());
                QiNiuYunKit.delectQiNiuYunImg(Constant.FEN_LEI,classify1.getClassifyLogo());//*************
            }
            //删除三级分类
            classifyMapper.deleteByIdList(classifiesThreeList);
        }


    }

    /**
     * 删除三级分类
     *
     * @param id
     */
    @Override
    public void delectClassifyLevelThree(Integer id) throws GoodsListNotNullException {
        List<Classify> classifyList = new ArrayList<Classify>();
        Classify classify = classifyMapper.selectClassifyById(id);
        classifyList.add(classify);

        //使用该id在分类表中 通过父类id字段做查询 判断查询出的子分类是否为空 为空则进行删除  不为空则不允许删除
        classifyMapper.selectClassifyByParentId(id);

        //通过三级分类查询  商品  (不包含逻辑删除状态)
        List<GoodsVo> goodsVoList = goodsMapper.selectGoodsByThreeClassifyId(id);

        if (goodsVoList != null && !goodsVoList.isEmpty()) {
            throw new GoodsListNotNullException("还有商品在使用当前分类,无法删除!");
        }



        //删除三级分类七牛云图片
        for (Classify classify1 : classifyList) {
            QiNiuYunKit.delectQiNiuYunImg(Constant.FEN_LEI,classify1.getClassifyLogo());//*************
        }
        //删除三级分类
        classifyMapper.deleteByIdList(classifyList);
    }

    /**
     * 根据父ID获取子分类
     *
     * @param parentId
     * @return
     */
    @Override
    public List<Classify> getClassifyByPId(Integer parentId) {
        List<Classify> classifyByPId = classifyMapper.getClassifyByPId(parentId);
        return classifyByPId;
    }

    /**
     * 推荐管理
     *
     * @param classify
     */
    @Override
    public void tuijian(Classify classify) throws ClassifyIndexOneException {

        //如果是要添加推荐则进行判断  否则直接执行修改
        if (classify.getClassifyIndex() == ClassifyCommon.TUIJIAN) {//常量 :1 代表 推荐状态

            //查看当前推荐产品数量
            List<Classify> classifyList = classifyMapper.selectClassifyByIndex(ClassifyCommon.TUIJIAN);

            if (classifyList.size() == 4 || classifyList.size() > 4) {
                throw new ClassifyIndexOneException("很抱歉推荐分类位置已满");
            }
        }

        //执行修改操作
        System.err.println("推荐状态为:" + classify.getClassifyIndex());
        classifyMapper.updateByPrimaryKeySelective(classify);

    }
}
