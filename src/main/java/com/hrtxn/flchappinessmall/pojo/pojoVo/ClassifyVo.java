package com.hrtxn.flchappinessmall.pojo.pojoVo;

import lombok.Data;

import java.io.Serializable;

/**
 * Author:封润
 * Date:2018-10-26 下午 1:49
 * Description:<分类Vo>
 */
@Data
public class ClassifyVo implements Serializable {
    private Integer id;

    private String classifyAddtime;

    private String classifyName;

    private Integer classifyLevel;

    private Integer classifyParentid;

    private String classifyLogo;

    private Integer classifyType;

    private String classifyDescription;

}
