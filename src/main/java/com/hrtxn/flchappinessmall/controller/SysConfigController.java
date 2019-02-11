package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.pojo.Sysconfig;
import com.hrtxn.flchappinessmall.service.SysconfigService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description: 系统参数控制类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Controller
@RequestMapping("/admin")
public class SysConfigController {

    @Autowired
    private SysconfigService sysConfigService;

    private Logger logger = Logger.getLogger(SysConfigController.class);

    /**
     * 跳转系统配置页面
     * @return
     */
    @RequestMapping("/go_systems")
    public ModelAndView go_systems(
            @RequestParam(value = "id",required = false) Integer id
    ){
        try {
            ModelAndView modelAndView = new ModelAndView("systemconfig/systems.jsp");
            Sysconfig sysconfig = sysConfigService.getSysConfig();
            modelAndView.addObject("sysconfig",sysconfig);
            return modelAndView;
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("跳转系统配置页面出错",e);
        }
        return null;
    }

    /**
     * 修改系统参数
     * @param automaticReceivingTime
     * @param automaticEvaluateTime
     * @param copyright
     * @param id
     * @return
     */
    @RequestMapping("/update_sysConfig")
    @ResponseBody
    public boolean update_sysConfig(
        @RequestParam(value = "touristsShopDiscount",required = false) Integer touristsShopDiscount,
        @RequestParam(value = "withdrawalChargePer",required = false) Double withdrawalChargePer,
        @RequestParam(value = "boutiqueAreaPer",required = false) Double boutiqueAreaPer,
        @RequestParam(value = "consumeAreaPer",required = false) Double consumeAreaPer,
        @RequestParam(value = "primaryCareerIntegralRules",required = false) Integer primaryCareerIntegralRules,
        @RequestParam(value = "advancedCareerIntegralRules",required = false) Integer advancedCareerIntegralRules,
        @RequestParam(value = "initiateCareerIntegralRules",required = false) Integer initiateCareerIntegralRules,
        @RequestParam(value = "primaryCareerContinuousMonth",required = false) Integer primaryCareerContinuousMonth,
        @RequestParam(value = "advancedCareerContinuousMonth",required = false) Integer advancedCareerContinuousMonth,
        @RequestParam(value = "initiateCareerContinuousMonth",required = false) Integer initiateCareerContinuousMonth,
        @RequestParam(value = "primaryCareerPersonalIntegral",required = false) Integer primaryCareerPersonalIntegral,
        @RequestParam(value = "advancedCareerPersonalIntegral",required = false) Integer advancedCareerPersonalIntegral,
        @RequestParam(value = "initiateCareerPersonalIntegral",required = false) Integer initiateCareerPersonalIntegral,
        @RequestParam(value = "operatingCostsPer",required = false) Double operatingCostsPer,
        @RequestParam(value = "specialContributeAward",required = false) Double specialContributeAward,
        @RequestParam(value = "recommendShopColumn",required = false) Double recommendShopColumn,
        @RequestParam(value = "dayProfitPer",required = false) Double dayProfitPer,
        @RequestParam(value = "weekProfitPer",required = false) Double weekProfitPer,
        @RequestParam(value = "monthProfitPer",required = false) Double monthProfitPer,
        @RequestParam(value = "quarterProfitPer",required = false) Double quarterProfitPer,
        @RequestParam(value = "yearProfitPer",required = false) Double yearProfitPer,
        @RequestParam(value = "onePartnerPer",required = false) Double onePartnerPer,
        @RequestParam(value = "twoPartnerPer",required = false) Double twoPartnerPer,

        @RequestParam(value = "automaticReceivingTime",required = false) Integer automaticReceivingTime,
        @RequestParam(value = "automaticEvaluateTime",required = false) Integer automaticEvaluateTime,
        @RequestParam(value = "copyright",required = false) String copyright,
        @RequestParam(value = "keywords",required = false) String keywords,
        @RequestParam(value = "description",required = false) String description,
        @RequestParam(value = "id",required = false) Integer id){
        try {
            Sysconfig sysconfig = new Sysconfig();
            //基本参数设置
            sysconfig.setTouristsShopDiscount(touristsShopDiscount);
            sysconfig.setWithdrawalChargePer(withdrawalChargePer);
            sysconfig.setBoutiqueAreaPer(boutiqueAreaPer);
            sysconfig.setConsumeAreaPer(consumeAreaPer);
            sysconfig.setPrimaryCareerIntegralRules(primaryCareerIntegralRules);
            sysconfig.setAdvancedCareerIntegralRules(advancedCareerIntegralRules);
            sysconfig.setInitiateCareerIntegralRules(initiateCareerIntegralRules);
            sysconfig.setPrimaryCareerContinuousMonth(primaryCareerContinuousMonth);
            sysconfig.setAdvancedCareerContinuousMonth(advancedCareerContinuousMonth);
            sysconfig.setInitiateCareerContinuousMonth(initiateCareerContinuousMonth);
            sysconfig.setPrimaryCareerPersonalIntegral(primaryCareerPersonalIntegral);
            sysconfig.setAdvancedCareerPersonalIntegral(advancedCareerPersonalIntegral);
            sysconfig.setInitiateCareerPersonalIntegral(initiateCareerPersonalIntegral);
            sysconfig.setOperatingCostsPer(operatingCostsPer);
            sysconfig.setSpecialContributeAward(specialContributeAward);
            sysconfig.setRecommendShopColumn(recommendShopColumn);
            sysconfig.setDayProfitPer(dayProfitPer);
            sysconfig.setWeekProfitPer(weekProfitPer);
            sysconfig.setMonthProfitPer(monthProfitPer);
            sysconfig.setQuarterProfitPer(quarterProfitPer);
            sysconfig.setYearProfitPer(yearProfitPer);
            sysconfig.setOnePartnerPer(onePartnerPer);
            sysconfig.setTwoPartnerPer(twoPartnerPer);

            //时间基本设置
            sysconfig.setAutomaticReceivingTime(automaticReceivingTime);
            sysconfig.setAutomaticEvaluateTime(automaticEvaluateTime);
            //底部版权信息设置
            sysconfig.setCopyright(copyright);
            //关键词设置
            sysconfig.setKeywords(keywords);
            sysconfig.setDescription(description);

            sysconfig.setId(id);
            return sysConfigService.update_sysConfig(sysconfig) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("修改系统参数出错",e);
        }
        return false;
    }
}
