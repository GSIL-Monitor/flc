package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.RefundLog;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface RefundService {

    /**
     * 根据订单编号获取退款信息
     * @param orderNum
     * @return
     */
    RefundLog getRefundLogByOrderNum(String orderNum) throws Exception;

    /**
     * 获取退款金额
     * @return
     */
    String getAllRefundMoney() throws Exception;
}
