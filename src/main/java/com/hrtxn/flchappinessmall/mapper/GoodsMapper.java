package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Goods;
import com.hrtxn.flchappinessmall.pojo.pojoVo.GoodsVo;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-08 下午 4:26
 * Description:<产品mapper>
 */
public interface GoodsMapper {
    /**
     * 获取指定2营销中/3下架/4违规下架状态产品
     *
     * @return
     */
    public List<GoodsVo> selectStatusAll();

    /**
     * 获取各个一级分类下的产品数量 不包含删除状态
     */
    public List<GoodsVo> selectIsClassiyOneGoodsCount();

    /**
     * 获取指定状态的产品
     *
     * @return
     */
    public List<GoodsVo> getGoodsList(Integer status);

    /**
     * 获取指定状态的某一条产品
     *
     * @param id
     * @param
     * @return
     */
    public GoodsVo selectGoodsById(Integer id);

    /**
     * 修改商品信息 动态sql
     *
     * @param goods
     */
    public void updateByPrimaryKeySelective(Goods goods);

    /**
     * 获取被驳回商品列表
     *
     * @return
     */
    public List<GoodsVo> selectReject();

    /**
     * 根据品牌id获取商品
     *
     * @param brandId
     * @return
     */
    public List<GoodsVo> selectByBrandId(Integer brandId);

    /**
     * 根据品牌Id获取商品 商品状态:销售中
     * @param brandId
     * @return
     */
    public List<Goods> selectByBrandIdStatusTwo(Integer brandId);

    /**
     * 根据一级分类Id获取产品  不包含删除状态
     *
     * @param classifyId
     * @return
     */
    List<GoodsVo> selectGoodsByOneClassifyId(Integer classifyId);

    /**
     * 根据二级分类Id获取产品  不包含删除状态
     *
     * @param classifyId
     * @return
     */
    List<GoodsVo> selectGoodsByTwoClassifyId(Integer classifyId);

    /**
     * 根据二级分类Id获取产品  不包含删除状态
     *
     * @param classifyId
     * @return
     */
    List<GoodsVo> selectGoodsByThreeClassifyId(Integer classifyId);

    /**
     * 获取所有商品(不包含删除状态)
     * @return
     */
    List<Goods> selectGoodsAll();

    /**
     * 获取所有商品的所有评价 (不包含删除状态的商品评价)
     * @return
     */
    Integer selectEvaluteCount();
}
