package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 考核积分来源
 */
@Data
public class CheckIntegralSourceLog implements Serializable {
    private Integer id;

    private String integralAddtime;

    private Integer integralCount;

    private Integer userId;

    private String integralHandlers;

    private Integer integralType;

    private Integer integralSubordinateid;

    /*获取某一用户积分 start*/
    private String userNick;

    private String userTel;
    /*获取某一用户积分 end*/
}