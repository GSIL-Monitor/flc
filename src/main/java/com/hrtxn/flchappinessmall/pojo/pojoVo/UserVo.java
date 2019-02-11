package com.hrtxn.flchappinessmall.pojo.pojoVo;

import com.hrtxn.flchappinessmall.pojo.Store;
import lombok.Data;

import java.io.Serializable;

/**
 * Author:封润
 * Date:2018-11-22 下午 2:25
 * Description:<描述>
 */
@Data
public class UserVo implements Serializable {

    private Store store;//用户推荐的店铺

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
