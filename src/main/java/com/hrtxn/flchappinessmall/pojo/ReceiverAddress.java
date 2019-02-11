package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 收货地址
 */
@Data
public class ReceiverAddress implements Serializable {
    private Integer id;

    private String receiverName;

    private String receiverTel;

    private String receiverProvince;

    private String receiverCity;

    private String receiverDistrict;

    private String receiverDetailedAddress;

    private String receiverPostcode;

    private Integer defaultAddressFlag;

    private Integer receiverUserId;
}