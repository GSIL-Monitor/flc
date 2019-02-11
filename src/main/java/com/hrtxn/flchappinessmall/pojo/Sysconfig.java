package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 系统配置
 */
@Data
public class Sysconfig implements Serializable {
    private Integer id;

    private Integer touristsShopDiscount;

    private Double withdrawalChargePer;

    private Double boutiqueAreaPer;

    private Double consumeAreaPer;

    private Integer primaryCareerIntegralRules;

    private Integer primaryCareerContinuousMonth;

    private Integer primaryCareerPersonalIntegral;

    private Integer advancedCareerIntegralRules;

    private Integer advancedCareerContinuousMonth;

    private Integer advancedCareerPersonalIntegral;

    private Integer initiateCareerIntegralRules;

    private Integer initiateCareerContinuousMonth;

    private Integer initiateCareerPersonalIntegral;

    private Double operatingCostsPer;

    private Double specialContributeAward;

    private Integer yearProfitContinuousMonth;

    private Double recommendShopColumn;

    private Double dayProfitPer;

    private Double weekProfitPer;

    private Double monthProfitPer;

    private Double quarterProfitPer;

    private Double yearProfitPer;

    private Double onePartnerPer;

    private Double twoPartnerPer;

    private String copyright;

    private Integer automaticReceivingTime;

    private Integer automaticEvaluateTime;

    private Integer weixinPayFlag;

    private Integer aliPayFlag;

    private Integer unionpayPayFlag;

    private Integer shareprofitPayFlag;

    private String sensitiveWord;

    private String keywords;

    private String description;
}