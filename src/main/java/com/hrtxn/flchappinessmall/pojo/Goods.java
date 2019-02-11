package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 商品
 */
@Data
public class Goods implements Serializable {
    private Integer id;

    private String goodsAddtime;

    private String goodsName;

    private String goodsParameter;

    private String goodsPhoto;

    private Integer brandId;

    private Integer oneClassifyid;

    private Integer twoClassifyid;

    private Integer threeClassifyid;

    private Integer goodsInventory;

    private Float goodsWeight;

    private String goodsDispatchPlace;

    private Integer goodsSalesVolume;

    private Integer invoiceIssupportFlag;

    private Integer goodsStatus;

    private Integer goodsZone;

    private Float goodsSupplyPrice;

    private Float goodsRetailPrice;

    private Integer goodsIntegral;

    private Float goodsTaxes;

    private Float goodsFreight;

    private Integer storeId;

    private Integer storeIsbelongNewFlag;

    private Integer storeIsbelongHotFlag;

    private Integer plateIsbelongNewFlag;

    private Integer plateIsbelongHotFlag;

    private String goodsDetails;

    private String forceSoldOutReason;

    private String rejectReason;
}