package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.exception.ClassNotNullException;
import com.hrtxn.flchappinessmall.exception.ClassifyIndexOneException;
import com.hrtxn.flchappinessmall.exception.GoodsListNotNullException;
import com.hrtxn.flchappinessmall.exception.StoreListNotNullException;
import com.hrtxn.flchappinessmall.pojo.Classify;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-26 上午 9:17
 * Description:<分类服务层>
 */
public interface ClassifyService {
    /**
     * 获取分类列表(一级)
     *
     * @return
     */
    List<Classify> getClassifyListByLevelOne();

    /**
     * 修改分类的显示隐藏
     */
    void modifyClassifyType(Integer id);

    /**
     * 根据id获取分类
     *
     * @param id
     * @return
     */
    Classify getClassifyById(Integer id);

    /**
     * 修改分类
     */
    void modifyClassify(Classify classify);

    /**
     * 添加分类
     *
     * @param classify
     */
    void addClassify(Classify classify);

    /**
     * 删除一级分类
     *
     * @param id
     */
    void delectClassify(Integer id) throws ClassNotNullException, StoreListNotNullException, GoodsListNotNullException;

    /**
     * 删除三级分类
     *
     * @param id
     */
    void delectClassifyLevelThree(Integer id) throws GoodsListNotNullException;

    /**
     * 删除二级分类
     *
     * @param id
     */
    void delectClassifyTwo(Integer id) throws GoodsListNotNullException;

    /**
     * 根据父ID获取子分类
     *
     * @param parentId
     * @return
     */
    List<Classify> getClassifyByPId(Integer parentId);

    /**
     * 推荐管理
     * @param classify
     */
    void tuijian(Classify classify) throws ClassifyIndexOneException;


}
