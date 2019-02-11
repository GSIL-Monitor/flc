package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.RefundMapper;
import com.hrtxn.flchappinessmall.pojo.RefundLog;
import com.hrtxn.flchappinessmall.service.RefundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class RefundServiceImpl implements RefundService {

    @Autowired
    private RefundMapper refundMapper;

    /**
     * 根据订单编号获取退款信息
     * @param orderNum
     * @return
     */
    @Override
    public RefundLog getRefundLogByOrderNum(String orderNum) throws Exception {
        return refundMapper.getRefundLogByOrderNum(orderNum);
    }

    /**
     * 获取退款金额
     * @return
     */
    @Override
    public String getAllRefundMoney() throws Exception {
        return refundMapper.getAllRefundMoney();
    }
}
