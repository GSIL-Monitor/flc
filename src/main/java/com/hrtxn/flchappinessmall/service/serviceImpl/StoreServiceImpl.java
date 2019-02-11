package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.common.StoreCommon;
import com.hrtxn.flchappinessmall.exception.StoreStatusException;
import com.hrtxn.flchappinessmall.mapper.StoreMapper;
import com.hrtxn.flchappinessmall.pojo.Store;
import com.hrtxn.flchappinessmall.pojo.pojoVo.StoreVo;
import com.hrtxn.flchappinessmall.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-05 下午 4:02
 * Description:<描述>
 */
@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)//事物默认隔离级别,回滚:任何异常都会回滚
public class StoreServiceImpl implements StoreService{
    @Autowired
    private StoreMapper storeMapper;


    /**
     * 查詢所有商鋪列表 (不包含以下三种状态的店铺:待审核 ,驳回 ,删除 )
     * @return
     */
    @Override
    @Transactional(readOnly=true)//只读事务
    public List<Store> getStoreList() {
        return storeMapper.selectStoreList();
    }

    /**
     * 查询一级分类名和其所有店铺数量
     * @return
     */
    @Override
    @Transactional(readOnly=true)//只读事务
    public List<StoreVo> getByClassifyCount(){
        List<StoreVo> storeVos = storeMapper.selectByClassifyCount();
        return storeVos;
    }

    /**
     * 商铺启用禁用
     */
    @Override
    public void modifyStoreStatus(Integer id) throws StoreStatusException {
        Store store1 = new Store();
        store1.setId(id);
        //根据店铺id 获取店铺状态
        Store store = storeMapper.selectStoreById(id);
        try {
            //店铺状态翻转
            if(store.getStoreStatus()==StoreCommon.STORE_STATUS_TRUE){//常量值:1 代表启用 如更改该常量值请同时更改该注解
                store1.setStoreStatus(StoreCommon.STORE_STATUS_FALSE);//常量值:3 代表禁用 如更改该常量值请同时更改该注解
                storeMapper.updateByPrimaryKeySelective(store1);
            }
        } catch (Exception e) {
            throw new StoreStatusException("对不起,禁用失败,请稍后重试");
        }
        try {
            //店铺状态翻转
            if(store.getStoreStatus()==StoreCommon.STORE_STATUS_FALSE){
                store1.setStoreStatus(StoreCommon.STORE_STATUS_TRUE);
                storeMapper.updateByPrimaryKeySelective(store1);
            }
        } catch (Exception e) {
           throw new StoreStatusException("对不起,启用失败,请稍后重试");
        }
    }



    /**
     * 删除
     * @param id 要被逻辑删除的店铺id
     */
    @Override
    public void removerStore(Integer id) throws StoreStatusException {
        Store store = new Store();
        store.setId(id);
        store.setStoreStatus(StoreCommon.STORE_STATUS_REMOVER); //常量值:-1 代表删除状态 如更改该常量值请同时更改该注解
        //将店铺状态改成-1 表示被逻辑删除
        try {
            storeMapper.updateByPrimaryKeySelective(store);
        } catch (Exception e) {
           throw new StoreStatusException("对不起,删除失败,请稍后重试");
        }
    }



    /**
     * 根据id获取店铺
     * @param id
     * @return
     */
    @Override
    @Transactional(readOnly=true)//只读事务
    public Store getStoreById(Integer id) {
        Store store = storeMapper.selectStoreById(id);
        return store;
    }







//========================================================================================================
//=================================店铺审核页面功能==========================================================
//========================================================================================================

  /**
     * 获取待审核状态店铺
     * @return
     */
   @Override
    public List<Store> getStoreStatusAuditList() {
       return storeMapper.selectStoreStatusList(StoreCommon.STORE_STATUS_REJECT_AUDIT);//常量值:5 代表待审核状态 如更改该常量值请同时更改该注解
    }



    /**
     * 店铺通过审核将状态改为正常(启用状态)
     * @param id
     */
    @Override
    public void modifyStoreStatusPass(Integer id) throws StoreStatusException {
        Store store = new Store();
        store.setId(id);
        store.setStoreStatus(StoreCommon.STORE_STATUS_TRUE); //常量值:1 代表启用状态 如更改该常量值请同时更改该注解
        try {
            storeMapper.updateByPrimaryKeySelective(store);
        } catch (Exception e) {
            throw new StoreStatusException("服务器异常,通过审核失败,请稍后重试");
        }
    }

    /**
     * 店铺审核驳回
     * @param id
     * @param reason 驳回审核理由
     */
    @Override
    public void modifyStoreStatusReject(Integer id, String reason) throws StoreStatusException {
        Store store = new Store();
        store.setId(id);
        store.setRejectReason(reason);//驳回理由
        store.setStoreStatus(StoreCommon.STORE_STATUS_REJECT);//常量值:4 代表驳回状态 如更改该常量值请同时更改该注解
        try {
            storeMapper.updateByPrimaryKeySelective(store);
        } catch (Exception e) {
            throw new StoreStatusException("服务器异常,驳回失败,请稍后重试");        }
    }
    /**
     * 获取被驳回状态店铺
     */
    @Override
    public  List<Store> getStoreStatusRejectList(){
        return storeMapper.selectStoreStatusList(StoreCommon.STORE_STATUS_REJECT);//常量值:4 代表驳回状态 如更改该常量值请同时更改该注解
    }

    @Override
    public int update_storeaccount(Store store) {
        return storeMapper.update_storeaccount(store);
    }
}
