package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 分红历史
 */
@Data
public class ProfitHiostory implements Serializable {
    private String addtime;

    private String profitHiostoryDate;

    private String profitHiostoryEndDate;

    private Float sumProfitMoney;

    private String userIds;

    private Integer profitType;
}