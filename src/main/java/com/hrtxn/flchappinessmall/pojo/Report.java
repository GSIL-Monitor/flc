package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

/**
 * 商品举报
 */
@Data
public class Report {
    private Integer id;

    private Integer userId;

    private Integer goodsId;

    private String reportAddtime;

    private String operationTime;

    private String operationHandler;

    private String reportDescribe;

    private String operationNote;

    private String userNick;

    private String goodsName;

    private Integer storeId;
}