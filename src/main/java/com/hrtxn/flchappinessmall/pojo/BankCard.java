package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 银行卡
 */
@Data
public class BankCard implements Serializable {
    private Integer id;

    private String cardUserName;

    private String cardName;

    private String cardCount;

    private String cardUserTel;

    private String cardAddress;

    private Integer userId;
}