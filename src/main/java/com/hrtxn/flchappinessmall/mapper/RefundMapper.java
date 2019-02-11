package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.RefundLog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:42
 */
@Repository
public interface RefundMapper {

    /**
     * 根据订单编号获取退款信息
     * @param orderNum
     * @return
     */
    RefundLog getRefundLogByOrderNum(@Param("orderNum") String orderNum) throws Exception;

    /**
     * 获取退款金额
     * @return
     */
    String getAllRefundMoney() throws Exception;
}
