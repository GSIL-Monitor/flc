package com.hrtxn.flchappinessmall.pojo.pojoVo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Author:封润
 * Date:2018-10-26 下午 2:20
 * Description:<分类Vo>
 */
@Data
public class ClassifyTypeVo implements Serializable {

    private Integer id;
    private String name;
    private Integer type;
    private List<ClassifyTypeVo> classifyTypeVoList;
}
