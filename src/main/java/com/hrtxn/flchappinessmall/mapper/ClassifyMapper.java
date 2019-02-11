package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Classify;
import com.hrtxn.flchappinessmall.pojo.pojoVo.ClassifyTypeVo;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-06 上午 11:03
 * Description:<商品分类Mapper>
 */
public interface ClassifyMapper {
    /**
     * 根据分类id查询分类
     *
     * @param id
     * @return
     */
    Classify selectClassifyById(Integer id);

    /**
     * 获取所有分类
     *
     * @return
     */
    Classify selectClassifyAll();

    /**
     * 获取指定等级分类
     *
     * @param classifyLevel
     * @return
     */
    List<Classify> selectClassifyByLevel(Integer classifyLevel);

    /**
     * 修改分类  动态sql
     *
     * @param classify
     */

    void updateByPrimaryKeySelective(Classify classify);

    /**
     * 根据一级id查询出其二级.三级 Id,名称,type(是否隐藏)
     */
    List<ClassifyTypeVo> selectClassifyType(Integer id);




    /**
     *根据父级id批量修改 子级的状态 隐藏
     */
    void updateClassifyTypeByPId1(List<Classify> classifyList);

    /**
     * 根据父级id批量修改 子级的状态 显示
     * @param classifyList
     */

    void updateClassifyTypeByPId2(List<Classify> classifyList);

    /**
     * 添加分类(动态sql)
     * @param classify
     */
    void insertSelective(Classify classify);

    /**
     * 根据id删除分类
     * @param id
     */
    void deleteByPrimaryKey(Integer id);


    /**
     * 根据一级分类Id删除二级分类
     * @param id
     */
    void deleteByOnePKey(Integer id);

    /**
     * 根据一级id获取二级分类
     *
     * @param parentid
     * @return
     */
    List<Classify> selectClassifyByParentId(Integer parentid);


    /**
     * 根据二级分类Id获取三级分类
     */
    List<Classify> selectThreeClassifyByTwoPId(List<Classify> classifyList);


    /**
     * 分类id删除分类
     * @param classifyList
     * @return
     */
    void deleteByIdList(List<Classify> classifyList);

    /**
     * 根据父ID获取子分类
     */
    List<Classify> getClassifyByPId(Integer parentId);

    /**
     * 获取被推荐分类
     * @param classifyIndex
     * @return
     */
    List<Classify> selectClassifyByIndex(Integer classifyIndex);
}
