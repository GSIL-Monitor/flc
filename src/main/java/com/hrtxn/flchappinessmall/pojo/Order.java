package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 订单
 */
@Data
public class Order implements Serializable {
    private Integer id;

    private String orderAddtime;

    private String orderNum;

    private String receiverName;

    private String receiverTel;

    private String receiverAddress;

    private String receiverPostcode;

    private Integer orderStatus;

    private Integer goodsId;

    private String goodsParameter;

    private Integer goodsAmount;

    private Float goodsPrice;

    private Float goodsActualPrice;

    private Float goodsupplyPrice;

    private Float goodsFreight;

    private Integer storeId;

    private Integer userId;

    private Integer orederPayType;

    private String orderPayNum;

    private String orderPayTime;

    private String orderShipmentsTime;

    private String orderTakegoodsTime;

    private String orderEvaluateTime;

    private Integer invoiceType;

    private String invoiceTitle;

    private String invoiceDutyParagraph;

    private String invoiceOpenBank;

    private String invoiceBankCard;

    private String invoiceCompayAddress;

    private String invoiceTel;

    private String logisticsCompany;

    private String logisticsNum;

    private Integer userIsdeleteFlag;

    private Integer storeIsdeleteFlag;

    private Integer plateIsdeleteFlag;

    private Integer isdiscountFlag;

    private String reasons;

    private String remindTime;

    private String remindNum;

    private String msg;

    //添加字段
    private String goodsName;

    private Integer goodsInventory;

    private Float refundMoney;

    private String refundReasons;

    private Integer refundBigStatus;

    private String applicationTime;

    private Float commission;

    private String storeName;

    private String userNick;
    /*************根据一级分类获取订单数量时使用****************/
    private Integer groupSum;

    private Integer oneClassifyid;

    private String oneClassifyName;
}