package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.common.GoodsCommon;
import com.hrtxn.flchappinessmall.mapper.GoodsMapper;
import com.hrtxn.flchappinessmall.mapper.SysconfigMapper;
import com.hrtxn.flchappinessmall.pojo.Goods;
import com.hrtxn.flchappinessmall.pojo.Sysconfig;
import com.hrtxn.flchappinessmall.pojo.pojoVo.GoodsVo;
import com.hrtxn.flchappinessmall.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-08 下午 5:07
 * Description:<产品serviceImpl>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)//事物默认隔离级别,回滚:任何异常都会回滚
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;


    @Autowired
    SysconfigMapper sysconfigMapper;//系统配置 持久层

    /**
     * 获取到所有产品列表(2营销中/3下架/4违规下架)
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true)//只读事务
    public List<GoodsVo> getStatusAll() {
        //获取到指定产品列表
        List<GoodsVo> goodsList = goodsMapper.selectStatusAll();
        return goodsList;
    }

    /**
     * 获取各个一级分类下的产品数量 不统计删除状态
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true)//只读事务
    public List<GoodsVo> getIsClassiyOneGoodsCount() {
        //获取到指定产品列表
        List<GoodsVo> goodsList = goodsMapper.selectIsClassiyOneGoodsCount();
        return goodsList;
    }

    /**
     * 商品新品状态改变(平台)
     */
    @Override
    public void modifyGoodsPlateIsbelongNewFlag(Integer id) {
        Goods goods = new Goods();
        goods.setId(id);
        GoodsVo goodsVo = goodsMapper.selectGoodsById(id);
        if (goodsVo.getPlateIsbelongNewFlag() == GoodsCommon.PLATE_ISBELONG_NEW_FLAG_TRUE) {
            goods.setPlateIsbelongNewFlag(GoodsCommon.PLATE_ISBELONG_NEW_FLAG_FALSE);//常量值: 1 代表不是新品
        } else {
            goods.setPlateIsbelongNewFlag(GoodsCommon.PLATE_ISBELONG_NEW_FLAG_TRUE);//常量值: 2 代表是新品
        }
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    /**
     * 商品热销状态改变(平台)
     *
     * @param id
     */
    @Override
    public void modifyPlateIsbelongHotFlag(Integer id) {
        Goods goods = new Goods();
        goods.setId(id);
        GoodsVo goodsVo = goodsMapper.selectGoodsById(id);
        if (goodsVo.getPlateIsbelongHotFlag() == GoodsCommon.PATE_ISBELONG_HOT_FLAG_TRUE) {
            goods.setPlateIsbelongHotFlag(GoodsCommon.PATE_ISBELONG_HOT_FLAG_FALSE);//常量值: 1 代表不是热销
        } else {
            goods.setPlateIsbelongHotFlag(GoodsCommon.PATE_ISBELONG_HOT_FLAG_TRUE);//常量值: 2 代表是热销
        }
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    /**
     * 商品下架
     *
     * @param id
     * @param reason
     */
    @Override
    public void goodsSoldOut(Integer id, String reason) {
        Goods goods = new Goods();
        goods.setId(id);
        goods.setGoodsStatus(GoodsCommon.GOODS_STATUS_WEIGUI);
        goods.setForceSoldOutReason(reason);
        goodsMapper.updateByPrimaryKeySelective(goods);
    }


    /**
     * 获取申请状态的产品
     *
     * @return
     */
    @Override
    @Transactional(readOnly = true)//只读事务
    public List<GoodsVo> getStatusApplyFor() {
        List<GoodsVo> goodsList = goodsMapper.getGoodsList(GoodsCommon.GOODS_STATUS_APPLYFOR);//常量值:1 产品状态:申请中
        return goodsList;
    }


    /**
     * 获取某一条产品
     *
     * @param id
     */
    @Override
    @Transactional(readOnly = true)
    public GoodsVo getGoodsById(Integer id) {
        GoodsVo goodsVo = goodsMapper.selectGoodsById(id);//常量值:1 产品状态:申请中
        return goodsVo;

    }

    /**
     * 删除店铺
     *
     * @param id
     */
    @Override
    public void removeGoods(Integer id) {
        Goods goods = new Goods();
        goods.setId(id);
        goods.setGoodsStatus(GoodsCommon.GOODS_STATUS_DELECT);//常量值:-1 产品状态:删除
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    /**
     * 通过商品申请
     *
     * @param id
     */
    @Override
    public void consentGoods(Integer id, Integer zone) throws Exception {
        Goods goods = new Goods();

        // 获取要通过的产品对象
        GoodsVo goodsVo = goodsMapper.selectGoodsById(id);
        // 查询数据库 获取系统配置对象  (处理积分)
        Sysconfig sysConfig = null;
        sysConfig = sysconfigMapper.getSysConfig();


        Double proportion = null;//声明一个变量用来存储对应区的积分比例值

        if (GoodsCommon.GOODS_ZONE_JINGPIN == zone) {//如果为精品区就去系统配置表里查询出精品区对应的积分获取比例
            proportion = sysConfig.getBoutiqueAreaPer();//精品区积分比例
        } else if (GoodsCommon.GOODS_ZONE_XIAOFEI == zone) {
            proportion = sysConfig.getConsumeAreaPer();//消费区积分比例
        }

        goods.setId(id);
        goods.setGoodsZone(zone);
        goods.setGoodsStatus(GoodsCommon.GOODS_STATUS_MARKETING);//常量值:2 产品状态:营销中

        //===============计算产品对应的消费积分===================

        // 商品销售价格
        Double goodsRetailPrice = Double.valueOf(goodsVo.getGoodsRetailPrice());
        // 通过比例值 获取对应积分 double向上取整 比如:Double类型数据 1.1 经过Math.ceil(1.1) 后 会变成2.0
        Double v = Math.ceil(goodsRetailPrice * proportion);
        // 将积分转成int舍去后小数
        int i = v.intValue();
        // 转成Integer类型
        Integer goodsIntegral = Integer.valueOf(i);

        //=====================================================

        // 将积分存入对象
        goods.setGoodsIntegral(goodsIntegral);
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    /**
     * 获取被驳回商品列表
     *
     * @return
     */
    @Override
    public List<GoodsVo> getGoodsReject() {
        //被驳回列表商品
        List<GoodsVo> goodsVoList = goodsMapper.selectReject();
        return goodsVoList;
    }

    /**
     * 驳回产品申请
     *
     * @param id
     */
    @Override
    public void rejectGoods(Integer id, String msg) {
        Goods goods = new Goods();
        goods.setId(id);
        goods.setGoodsStatus(GoodsCommon.GOODS_STATUS_REGECT);//常量值5 代表驳回
        goods.setRejectReason(msg);//驳回原因
        goodsMapper.updateByPrimaryKeySelective(goods);
    }

    /**
     * 获取所有商品(不包含删除状态)
     *
     * @return
     */
    @Override
    public List<Goods> getGoodsAll() {
        List<Goods> goodsList = goodsMapper.selectGoodsAll();
        return goodsList;
    }

    /**
     * 获取指定状态的商品
     *
     * @param status
     * @return
     */
    @Override
    public List<GoodsVo> getGoodsByStatus(Integer status) {
        List<GoodsVo> goodsList = goodsMapper.getGoodsList(status);
        return goodsList;
    }

    /**
     * 获取所有商品的所有评价 (不包含删除状态的商品评价)
     *
     * @return
     */
    @Override
    public Integer getEvaluteCount() {
        Integer evaluteCount = goodsMapper.selectEvaluteCount();
        return evaluteCount;
    }
    /**
     * 根据品牌Id获取商品 商品状态:销售中
     * @param brandId
     * @return
     */
    @Override
    public List<Goods> selectByBrandIdStatusTwo(Integer brandId) {
        List<Goods> goodsVoList = goodsMapper.selectByBrandIdStatusTwo(brandId);
        return goodsVoList;
    }


}
