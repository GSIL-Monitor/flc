package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 关注商铺
 */
@Data
public class UserAttentionStore implements Serializable {
    private Integer userId;

    private Integer storeId;
}