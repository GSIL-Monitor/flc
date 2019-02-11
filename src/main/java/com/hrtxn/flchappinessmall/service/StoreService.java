package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.exception.StoreStatusException;
import com.hrtxn.flchappinessmall.pojo.Store;
import com.hrtxn.flchappinessmall.pojo.pojoVo.StoreVo;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-05 下午 4:00
 * Description:<商铺管理功能Service>
 */
public interface StoreService {

    /**
     * 查詢所有商鋪列表
     */
    public List<Store> getStoreList();

    /**
     * 查询一级分类名和其所有店铺数量
     *
     * @return
     */
    public List<StoreVo> getByClassifyCount();

    /**
     * 启用禁用
     */
    public void modifyStoreStatus(Integer id) throws StoreStatusException;

    /**
     * 删除
     */
    public void removerStore(Integer id) throws StoreStatusException;

    /**
     * 根据id获取店铺
     *
     * @param id
     * @return
     */
    public Store getStoreById(Integer id);

//========================================================================================================
//=================================店铺审核页面功能==========================================================
//========================================================================================================
    /**
     * 获取待审核状态店铺
     *
     * @return
     */
    public List<Store> getStoreStatusAuditList();

    /**
     * 通过审核
     *
     * @param id
     */
    public void modifyStoreStatusPass(Integer id) throws StoreStatusException;

    /**
     * 店铺审核驳回
     *
     * @param id
     * @return
     */
    public void modifyStoreStatusReject(Integer id, String reason) throws StoreStatusException;

    /**
     * 获取被驳回状态店铺
     */
    public List<Store> getStoreStatusRejectList();

    int update_storeaccount(Store store);
}
