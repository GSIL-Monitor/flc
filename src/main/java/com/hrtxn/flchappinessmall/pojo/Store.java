package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 商铺
 */
@Data
public class Store  implements Serializable {
    private Integer id;

    private String storeAddtime;

    private String company;

    private String businessLicensePhotograph;

    private Integer registeredCapital;

    private String registeredNumber;

    private String socialCreditCode;

    private String companyEstablishmentDate;

    private String operatingPeriod;

    private String approvalDate;

    private String companyRegisteredAddress;

    private String legalPersonName;

    private String legalPersonIdCode;

    private String legalPersonCodeFrontPhoto;

    private String legalPersonCodeReversePhoto;

    private String cardCount;

    private String cardName;

    private String cardOpenAccountPhoto;

    private String cardOpenAccountAddress;

    private String companyPermanentAddress;

    private String tradeMarkName;

    private String tradeMarkRegistPeople;

    private String tradeMarkRegistPhoto;

    private String tradeMarkAuthorizationPhoto;

    private String productionLicenseNumber;

    private String productionLicenseValidDate;

    private String productionLicensePhoto;

    private String businessLicenseNumber;

    private String businessLicenseValidDate;

    private String businessLicensePhoto;

    private String actualOperatorName;

    private String actualOperatorQq;

    private String actualOperatorWeixin;

    private String actualOperatorTel;

    private String actualOperatorEmail;

    private String generalLeaderName;

    private String generalLeaderTel;

    private String generalLeaderWeixin;

    private String referrerName;

    private String referrerLevel;

    private String referrerId;

    private String referrerTel;

    private String serviceAmount;

    private String workTime;

    private String generalTaxpayerPhoto;

    private String productTestReportPhoto;

    private String storeName;

    private String storeContactPeople;

    private String storeContactPeopleTel;

    private String serverQq;

    private String storeLogo;

    private String storePayPassword;

    private String storeNick;

    private String storePassword;

    private String storeNumber;

    private Integer storeStatus;

    private Integer storeClassify;

    private String businessScope;

    private String storeIntroduce;

    private String rejectReason;

    private Float storeAccount;

    private String classifyName;
}