package com.hrtxn.flchappinessmall.pojo.pojoVo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Author:封润
 * Date:2018-10-31 下午 2:38
 * Description:<描述>
 */
@Data
public class AdminVo implements Serializable {

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
    //角色Id
    private Integer adminRoleId;

    //角色名称
    private String roleName;
    private  RoleVo roleVo;
    /**
     * 拥有菜单集合
     */
    private List<MenuVo> menuVoList;
}
