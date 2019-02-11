package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 菜单与角色中间类
 */
@Data
public class Relation implements Serializable {
    private Integer id;

    private Long menuid;

    private Integer roleid;
}