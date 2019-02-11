package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 退货退款记录
 */
@Data
public class RefundLog implements Serializable {
    private Integer id;

    private String applicationTime;

    private String finishTime;

    private Integer refundType;

    private String orderNum;

    private Integer userId;

    private Integer goodsId;

    private Integer storeId;

    private Integer refundBigStatus;

    private Integer refundSmallStatus;

    private Float refundMoney;

    private String logisticsCompany;

    private String logisticsNum;

    private String reasons;

    private String msg;
}