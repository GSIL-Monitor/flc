package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.common.AjaxCommon;
import com.hrtxn.flchappinessmall.common.Res;
import com.hrtxn.flchappinessmall.common.Util;
import com.hrtxn.flchappinessmall.pojo.pojoVo.GoodsVo;
import com.hrtxn.flchappinessmall.service.GoodsService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-08 下午 5:21
 * Description:<产品Controller>
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;
    private Logger logger = Logger.getLogger(StoreController.class);


    /**
     * 获取到所有产品列表(2营销中/3下架/4违规下架)
     * @return
     */
    @RequestMapping("/getgoodsall")
    public ModelAndView getGoodsAll(ModelAndView modelAndView) {
        List<GoodsVo> goodsVoList = null;
        List<GoodsVo> isClassiyOneGoodsCount = null;
        try {
            //获取到所有产品列表(2营销中/3下架/4违规下架)
            goodsVoList = goodsService.getStatusAll();
            //获取各个一级分类下的产品数量 不统计删除状态
            isClassiyOneGoodsCount = goodsService.getIsClassiyOneGoodsCount();
        } catch (Exception e) {
            modelAndView.setViewName("error/500.jsp");
            logger.error("功能: 获取到所有产品列表 -- 出现异常方法: getGoodsAll ", e);
            e.printStackTrace();
            return modelAndView;
        }
        //存入产品集合
        modelAndView.addObject("goodsVoList", goodsVoList);
        //存入分类下产品数量
        modelAndView.addObject("isClassiyOneGoodsCount", isClassiyOneGoodsCount);
        //产品总数量
        modelAndView.addObject("goodsVoListSize", goodsVoList.size());
        modelAndView.setViewName("product/product_list.jsp");
        return modelAndView;
    }

    /**
     * 修改商品是否属于热销(平台)
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/modifyhot")
    public Res modifyPlateIsbelongHotFlag(Integer id) {
        Res res = new Res();
        try {
            goodsService.modifyPlateIsbelongHotFlag(id);
            res.setCode(AjaxCommon.RES_TRUE);//2000 成功
            res.setMsg("产品新品状态修改成功");
        } catch (Exception e) {
            res.setCode(AjaxCommon.RES_ERROR);
            res.setMsg("系统异常产品新品状态操作失败");
            logger.error("功能: 修改商品是否属于新品 -- 出现异常方法 modifyGoodsPlateIsbelongNewFlag ", e);
        }
        return res;
    }

    /**
     * 修改商品是否属于新品(平台)
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/modifynew")
    public Res modifyGoodsPlateIsbelongNewFlag(Integer id) {
        Res res = new Res();
        try {
            goodsService.modifyGoodsPlateIsbelongNewFlag(id);
            res.setCode(AjaxCommon.RES_TRUE);//2000 成功
            res.setMsg("产品新品状态修改成功");
        } catch (Exception e) {
            res.setCode(AjaxCommon.RES_ERROR);
            res.setMsg("系统异常产品新品状态操作失败");
            logger.error("功能: 修改商品是否属于新品 -- 出现异常方法 modifyGoodsPlateIsbelongNewFlag ", e);
        }
        return res;
    }


    /**
     * 商品下架
     *
     * @param id
     * @param reason
     * @return
     */
    @ResponseBody
    @RequestMapping("/goodssoldout")
    public Res goodsSoldOut(Integer id, String reason) {
        Res res = new Res();
        try {
            goodsService.goodsSoldOut(id, reason);
            res.setCode(AjaxCommon.RES_TRUE);//常量值: 2000 操作成功
            res.setMsg("商品下架成功");
        } catch (Exception e) {
            res.setCode(AjaxCommon.RES_ERROR);
            res.setMsg("服务器异常,请稍后重试");
            logger.error("功能: 商品下架 -- 出现异常方法 goodsSoldOut ", e);
        }
        return res;
    }


    /**
     * 根据商品id获取商品
     *
     * @param id
     * @param modelAndView
     * @return
     */
    @RequestMapping(/*method=RequestMethod.GET,*/value = "/getgoodsbyid")
    public ModelAndView getGoodsById(Integer id, ModelAndView modelAndView) {
        System.out.println("要查询的商品的id为:"+id);
        GoodsVo goodsVoById = null;
        try {
            goodsVoById = goodsService.getGoodsById(id);
        } catch (Exception e) {
            //出现异常就跳到指定500页面
            modelAndView.setViewName("error/500.jsp");
            logger.error("功能: 获取指定状态产品列表 -- 出现异常方法: getgoodsapplyforlist  ", e);
            return modelAndView;
        }
        //获取商品图片字符串
        String goodsPhoto = goodsVoById.getGoodsPhoto();
        String[] aa = goodsPhoto.split("|");
        for (String a : aa) {
            System.out.println("aaaaaaaaa:" + a);
        }
        //将字符串分割成list数组
        List<String> goodsPhotoList = Util.stringToList(",", goodsPhoto);
        //将图片地址存入model
        modelAndView.addObject("goodsPhotoList", goodsPhotoList);
        for (String g : goodsPhotoList) {
            System.err.println(g + "!!!!!!!!!!!!!!!!!!!!!!!");
        }
        modelAndView.setViewName("product/product_audit_detail.jsp");
        modelAndView.addObject("goodsVo", goodsVoById);

        return modelAndView;
    }

    /**
     * 删除某一条商品(逻辑删除)
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/delectgoods")
    public Res delectGoods(Integer id) {
        Res res = new Res();
        try {
            goodsService.removeGoods(id);
            res.setCode(AjaxCommon.RES_TRUE);
            res.setMsg("删除成功");
        } catch (Exception e) {
            logger.error("功能: 删除某一条商品 -- 出现异常方法: delectGoods ", e);
            res.setCode(AjaxCommon.RES_ERROR);
            res.setMsg("删除失败请稍后重试");
        }
        return res;
    }


    //=================================================================================================
    //================================产品申请模块=======================================================
    //=================================================================================================


    /**
     * 获取申请状态的产品
     */
    @RequestMapping("/goodsapplyforlist")
    public ModelAndView getGoodsapplyforlist(ModelAndView modelAndView) {
        List<GoodsVo> statusApplyForList = null;

        try {
            //获取申请状态的产品
            statusApplyForList = goodsService.getStatusApplyFor();
        } catch (Exception e) {
            //出现异常就跳到指定500页面
            modelAndView.setViewName("error/500.jsp");
            logger.error("功能: 获取申请状态的产品 -- 出现异常方法getgoodsapplyforlist ", e);
            return modelAndView;
        }
        if (statusApplyForList == null) {
            modelAndView.addObject("msg", "很抱歉数据未获取到,请稍后重试");
        }
        modelAndView.addObject("statusApplyForList", statusApplyForList);
        modelAndView.setViewName("product/product_audit.jsp");
        return modelAndView;
    }

    /**
     *  通过申请 并对商品分区
     * @param id
     * @param zone  商品的分区划分 1精品区/2消费区
     * @return
     */
    @ResponseBody
    @RequestMapping("/consentgoods")
    public Res consentGoods(Integer id ,Integer zone) {
        Res res = new Res();
        try {
            goodsService.consentGoods(id ,zone);
            res.setMsg("店铺通过审核成功!");
            res.setCode(AjaxCommon.RES_TRUE);//常量值: 2000 代表成功
        } catch (Exception e) {
            logger.error("功能: 通过申请 -- 出现异常方法: consentGoods ", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表系统异常
            res.setMsg("通过申请失败,请稍后重试!");
        }
        return res;
    }

    /**
     * 拒绝申请(驳回申请)
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/regectgoods")
    public Res rejectGoods(Integer id ,String regectMsg) {

        System.out.println("进入了regectgoods方法++++++++++++++++++++++++++++++");
        Res res = new Res();
        try {
            goodsService.rejectGoods(id,regectMsg);//regectMsg 驳回理由
            res.setCode(AjaxCommon.RES_TRUE);//常量值 200 代表操作成功
            res.setMsg("驳回申请成功!");

        } catch (Exception e) {
            res.setCode(AjaxCommon.RES_ERROR);//常量值500 代表系统异常
            res.setMsg("系统异常,请稍后重试");
            logger.error("功能: 拒绝申请(驳回申请) -- 出现异常方法: rejectGoods ", e);
        }
        return res;
    }

    /**
     * 获取被驳回商品列表
     * @param modelAndView
     * @return
     */
    @RequestMapping("/getgoodsreject")
    public ModelAndView getGoodsReject(ModelAndView modelAndView){
        List<GoodsVo> goodsReject = goodsService.getGoodsReject();
        for(GoodsVo goodsVo:goodsReject){
            System.err.println(goodsVo);
        }
        modelAndView.setViewName("product/prodect_rejected.jsp");
        //被驳回商品数量
        modelAndView.addObject("goodsVoListSize",goodsReject.size());
        modelAndView.addObject("goodsVoList",goodsReject);
        return modelAndView;
    }
}

