package com.hrtxn.flchappinessmall.common;

/**
 * Author:封润
 * Date:2018-10-06 下午 2:32
 * Description:<商铺常量接口>
 */
public interface StoreCommon {

    /**
     *店铺状态:启用
     */
    Integer STORE_STATUS_TRUE = 1;
    /**
     * 店铺状态:禁用
     */
    Integer STORE_STATUS_FALSE = 3;
    /**
     * 店铺状态:已被删除
     */
    Integer STORE_STATUS_REMOVER = -1;
    /**
     * 店铺状态:驳回
     */
    Integer STORE_STATUS_REJECT = 4;
    /**
     * 店铺状态:待审核
     */
    Integer STORE_STATUS_REJECT_AUDIT = 5;


}
