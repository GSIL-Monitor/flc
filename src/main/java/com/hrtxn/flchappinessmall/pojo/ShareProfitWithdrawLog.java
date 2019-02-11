package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 分润提现记录
 */
@Data
public class ShareProfitWithdrawLog implements Serializable {
    private Integer id;

    private Integer userId;

    private String withdrawAddtime;

    private String withdrawType;

    private String withdrawAccount;

    private Float withdrawMoney;

    private String withdrawApproveTime;

    private String withdrawHandlers;

    private Integer withdrawStatus;

    private String withdrawRejectReason;

    private String userNick;

    private String userTel;
}