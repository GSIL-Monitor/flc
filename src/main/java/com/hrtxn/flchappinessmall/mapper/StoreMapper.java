package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Store;
import com.hrtxn.flchappinessmall.pojo.pojoVo.StoreVo;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-05 下午 3:26
 * Description:<商铺管理功能Mapper>
 */
public interface StoreMapper {

    /**
     *     查詢所有商鋪列表
     */
   public List<Store> selectStoreList();
    /**
     * 查询一级分类名和其所有店铺数量
     * @return
     */
    public List<StoreVo> selectByClassifyCount();
    /**
     * 修改商品表任意字段
     * @param
     */
    public void updateByPrimaryKeySelective(Store store);
    /**
     * 根据店铺id获取店铺
     * @param id
     */
    public Store selectStoreById(Integer id);



//========================================================================================================
//=================================店铺审核页面功能==========================================================
//========================================================================================================
    /**
     * 获取指定状态店铺
     * @return
     */
   public List<Store> selectStoreStatusList(Integer status);

    /**
     * 根据分类获取店铺 不包含逻辑删除
     * @param classifyId
     * @return
     */
    List<Store> selectByClassifyId(Integer classifyId);

    int update_storeaccount(Store store);
}
