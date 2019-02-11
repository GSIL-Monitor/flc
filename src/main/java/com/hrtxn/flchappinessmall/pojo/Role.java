package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 角色
 */
@Data
public class Role implements Serializable {
    private Integer id;

    private String name;

    private String tips;

    private String addtime;

}