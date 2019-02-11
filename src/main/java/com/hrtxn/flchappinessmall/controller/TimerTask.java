package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.pojo.Sysconfig;
import com.hrtxn.flchappinessmall.pojo.User;
import com.hrtxn.flchappinessmall.service.SysconfigService;
import com.hrtxn.flchappinessmall.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Author:helloboy
 * Date:2018-11-05 11:09
 * Description:<描述>
 */
@Controller
@Transactional(propagation = Propagation.REQUIRED ,rollbackFor = Exception.class )
public class TimerTask {

    @Autowired
    private UserService userService;
    @Autowired
    private SysconfigService sysconfigService;

    private Logger logger = Logger.getLogger(UserController.class);
    /**
     * 各职位对应的个人的消费积分达到标准后，月份添加
     * 每月一号凌晨执行0 0 0 1 * ?
     *
     * cron="0 0 0 1 * ?"
     * 第一个0: 秒
     * 第二个0:分钟
     * 第三个0:小时
     * 第四个1:天
     * 第五个*:月份, 代表所有可能的月份
     * 第六个?:表示不指定值
     */
    @Scheduled(cron = "0 0 0 1 * ?")
    public void execute(){
        try {
            //获取所有用户
            List<User> userList = userService.getAllUserList();
            if (userList.size() > 0){
                Sysconfig sysConfig = sysconfigService.getSysConfig();
                for (User user : userList){
                    User user1 = new User();
                    User userMSGByUserId = userService.getUserMSGByUserId(user.getId());
                    //将个人当月消费积分转换到个人上月消费积分
                    if (userMSGByUserId.getUserPersonalMonthIntegral() != null){
                        user1.setUserPersonalLastmonthIntegral(userMSGByUserId.getUserPersonalMonthIntegral());
                        //判断各职称当月消费积分是否大于配置的标准
                        if (userMSGByUserId.getUserRole() == 2){
                            if (sysConfig.getPrimaryCareerPersonalIntegral() != null && userMSGByUserId.getUserPersonalMonthIntegral() >= sysConfig.getPrimaryCareerPersonalIntegral()){
                                if (userMSGByUserId.getYearProfitContinuousMonth() != null){
                                    user1.setYearProfitContinuousMonth(userMSGByUserId.getYearProfitContinuousMonth() + 1);
                                }else {
                                    user1.setYearProfitContinuousMonth(0);
                                }

                                //判断分润，将当月分润账户添加到总分润账户
                                if (userMSGByUserId.getUserSharprofitMonth() != null && userMSGByUserId.getUserSharprofitMonth() != 0){
                                    user1.setUserSharprofitCount(userMSGByUserId.getUserSharprofitCount() + userMSGByUserId.getUserSharprofitMonth());
                                }
                            }
                        }
                        if (userMSGByUserId.getUserRole() == 3){
                            if (sysConfig.getAdvancedCareerPersonalIntegral() != null && userMSGByUserId.getUserPersonalMonthIntegral() >= sysConfig.getAdvancedCareerPersonalIntegral()){
                                if (userMSGByUserId.getYearProfitContinuousMonth() != null){
                                    user1.setYearProfitContinuousMonth(userMSGByUserId.getYearProfitContinuousMonth() + 1);
                                }else {
                                    user1.setYearProfitContinuousMonth(0);
                                }
                                //判断分润，将当月分润账户添加到总分润账户
                                if (userMSGByUserId.getUserSharprofitMonth() != null && userMSGByUserId.getUserSharprofitMonth() != 0){
                                    user1.setUserSharprofitCount(userMSGByUserId.getUserSharprofitCount() + userMSGByUserId.getUserSharprofitMonth());
                                }
                            }
                        }
                        if (userMSGByUserId.getUserRole() == 4){
                            if (sysConfig.getInitiateCareerPersonalIntegral() != null && userMSGByUserId.getUserPersonalMonthIntegral() >= sysConfig.getInitiateCareerPersonalIntegral()){
                                if (userMSGByUserId.getYearProfitContinuousMonth() != null){
                                    user1.setYearProfitContinuousMonth(userMSGByUserId.getYearProfitContinuousMonth() + 1);
                                }else {
                                    user1.setYearProfitContinuousMonth(0);
                                }
                                //判断分润，将当月分润账户添加到总分润账户
                                if (userMSGByUserId.getUserSharprofitMonth() != null && userMSGByUserId.getUserSharprofitMonth() != 0){
                                    user1.setUserSharprofitCount(userMSGByUserId.getUserSharprofitCount() + userMSGByUserId.getUserSharprofitMonth());
                                }
                            }
                        }
                    }else {
                        user1.setUserPersonalLastmonthIntegral(0);
                    }
                    //将当月分润账户清零
                    user1.setUserSharprofitMonth(0F);
                    //将当月个人消费积分清空
                    user1.setUserPersonalMonthIntegral(0);
                    user1.setId(userMSGByUserId.getId());
                    int count = userService.update_user(user1);
                    if (count <= 0){
                        return;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("定时器》连续月份增加");
        }
    }
}
