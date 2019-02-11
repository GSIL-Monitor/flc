package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 购物车
 */
@Data
public class ShoppingTrolley implements Serializable {
    private Integer userId;

    private Integer goodsId;

    private String addtime;
}