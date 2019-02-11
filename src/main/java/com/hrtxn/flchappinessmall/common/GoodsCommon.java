package com.hrtxn.flchappinessmall.common;

/**
 * Author:封润
 * Date:2018-10-08 下午 5:13
 * Description:<产品常量接口>
 */
public interface GoodsCommon {
    /**
     * 产品状态: 申请中
     */
    Integer GOODS_STATUS_APPLYFOR = 1;
    /**
     * 产品状态: 删除
     */
    Integer GOODS_STATUS_DELECT = -1;
    /**
     * 产品状态: 营销中
     */
    Integer GOODS_STATUS_MARKETING = 2;
    /**
     * 产品状态: 下架
     */
    Integer GOODS_STATUS_WEIGUI = 3;
    /**
     * 产品状态: 驳回
     */
    Integer GOODS_STATUS_REGECT = 5;
    /**
     * 产品状态: 违规下架
     */
    Integer GOODS_STATUS_WEIGUIXIAJIA = 4;
    /**
     * 产品状态: 属于新品
     */
    Integer PLATE_ISBELONG_NEW_FLAG_TRUE =1;
    /**
     * 产品状态: 不属于新品
     */
    Integer PLATE_ISBELONG_NEW_FLAG_FALSE =2;
    /**
     * 产品状态: 属于热销
     */
    Integer PATE_ISBELONG_HOT_FLAG_TRUE =1;
    /**
     * 产品状态: 不属于热销
     */
    Integer PATE_ISBELONG_HOT_FLAG_FALSE =2;

    /**
     * 产品对应区域 :精品区
     */
    Integer GOODS_ZONE_JINGPIN=1;
    /**
     * 产品对应区域 :消费区
     */
    Integer GOODS_ZONE_XIAOFEI=2;



}
