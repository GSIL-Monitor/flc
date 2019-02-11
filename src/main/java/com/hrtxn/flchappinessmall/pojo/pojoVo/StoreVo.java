package com.hrtxn.flchappinessmall.pojo.pojoVo;

import lombok.Data;

import java.io.Serializable;

/**
 * Author:封润
 * Date:2018-10-08 上午 11:51
 * Description:<页面展示父级分类下所有店铺>
 */
@Data
public class StoreVo implements Serializable {
    /**
     * 所有商铺数量
     */
    private Integer storeVoCount;
    /**
     * 商铺名称
     */
    private String classifyName;
    /**
     * 商铺数量总量
     */
    private  Integer sumStorelength;





}
