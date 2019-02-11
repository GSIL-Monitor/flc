package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 分类
 */
@Data
public class Classify implements Serializable {
    private Integer id;

    private String classifyAddtime;

    private String classifyName;

    private Integer classifyLevel;

    private Integer classifyParentid;

    private String classifyLogo;

    private Integer classifyType;

    private String classifyDescription;

    private Integer classifyIndex;
}