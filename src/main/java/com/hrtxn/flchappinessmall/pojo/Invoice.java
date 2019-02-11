package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 发票
 */
@Data
public class Invoice implements Serializable {
    private Integer id;

    private Integer invoiceType;

    private String invoiceTitle;

    private String invoiceCompany;

    private String invoiceDutyParagraph;

    private String invoiceOpenBank;

    private String invoiceBankCard;

    private String invoiceCompayAddress;

    private String invoiceTel;

    private Integer userId;
}