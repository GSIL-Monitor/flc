package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 品牌
 */
@Data
public class Brand implements Serializable {
    private Integer id;

    private String brandAddtime;

    private String brandName;

    private String brandLogo;

    private Integer brandType;

    private String brandDescription;
}