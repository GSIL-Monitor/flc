package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Brand;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-23 下午 3:47
 * Description:<品牌管理 Mapper>
 */
public interface BrandMapper {

    /**
     * 获取当前品牌列表
     *
     * @return
     */
    List<Brand> selectBrandAll();

    /**
     * 根据品牌id 获取品牌信息
     * @param id
     * @return
     */
    Brand selectByPrimaryKey(Integer id);

    /**
     * 修改品牌功能
     * @param brand
     */
   void updateByPrimaryKeySelective(Brand brand);

    /**
     * 根据品牌id删除品牌
     * @param id
     */
    void deleteByPrimaryKey(Integer id);

    /**
     * 添加品牌,[动态sql]
     * @param brand
     */
    void insertSelective(Brand brand);

}
