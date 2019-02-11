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
 * Description: 文章控制类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Controller
@RequestMapping("/admin")
public class PayMentController {
    @Autowired
    private SysconfigService sysconfigService;

    private Logger logger = Logger.getLogger(PayMentController.class);

    /**
     * 获取支付方式
     * @return
     */
    @RequestMapping("/go_payment_method")
    public ModelAndView go_payment_method(){
        try {
            ModelAndView modelAndView = new ModelAndView("payment/payment_method.jsp");
            Sysconfig sysconfig = sysconfigService.getSysConfig();
            modelAndView.addObject("sysconfig",sysconfig);
            return modelAndView;
        }catch (Exception e){
            logger.error("获取支付方式出错",e);
        }
        return null;
    }

    /**
     * 修改系统分数（支付方式显示）
     * @param type
     * @param flag
     * @param id
     * @return
     */
    @RequestMapping("/update_paySysConfig")
    @ResponseBody
    public boolean update_sysConfig(
       @RequestParam("type") Integer type,
       @RequestParam("flag") Integer flag,
       @RequestParam("id") Integer id){
        try {
            Sysconfig sysconfig = new Sysconfig();
            if (type == 1){//支付宝
                sysconfig.setAliPayFlag(flag);
            }else if (type == 2){//微信
                sysconfig.setWeixinPayFlag(flag);
            }else if (type == 3){//银联
                sysconfig.setUnionpayPayFlag(flag);
            }else {//分红
                sysconfig.setShareprofitPayFlag(flag);
            }
            sysconfig.setId(id);
            return sysconfigService.update_sysConfig(sysconfig) > 0 ? true : false;
        }catch (Exception e){
            logger.error("修改系统分数（支付方式显示）出错",e);
        }
        return false;
    }
}
