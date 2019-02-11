package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 广告实体类
 */
@Data
public class Advertise implements Serializable {
    private Integer id;

    private String adverAddtime;

    private Integer adverLocation;

    private Integer adverPlatform;

    private String adverImageurl;

    private String adverContent;

    private String adverContenturl;

    private Integer adverType;

    private Integer adverHandlersType;

    private String adverHandlersName;
}