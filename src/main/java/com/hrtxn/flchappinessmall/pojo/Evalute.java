package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 评价
 */
@Data
public class Evalute implements Serializable {
    private Integer id;

    private String evaluteAddtime;

    private Integer userId;

    private String orderNum;

    private Integer goodsId;

    private Integer evaluteType;

    private String evaluteContent;

    private String storeReplyContent;

    private String storeReplyTime;
}