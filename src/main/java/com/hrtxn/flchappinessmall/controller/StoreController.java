package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.common.AjaxCommon;
import com.hrtxn.flchappinessmall.common.Res;
import com.hrtxn.flchappinessmall.exception.StoreStatusException;
import com.hrtxn.flchappinessmall.pojo.Store;
import com.hrtxn.flchappinessmall.pojo.pojoVo.StoreVo;
import com.hrtxn.flchappinessmall.service.StoreService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Author:封润
 * Date:2018-10-05 下午 3:09
 * Description:<描述>
 */
@Controller
@RequestMapping("/store")
public class StoreController {

    @Autowired
    private StoreService storeService;

    private Logger logger=Logger.getLogger(StoreController.class);

    /**
     * @param request
     * @param response
     * @param modelAndView
     * @return 查詢所有商鋪列表 不包括删除和待审核状态的店铺
     */
    @RequestMapping("/getstore")
    public ModelAndView getStoreList(HttpServletRequest request, HttpServletResponse response,ModelAndView modelAndView){
        List<Store> storeList = null;
        List<StoreVo> byClassifyCount=null;


        try {
            storeList = storeService.getStoreList();
            //获取一级分类名和其所有店铺数量
            byClassifyCount= storeService.getByClassifyCount();
        } catch (Exception e) {
            logger.error("查詢所有商鋪列表(getStoreList)系統异常,请稍后重试",e);
        }

        if (storeList!=null&&byClassifyCount!=null){
            modelAndView.addObject("storeList", storeList);
            modelAndView.addObject("byClassifyCount", byClassifyCount);
        }else {
            modelAndView.addObject("msg","很抱歉,数据获取失败请稍后重试");
        }

        //获取所有商铺总量
        Integer storeSize=storeList.size();
        modelAndView.setViewName("store/Shop_list.jsp");//显示所有商铺列表页面
        modelAndView.addObject("storeSize",storeSize);//将总量存入model
        modelAndView.addObject("storeList", storeList);
        return  modelAndView;
    }
    /**
     * 启用禁用
     */
    @ResponseBody
    @RequestMapping("/modifystatus")
    public Res modifyStatus(Integer id){
        Res res = new Res();
        try {
            storeService.modifyStoreStatus(id);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 表示操作成功
            res.setMsg("修改成功");
        } catch (StoreStatusException e) {
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 表示操作失败
            res.setMsg(e.getMessage());
            logger.error("启用禁用(modifyStatus)服务器异常,请稍后重试",e);
        }catch (Exception e){
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 表示服务器内部异常
            res.setMsg("系统异常,请稍后重试");
            logger.error("启用禁用(modifyStatus)系統异常,请稍后重试",e);

        }
        return res;

    }

    /**
     * 逻辑删除店铺
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/removerstore")
    public Res removerStore(Integer id){
        Res res = new Res();
        try {
            storeService.removerStore(id);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 表示操作成功
            res.setMsg("删除成功");
        } catch (StoreStatusException e) {
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 表示操作失败
            res.setMsg(e.getMessage());
            logger.error("逻辑删除店铺(removerStore)服务器异常,请稍后重试",e);
        }catch (Exception e){
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 表示服务器内部异常
            res.setMsg("系统异常,请稍后重试");
            logger.error("逻辑删除店铺(removerStore)系統异常,请稍后重试",e);
        }
        return res;
    }

    /**
     * 根据id 获取商铺详情
     * @param id
     * @param audit  识别字符串 判断是在审核页面发送的请求还是所有店铺列表发送的请求
     * @param modelAndView
     * @return
     */
    @RequestMapping(method=RequestMethod.GET,value = "/getstorebyid")
    public ModelAndView getStoreById(Integer id,String audit,ModelAndView modelAndView){
       //根据Id获取到店铺对象
        Store store = null;
        try {
            store = storeService.getStoreById(id);
        } catch (Exception e) {
            logger.error("逻辑删除店铺(removerStore)系統异常,请稍后重试",e);
        }
        //如果是在审核页面发送来的查询商铺详情的请求,那么就返回至这个页面
        if("audit".equals(audit)){
            modelAndView.setViewName("store/shopping_audit_detailed.jsp");//待审核某一条商铺详情页面
        }else if ("reject".equals(audit)){
            modelAndView.setViewName("store/shopping_rejected_con.jsp");//已驳回申请的某一条商铺详情页面
        }else {
            modelAndView.setViewName("store/shopping_detailed.jsp");//某一商铺详情页面
        }
        if (store!=null){
            modelAndView.addObject("store",store);
        }else {
            modelAndView.addObject("msg","很抱歉,数据获取失败请稍后重试");
        }
        return modelAndView;
    }








//========================================================================================================
//=================================店铺审核页面功能==========================================================
//========================================================================================================

    /**
     * 获取待审核状态的商铺
     * @param modelAndView
     * @return
     */
    @RequestMapping("/getstoreauditlist")
    public ModelAndView getStoreAuditList(ModelAndView modelAndView){
        List<Store> storeAuditList = null;
        try {
            storeAuditList = storeService.getStoreStatusAuditList();
        } catch (Exception e) {
            logger.error("逻辑删除店铺(removerStore)系統异常,请稍后重试",e);
        }
        modelAndView.setViewName("store/Shops_Audit.jsp");//待审核列表页面

        if (storeAuditList!=null){
            modelAndView.addObject("storeAuditListLength",storeAuditList.size());
            modelAndView.addObject("storeAuditList",storeAuditList);
        }else {
            modelAndView.addObject("msg","请求错误,无此待审核店铺");
        }

        return  modelAndView;
    }

    /**
     * 店铺审核通过
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/modifystatuspass")
    public Res modifyStatusPass(Integer id){
        Res res = new Res();
        try {
            storeService.modifyStoreStatusPass(id);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 表示操作成功
            res.setMsg("成功通过审核");
        } catch (StoreStatusException e) {
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 表示操作失败
            res.setMsg(e.getMessage());
            logger.error("店铺审核通过(modifyStatusPass)服务器异常,请稍后重试",e);
        }catch (Exception e){
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 表示服务器内部异常
            res.setMsg("系統异常,请稍后重试");
            logger.error("店铺审核通过(modifyStatusPass)系統异常,请稍后重试",e);
        }
        return res;

    }
    /**
     * 店铺审核驳回
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/modifystatusreject")
    public Res modifyStatusReject(Integer id ,String reason){
        Res res = new Res();
        try {
            storeService.modifyStoreStatusReject(id,reason);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 表示操作成功
            res.setMsg("通过审核成功");
        } catch (StoreStatusException e) {
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 表示操作失败
            res.setMsg(e.getMessage());
            logger.error("店铺审核驳回(modifyStatusReject)服务器异常,请稍后重试",e);
        }catch (Exception e){
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 表示服务器内部异常
            res.setMsg("系统异常,请稍后重试");
            logger.error("店铺审核驳回(modifyStatusReject)系统异常,请稍后重试",e);
        }
        return res;

    }
    /**
     * 获取被驳回状态店铺
     */
    @RequestMapping("/getstorerejectlist")
    public  ModelAndView getStoreRejectList(ModelAndView modelAndView){
        List<Store> storeStatusRejectList = null;
        try {
            storeStatusRejectList = storeService.getStoreStatusRejectList();
        } catch (Exception e) {
            logger.error("逻辑删除店铺(removerStore)系統异常,请稍后重试",e);
        }
        modelAndView.setViewName("store/Shops_rejected.jsp");//驳回列表页面

        if(storeStatusRejectList!=null){
            modelAndView.addObject("storeStatusRejectList",storeStatusRejectList.size());
            modelAndView.addObject("storeAuditList",storeStatusRejectList);
        }else {
            modelAndView.addObject("msg","请求错误,无此待审核店铺");
        }
        return  modelAndView;
    }
}
