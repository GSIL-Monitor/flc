package com.hrtxn.flchappinessmall.common;

/**
 * Author:封润
 * Date:2018-10-26 上午 9:34
 * Description:<分类常量接口>
 */
public interface ClassifyCommon {

    /**
     * 分类级别 代表一级分类
     */
    Integer CLASSIFY_LEVEL_ONE = 1;

    /**
     * 分类级别 代表二级分类
     */
    Integer CLASSIFY_LEVEL_TWO = 2;

    /**
     * 分类级别 代表三级分类
     */
    Integer CLASSIFY_LEVEL_THREE = 3;

    /**
     * 分类状态  显示
     */
    Integer CLASSIFY_TYPE_TRUE = 1;
    /**
     * 分类状态  隐藏
     */
    Integer CLASSIFY_TYPE_FALSE = 2;

    /**
     * 推荐状态:否
     */
    Integer QUXIAOTUIJIAN=0;
    /**
     * 推荐状态: 是
     */
    Integer TUIJIAN=1;
}
