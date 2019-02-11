package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 菜单表
 */
@Data
public class Menu implements Serializable {
    private Long id;

    private String code;

    private Integer pid;

    private String pcode;

    private String pcodes;

    private String name;

    private String url;
}