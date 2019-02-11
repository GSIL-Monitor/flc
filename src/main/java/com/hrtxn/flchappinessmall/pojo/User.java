package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;
/**
 * Description: 用户<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Data
public class User implements Serializable {
    private Integer id;

    private String userAddtime;

    private String userPrimaryCareerTime;

    private String userAdvancedCareerTime;

    private String userInitiateCareerTime;

    private String lastLoginTime;

    private String loginIp;

    private String userShareid;

    private String userNick;

    private String userPassword;

    private String userPayPassword;

    private String userTruename;

    private String userIdNumber;

    private String userTel;

    private String userAlipayAccount;

    private Integer userRole;

    private Float userProfitAccount;

    private Integer userPersonalIntegral;

    private Integer userDistributionIntegral;

    private Integer userPersonalMonthIntegral;

    private Integer userPersonalLastmonthIntegral;

    private Float userSharprofitCount;

    private Float userSharprofitMonth;

    private Integer userStatus;

    private String parentShareid;

    private Integer agreementLevel;

    private String qrCodeUrl;

    private Integer yearProfitContinuousMonth;

    private Integer userCheckIntegral;
}
