package com.hrtxn.flchappinessmall.pojo.pojoVo;

/**
 * Author:封润
 * Date:2018-11-04 下午 4:08
 * Description:<描述>
 */

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 菜单表
 */
@Data
public class MenuVo implements Serializable {
    private Long id;

    private String code;

    private Integer pid;

    private String pcode;

    private String pcodes;

    private String name;

    private String url;


    /**
     * 子菜单集合
     */
    private List<MenuVo> menuVoList;
}