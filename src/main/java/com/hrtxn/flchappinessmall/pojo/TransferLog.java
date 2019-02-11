package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 转账记录
 */
@Data
public class TransferLog implements Serializable {
    private Integer id;

    private String transferAddtime;

    private Integer transferUserid;

    private Float transferMoney;

    private String transferRecevierTel;

    private Integer transferReceiverUserid;

    private String userNick;
}