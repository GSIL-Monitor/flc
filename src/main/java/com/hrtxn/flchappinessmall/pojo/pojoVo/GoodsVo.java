package com.hrtxn.flchappinessmall.pojo.pojoVo;

import lombok.Data;

import java.io.Serializable;

/**
 * 商品
 */
@Data
public class GoodsVo implements Serializable {


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
    /**
     * 强制关闭理由
     */
    private String forceSoldOutReason;
    /**
     * 三级分类名
     */
    private String threeClassifyName;
    /**
     * 二级分类名
     */
    private String twoClassifyName;
    /**
     * 一级分类名
     */
    private String oneClassifyName;

    /**
     * 一级分类下的产品数量
     */
    private  Integer isClassiyOneGoodsCount;

    /**
     * 商铺名
     */
    private String storeName;
    /**
     * 品牌名
     */
    private String brandName;

    /**
     * 驳回原因
     */
    private String rejectReason;


}