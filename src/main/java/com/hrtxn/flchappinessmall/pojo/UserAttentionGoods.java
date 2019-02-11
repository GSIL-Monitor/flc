package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 收藏商品
 */
@Data
public class UserAttentionGoods implements Serializable {
    private Integer userId;

    private Integer goodsId;
}