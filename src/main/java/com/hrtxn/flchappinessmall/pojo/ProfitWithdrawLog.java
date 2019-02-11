package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 分红提现账户记录
 */
@Data
public class ProfitWithdrawLog implements Serializable {
    private Integer id;

    private Integer userRole;

    private Integer userId;

    private String applicationTime;

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