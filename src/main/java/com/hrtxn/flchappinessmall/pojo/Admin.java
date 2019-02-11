package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 管理员实体类
 */
@Data
public class Admin implements Serializable {
    private Integer id;

    private String adminNickName;

    private String adminAddtime;

    private String adminPassword;

    private String adminTrueName;

    private String adminTel;

    private Integer adminJurisdictionid;

    private String adminRemark;

    private String adminLastLoginTime;

    private String adminLoginIP;

    private String name;

    private Integer adminRoleId;
}
