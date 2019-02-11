package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.exception.GoodsVoListNotNullException;
import com.hrtxn.flchappinessmall.pojo.Brand;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-23 下午 3:52
 * Description:<品牌逻辑层接口>
 */
public interface BrandService {

    /**
     * 获取品牌列表
     * @return
     */
    List<Brand> getBrandAll();

    /**
     * 更改品牌状态
     * @param id
     */
    void modfyBrandType(Integer id);

    /**
     * 删除品牌
     * @param brand
     */
    void removeBrand(Brand brand) throws GoodsVoListNotNullException;

    /**
     * 根据品牌Id查询品牌
     * @param id
     */
    Brand getBrandById(Integer id);


    /**
     * 修改品牌信息
     * @param brand
     */
   void modfyBrand(Brand brand);

    /**
     * 添加品牌信息
     * @param brand
     */
   void addBrand(Brand brand);
}
