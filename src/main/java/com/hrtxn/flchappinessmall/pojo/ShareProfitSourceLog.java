package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 分红/润来源记录
 */
@Data
public class ShareProfitSourceLog implements Serializable {

    private Integer id;

    private String addtime;

    private Float money;

    private Integer userId;

    private String handlers;

    private Integer type;

    private String userNick;

    private String userTel;

    private Integer userRole;
}