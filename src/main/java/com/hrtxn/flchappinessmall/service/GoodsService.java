package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.Goods;
import com.hrtxn.flchappinessmall.pojo.pojoVo.GoodsVo;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-08 下午 5:06
 * Description:<产品service>
 */
public interface GoodsService {
    /**
     * 获取到所有产品列表(2营销中/3下架/4违规下架)
     * @return
     */
    public List<GoodsVo> getStatusAll();

    /**
     * 获取各个一级分类下的产品数量 不统计删除状态
     * @return
     */
    public List<GoodsVo> getIsClassiyOneGoodsCount();

    /**
     * 商品新品状态改变
     * @param id
     */
    public void modifyGoodsPlateIsbelongNewFlag(Integer id);

    /**
     * 商品热销状态改变
     * @param id
     */
    public void modifyPlateIsbelongHotFlag(Integer id);

    /**
     * 商品下架
     * @param id
     * @param reason
     */
    public void goodsSoldOut(Integer id,String reason);

    /**
     *获取申请状态的产品
     * @return
     */
    public List<GoodsVo> getStatusApplyFor();

    /**
     * 获取指定状态的某一条产品
     * @param id
     */
    public GoodsVo getGoodsById(Integer id);
    /**
     * 删除商品
     */
    public void removeGoods(Integer id);

    /**
     * 通过商品申请
     */
    public void consentGoods(Integer id , Integer zone) throws Exception;

    /**
     * 获取被驳回商品列表
     */
    public List<GoodsVo> getGoodsReject();

    /**
     * 驳回产品申请
     * @param id
     */
    public void rejectGoods(Integer id,String msg);


    /**
     * 获取所有商品(不包含删除状态)
     * @return
     */
    List<Goods> getGoodsAll();

    /**
     * 获取指定状态的商品
     * @param status
     * @return
     */
    List<GoodsVo> getGoodsByStatus(Integer status);


    /**
     * 获取所有商品的所有评价 (不包含删除状态的商品评价)
     * @return
     */
    Integer getEvaluteCount();

    /**
     * 根据品牌Id获取商品 商品状态:销售中
     * @param brandId
     * @return
     */
     List<Goods> selectByBrandIdStatusTwo(Integer brandId);
}
