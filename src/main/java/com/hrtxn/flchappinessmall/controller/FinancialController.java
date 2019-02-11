package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.pojo.*;
import com.hrtxn.flchappinessmall.service.*;
import com.hrtxn.flchappinessmall.tools.Tools;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Description: 财务管理控制类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Controller
@RequestMapping("/admin")
public class FinancialController {
    @Autowired//财务
    private FinancialService financialService;

    @Autowired//用户
    private UserService userService;

    @Autowired//积分来源
    private CheckIntegralSourceLogService checkIntegralSourceLogService;

    @Autowired//分红提现
    private ProfitWithdrawLogService profitWithdrawLogService;

    @Autowired//分润提现
    private ShareProfitWithdrawLogService shareProfitWithdrawLogService;

    @Autowired//转账记录
    private TransferLogService transferLogService;

    @Autowired//分红来源记录
    private ShareProfitSourceLogService shareProfitSourceLogService;

    @Autowired//获取系统参数配置
    private SysconfigService sysconfigService;

    @Autowired//订单
    private OrderService orderService;

    @Autowired//分红历史
    private ProfitHiostoryService profitHiostoryService;
    @Autowired
    private StoreService storeService;

    private Logger logger = Logger.getLogger(FinancialController.class);


    /*************************************************分红操作start******************************************************/

    /**
     * 跳转到分红提现申请页面
     * @return
     */
    @RequestMapping("/go_withdrawal_application")
    public ModelAndView go_withdrawal_application(){
        try {
            return new ModelAndView("financial/share_withdrawal_application.jsp");
        } catch (Exception e) {
            logger.error("跳转到分红提现申请页面出错",e);
            return new ModelAndView("error/500.jsp");
        }
    }

    /**
     * 获取用户分红提现记录
     * @return
     */
    @RequestMapping("/getUserProfitWithdrawLogs")
    @ResponseBody
    public List<ShareProfitWithdrawLog> getUserProfitWithdrawLogs(){
        try {
            return profitWithdrawLogService.getUserProfitWithdrawLogs();
        } catch (Exception e) {
            logger.error("获取用户分红提现记录出错",e);
        }
        return null;
    }

    /**
     * 获取商铺分红提现记录
     * @return
     */
    @RequestMapping("/getStoreProfitWithdrawLogs")
    @ResponseBody
    public List<ShareProfitWithdrawLog> getStoreProfitWithdrawLogs(){
        try {
            return profitWithdrawLogService.getStoreProfitWithdrawLogs();
        } catch (Exception e) {
            logger.error("获取商铺分红提现记录出错",e);
        }
        return null;
    }

    /**
     * 同意分红提现
     * @return
     */
    @RequestMapping(value = "/update_ProfitWithdrawLogStatus",method = RequestMethod.POST)
    @ResponseBody
    public boolean update_ProfitWithdrawLogStatus(@RequestParam("id") Integer id, HttpServletRequest request){
        try {
            ProfitWithdrawLog profitWithdrawLog = new ProfitWithdrawLog();
            profitWithdrawLog.setWithdrawApproveTime(Tools.date2Str(new Date()));
            profitWithdrawLog.setWithdrawStatus(2);
            profitWithdrawLog.setWithdrawHandlers(((Admin)request.getSession().getAttribute("admin")).getAdminNickName());
            profitWithdrawLog.setId(id);
            return profitWithdrawLogService.update_ProfitWithdrawLog(profitWithdrawLog) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("同意分红提现出错",e);
            return false;
        }
    }

    /**
     * 驳回分红提现
     * @return
     */
    @RequestMapping(value = "/reject_ProfitWithdrawLog",method = RequestMethod.POST)
    @ResponseBody
    public boolean reject_ProfitWithdrawLog(
            @RequestParam("withdrawMoney") Float withdrawMoney,
            @RequestParam("userId") Integer userId,
            @RequestParam("userRole") Integer userRole,
            @RequestParam("withdrawRejectReason") String withdrawRejectReason,
            @RequestParam("id") Integer id,
            HttpServletRequest request){
        try {
            int count = 0;
            if (userRole == 1){
                //根据ID获取用户信息，获取分红账户
                User user = userService.getUserMSGByUserId(userId);
                //修改用户分红账户，将提现的分红返还给用户分红账户
                User _user = new User();
                if (user != null && user.getUserProfitAccount() != null){
                    _user.setUserProfitAccount(user.getUserProfitAccount() + withdrawMoney);
                }else {
                    _user.setUserProfitAccount(withdrawMoney);
                }
                _user.setId(userId);
                count = userService.update_user(_user);
            }else {
                Store store = storeService.getStoreById(userId);
                Store _store = new Store();
                if (store != null && store.getStoreAccount() != 0) {
                    _store.setStoreAccount(store.getStoreAccount() + withdrawMoney);
                }else{
                    _store.setStoreAccount(withdrawMoney);
                }
                _store.setId(userId);
                count = storeService.update_storeaccount(_store);
            }
            if (count > 0){
                //修改分红提现记录状态
                ProfitWithdrawLog profitWithdrawLog = new ProfitWithdrawLog();
                profitWithdrawLog.setWithdrawRejectReason(withdrawRejectReason);
                profitWithdrawLog.setWithdrawStatus(3);
                profitWithdrawLog.setWithdrawHandlers(((Admin)request.getSession().getAttribute("admin")).getAdminNickName());
                profitWithdrawLog.setId(id);
                return profitWithdrawLogService.update_ProfitWithdrawLog(profitWithdrawLog) > 0 ? true : false;
            }
        } catch (Exception e) {
            logger.error("驳回分红提现出错",e);
        }
        return false;
    }


    /***************************************************分红操作end******************************************************/




    /*************************************************分润操作start******************************************************/

    /**
     * 跳转到分润提现申请页面
     * @return
     */
    @RequestMapping("/go_profits_withdrawal")
    public ModelAndView go_profits_withdrawal(){
        try {
            ModelAndView modelAndView = new ModelAndView("financial/share_profits_withdrawal.jsp");
            //获取分润提现记录
            List<ShareProfitWithdrawLog> shareProfitWithdrawLogList = shareProfitWithdrawLogService.getProfitWithdrawal();
            modelAndView.addObject("shareProfitWithdrawLogList",shareProfitWithdrawLogList);
            modelAndView.addObject("shareProfitWithdrawLogSize",shareProfitWithdrawLogList.size());
            return modelAndView;
        } catch (Exception e) {
            logger.error("跳转到分润提现申请页面出错",e);
            return new ModelAndView("error/500.jsp");
        }
    }

    /**
     * 同意分润提现
     * @return
     */
    @ResponseBody
    @RequestMapping("/approve_shareProfitWithdrawl")
    public boolean approve_shareProfitWithdrawl(@RequestParam("id") Integer id, HttpServletRequest request){
        try {
            //修改分润提现申请状态
            ShareProfitWithdrawLog shareProfitWithdrawLog = new ShareProfitWithdrawLog();
            shareProfitWithdrawLog.setWithdrawApproveTime(Tools.date2Str(new Date()));
            shareProfitWithdrawLog.setWithdrawHandlers(((Admin)request.getSession().getAttribute("admin")).getAdminNickName());
            shareProfitWithdrawLog.setWithdrawStatus(2);
            shareProfitWithdrawLog.setId(id);
            return shareProfitWithdrawLogService.update_shareProfitWithdrawLog(shareProfitWithdrawLog);
        } catch (Exception e) {
            logger.error("同意分润提现出错",e);
        }
        return false;
    }

    /**
     * 驳回分润提现申请
     * @param withdrawRejectReason
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/reject_shareProfitWithdrawl")
    public boolean reject_shareProfitWithdrawl(
            @RequestParam("withdrawRejectReason") String withdrawRejectReason,
            @RequestParam("withdrawMoney") Float withdrawMoney,
            @RequestParam("userId") Integer userId,
            @RequestParam("id") Integer id, HttpServletRequest request){
        try {
            //获取用户信息，获取用户分润总账户
            User user = userService.getUserMSGByUserId(userId);
            //修改用户分润总账户,将提现的金额返还给用户分润总账户
            User _user = new User();
            _user.setId(userId);
            if(user.getUserSharprofitCount()!=null){
                _user.setUserSharprofitCount(user.getUserSharprofitCount() + withdrawMoney);
            }else {
                _user.setUserSharprofitCount(withdrawMoney);
            }
            int count = userService.update_user(_user);
            if (count > 0){
                //修改分润提现申请状态
                ShareProfitWithdrawLog shareProfitWithdrawLog = new ShareProfitWithdrawLog();
                shareProfitWithdrawLog.setWithdrawRejectReason(withdrawRejectReason);
                shareProfitWithdrawLog.setWithdrawHandlers(((Admin)request.getSession().getAttribute("admin")).getAdminNickName());
                shareProfitWithdrawLog.setWithdrawStatus(3);
                shareProfitWithdrawLog.setId(id);
                return shareProfitWithdrawLogService.update_shareProfitWithdrawLog(shareProfitWithdrawLog);
            }
        } catch (Exception e) {
            logger.error("驳回分润提现申请",e);
        }
        return false;
    }


    /*************************************************分润操作end********************************************************/


    /*************************************************提现/消费/转账记录操作start******************************************/

    /**
     * 跳转到提现/消费/转账页面
     * @return
     */
    @RequestMapping("/go_account_details")
    public ModelAndView go_account_details(){
        return new ModelAndView("financial/account_details.jsp");
    }

    /**
     * 获取用户分红提现记录
     * @return
     */
    @RequestMapping("/getUserProfitedWithdrawLogs")
    @ResponseBody
    public List<ProfitWithdrawLog> getUserProfitedWithdrawLogs(){
        try {
            return profitWithdrawLogService.getUserProfitedWithdrawLogs();
        } catch (Exception e) {
            logger.error("获取用户分红提现记录出错",e);
        }
        return null;
    }

    /**
     * 获取店铺分红提现记录
     * @return
     */
    @RequestMapping("/getStoreProfitedWithdrawLogs")
    @ResponseBody
    public List<ProfitWithdrawLog> getStoreProfitedWithdrawLogs(){
        try {
            return profitWithdrawLogService.getStoreProfitedWithdrawLogs();
        } catch (Exception e) {
            logger.error("获取店铺分红提现记录出错",e);
        }
        return null;
    }

    /**
     * 获取转账记录
     * @return
     */
    @RequestMapping("/getTransferLogList")
    @ResponseBody
    public List<TransferLog> getTransferLogList(){
        try {
            return transferLogService.getTransferLogList();
        } catch (Exception e) {
            logger.error("获取转账记录出错",e);
        }
        return null;
    }

    /**
     * 获取分润已操作记录
     * @return
     */
    @RequestMapping("/getShareProfitWithdrawLog")
    @ResponseBody
    public List<ShareProfitWithdrawLog> getShareProfitWithdrawLog(){
        try {
            return shareProfitWithdrawLogService.getShareProfitWithdrawLog();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("获取分润已操作记录出错",e);
        }
        return null;
    }
    /*************************************************提现/消费/转账记录操作end********************************************/




    /*************************************************积分记录操作start**************************************************/

    /**
     * 跳转到积分记录页面
     * @return
     */
    @RequestMapping("/go_integral_log")
    public ModelAndView go_integral_log(){
        try {
            ModelAndView modelAndView = new ModelAndView("financial/integral_logs.jsp");
            //获取所有考核积分来源记录
            List<CheckIntegralSourceLog> checkIntegralSourceLogs = checkIntegralSourceLogService.getAllIntegralLOgs();
            modelAndView.addObject("checkIntegralSourceLogs",checkIntegralSourceLogs);
            return modelAndView;
        } catch (Exception e) {
            logger.error("跳转到积分记录页面出错",e);
            return new ModelAndView("error/500.jsp");
        }
    }
    /*************************************************积分记录操作end****************************************************/




    /*************************************************分红发放操作start**************************************************/

    /**
     * 跳转到分红页面
     * @return
     */
    @RequestMapping("/go_participation_in_profit")
    public ModelAndView go_participation_in_profit(){
        return new ModelAndView("financial/participation_in_profit.jsp");
    }
    /*****************************日分红操作start******************************/
    /**
     * 获取符合日分红发放用户
     */
    @ResponseBody
    @RequestMapping("/getDayProfit")
    @Transactional
    public Map<String,Object> getDayProfit(){
        HashMap<String,Object> map = new HashMap<String, Object>();
        try {
            //根据当前日期和分红类型获取分红来源记录(获取当天日分红)
            List<ShareProfitSourceLog> shareProfitSourceLogs = shareProfitSourceLogService.getShareProfitLog(1,new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            if (shareProfitSourceLogs.size() <= 0){
                if (Tools.getLastData()!=null){
                    String lastData = Tools.getLastData();
                    //存放满足日分红发放的所有用户
                    List<User> userList = new ArrayList<User>();
                    //1、获取符合日分红发放用户（条件：符合事业合伙人2、高级合伙人3、创始合伙人4职称且自我消费积分对应在300、400、500之上）
                    //获取系统参数配置
                    Sysconfig sysConfig = sysconfigService.getSysConfig();
                    //获取符合符合日分红发放的事业合伙人且个人上月消费积分大于300以上
                    List<User> primaryUserList = financialService.getUserDayProfit(2,sysConfig.getPrimaryCareerPersonalIntegral());
                    //获取符合符合日分红发放的高级合伙人且个人上月消费积分大于400以上
                    List<User> advancedUserList = financialService.getUserDayProfit(3,sysConfig.getAdvancedCareerPersonalIntegral());
                    //获取符合符合日分红发放的创始合伙人且个人上月消费积分大于500以上
                    List<User> initiateUserList = financialService.getUserDayProfit(4,sysConfig.getInitiateCareerPersonalIntegral());
                    if (primaryUserList.size() > 0){
                        for (User user : primaryUserList) {
                            userList.add(user);
                        }
                    }
                    if (advancedUserList.size() > 0){
                        for (User user : advancedUserList) {
                            userList.add(user);
                        }
                    }
                    if (initiateUserList.size() > 0){
                        for (User user : initiateUserList) {
                            userList.add(user);
                        }
                    }
                    if(userList.size() > 0){
                        //存放满足日分红发放的所有用户ID
                        Integer[] userId = new Integer[userList.size()];
                        //获取满足日分红发放的所有用户ID
                        for (int i = 0; i < userList.size(); i++){
                            userId[i] = userList.get(i).getId();
                        }
                        //获取满足日分红发放的所有用户
                        map.put("userList",userList);
                        //获取满足日分红发放的所有用户ID
                        map.put("userId",userId);
                        //2、获取各用户应得日分红金额
                        //获取对应日期成交订单销售总金额
                        String sumGoodsprice = orderService.getSUMGoodsPrice(lastData);
                        if (sumGoodsprice == null){
                            sumGoodsprice = "0.00";
                        }
                        //获取对应日期成交订单供货总价
                        String sumGoodsSupplyprice = orderService.getSUMGoodsSupplyPrice(lastData);
                        if (sumGoodsSupplyprice == null){
                            sumGoodsSupplyprice = "0.00";
                        }

                        //获取产品销售提成
                        String salesCommission1 = orderService.getSUMsalesCommission("2019-1-2 00:00:00","2019-1-2 23:59:59");
                        String salesCommission = orderService.getSUMsalesCommission(lastData+" 00:00:00",lastData+" 23:59:59");
                        if (salesCommission == null){
                            salesCommission = "0.00";
                        }

                        //获取毛利润 毛利润 = 对应日期成交订单销售总金额 - 减运费 - 对应日期成交订单供货总价
                        Double grossProfit =
                            Double.parseDouble(sumGoodsprice.replaceAll(",","")) - Double.parseDouble(sumGoodsSupplyprice.replaceAll(",",""));

                        if(grossProfit < 0){
                            grossProfit = 0.00;
                        }
                        //分红总额 分红总额 = （毛利润 - 毛利润 * 运营成本比例 - 产品销售提成总额） * 日分红发放比例
                        Double sumProfit = (grossProfit - grossProfit * (sysConfig.getOperatingCostsPer() / 100 ) -
                                Double.parseDouble(salesCommission.replaceAll(",",""))) * (sysConfig.getDayProfitPer() / 100);
                        if (sumProfit < 0){
                            sumProfit = 0.00;
                        }
                        //获取符合条件的每位用户所得的日分红，且保留小数点后两位，其余舍去 每人获取的日分红 = 分红总额 / 上月符合日分红标准的总人数
                        Double userDayProfit = Tools.twoPoint(sumProfit / userList.size());
                        if (userDayProfit < 0){
                            userDayProfit = 0.00;
                        }
                        map.put("userDayProfit",userDayProfit);
                        map.put("sumProfit",sumProfit);
                        map.put("lastData",lastData);
                        map.put("code","2000");
                    }else{
                        //没有满足条件的用户
                        map.put("code","1003");
                    }
                }else{
                    //上月日期不规范，请求停止
                    map.put("code","1002");
                }
            }else{
                //今日已发放，请明日继续
                map.put("code","1001");
            }
        } catch (Exception e) {
            logger.error("获取符合日分红发放用户出错",e);
            map.put("code","5000");
        }
        return map;
    }

    /**
     * 执行日分红发放操作
     * @param dayUserId
     * @param sumProfit
     * @param userDayProfit
     * @param lastData
     * @return
     */
    @ResponseBody
    @RequestMapping("/executeDayProfit")
    @Transactional
    public boolean executeDayProfit(
        @RequestParam("dayUserId") Integer[] dayUserId,
        @RequestParam("sumProfit") Double sumProfit,
        @RequestParam("userDayProfit") Double userDayProfit,
        @RequestParam("lastData") String lastData){
        try {
            if (dayUserId != null){
                for (Integer dayUser:dayUserId) {
                    //获取符合分红发放的用户ID
                    //获取用户信息，获取用户分红账户
                    User user = userService.getUserMSGByUserId(dayUser);
                    //获取用户的分红
                    if (user != null && user.getUserProfitAccount()!= null){
                        //修改分红
                        User _user = new User();
                        if (user.getUserProfitAccount() != 0){
                            _user.setUserProfitAccount(user.getUserProfitAccount() + userDayProfit.floatValue());
                        }else{
                            _user.setUserProfitAccount(userDayProfit.floatValue());
                        }
                        _user.setId(dayUser);
                        int count = userService.update_user(_user);
                        if (count > 0){
                            //添加日分红记录
                            ShareProfitSourceLog shareProfitSourceLog = new ShareProfitSourceLog();
                            shareProfitSourceLog.setAddtime(Tools.date2Str(new Date()));
                            shareProfitSourceLog.setUserId(dayUser);
                            shareProfitSourceLog.setMoney(userDayProfit.floatValue());
                            shareProfitSourceLog.setType(1);
                            boolean flag = shareProfitSourceLogService.addPlateGrantProfitLog(shareProfitSourceLog);
                            if (!flag){
                                return false;
                            }
                        }else {
                            return false;
                        }
                    }
                }
                String dayUserIdStr=StringUtils.join(dayUserId,",");
                //执行添加发放分红操作
                ProfitHiostory profitHiostory = new ProfitHiostory();
                profitHiostory.setAddtime(Tools.date2Str(new Date()));
                profitHiostory.setProfitHiostoryDate(lastData);
                profitHiostory.setProfitType(1);
                profitHiostory.setSumProfitMoney(sumProfit.floatValue());
                profitHiostory.setUserIds(dayUserIdStr);
                return profitHiostoryService.addProfitHiostory(profitHiostory);
            }
        } catch (Exception e) {
            logger.error("执行发放日分红操作出错",e);
        }
        return false;
    }

    /*****************************日分红操作end********************************/



    /*****************************周分红操作start******************************/
    /**
     * 获取周分红
     * @return
     */
    @ResponseBody
    @RequestMapping("/getWeekProfit")
    @Transactional
    public Map<String, Object> getWeekProfit(){
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            map = new HashMap<String, Object>();
            //根据当前日期和分红类型获取分红来源记录(获取周分红) 判断今日是否发放，防止重复发放
            List<ShareProfitSourceLog> shareProfitSourceLogs = shareProfitSourceLogService.getShareProfitLog(2,new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            if (shareProfitSourceLogs.size() <= 0){
                //获取对应的周分红发放日 7号对应上个月的1~7号 14号对应上个月的8~14号 21号对应上个月的15~21号 28号对应上个月的22~28号
                String[] lastDataRange = Tools.getWeekRange();
                //开始日期
                String weekRangeOne = lastDataRange[0];
                //结束日期
                String weekRangeLast = lastDataRange[6];
                if(weekRangeOne != null && weekRangeLast != null){
                    //存放满足周分红发放的所有用户
                    List<User> userList = new ArrayList<User>();
                    //1、获取符合周分红发放用户（条件：符合事业合伙人2、高级合伙人3、创始合伙人4职称且自我消费积分对应在300、400、500之上）
                    //获取系统参数配置
                    Sysconfig sysConfig = sysconfigService.getSysConfig();
                    //获取符合符合周分红发放的事业合伙人且个人上月消费积分大于300以上
                    List<User> primaryUserList = financialService.getUserDayProfit(2,sysConfig.getPrimaryCareerPersonalIntegral());
                    //获取符合符合周分红发放的高级合伙人且个人上月消费积分大于400以上
                    List<User> advancedUserList = financialService.getUserDayProfit(3,sysConfig.getAdvancedCareerPersonalIntegral());
                    //获取符合符合周分红发放的创始合伙人且个人上月消费积分大于500以上
                    List<User> initiateUserList = financialService.getUserDayProfit(4,sysConfig.getInitiateCareerPersonalIntegral());
                    if (primaryUserList.size() > 0){
                        for (User user : primaryUserList) {
                            userList.add(user);
                        }
                    }
                    if (advancedUserList.size() > 0){
                        for (User user : advancedUserList) {
                            userList.add(user);
                        }
                    }
                    if (initiateUserList.size() > 0){
                        for (User user : initiateUserList) {
                            userList.add(user);
                        }
                    }
                    if(userList.size() > 0){
                        //存放满足周分红发放的所有用户ID
                        Integer[] userId = new Integer[userList.size()];
                        //获取满足周分红发放的所有用户ID
                        for (int i = 0; i < userList.size(); i++){
                            userId[i] = userList.get(i).getId();
                        }
                        //获取满足周分红发放的所有用户
                        map.put("userList",userList);
                        //获取满足周分红发放的所有用户ID
                        map.put("userId",userId);
                        //2、获取各用户应得周分红金额
                        //获取两日期之间成交订单销售总金额
                        String sumGoodsprice = orderService.getSUMGoodsPriceByDataRange(weekRangeOne + " 00:00:00",weekRangeLast + " 23:59:59");
                        if (sumGoodsprice == null){
                            sumGoodsprice = "0.00";
                        }
                        //获取两日期之间成交订单供货总价
                        String sumGoodsSupplyprice = orderService.getSUMGoodsSupplyPriceByDataRange(weekRangeOne + " 00:00:00",weekRangeLast + " 23:59:59");
                        if (sumGoodsSupplyprice == null){
                            sumGoodsSupplyprice = "0.00";
                        }

                        //获取产品销售提成
                        String salesCommission = orderService.getSUMsalesCommission(weekRangeOne+" 00:00:00",weekRangeLast+" 23:59:59");
                        if (salesCommission == null){
                            salesCommission = "0.00";
                        }

                        //获取毛利润  毛利润 = 两日期之间成交订单销售总金额 - 减运费 - 两日期之间成交订单供货总价
                        Double grossProfit = Double.parseDouble(sumGoodsprice.replaceAll(",","")) - Double.parseDouble(sumGoodsSupplyprice.replaceAll(",",""));
                        if(grossProfit < 0){
                            grossProfit = 0.00;
                        }
                        //获取对应日期的日分红总额  日分红总额 = 对应两日期之间各天分红总额
                        String daySum = profitHiostoryService.getDaySum(weekRangeOne,weekRangeLast);
                        if (daySum == null){
                            daySum = "0.00";
                        }
                        //周分红总额 周分红总额 = （对应两日期的毛利润 - 对应两日期的毛利润 * 运行成本比例 - 产品销售提成 - 对应日期的日分红总额） * 周分红发放比例
                        Double sumWeekProfit =
                                (grossProfit - grossProfit * (sysConfig.getOperatingCostsPer() / 100 ) -
                                Double.parseDouble(salesCommission.replaceAll(",","")) -
                                Double.parseDouble(daySum.replaceAll(",",""))) * (sysConfig.getWeekProfitPer() / 100);
                        if (sumWeekProfit < 0){
                            sumWeekProfit = 0.00;
                        }
                        //获取符合条件的每位用户所得的周分红，且保留小数点后两位，其余舍去 每位用户所得的周分红 = 对应日期周分红总额 / 上个月符合周分红标准的总人数
                        Double userWeekProfit = Tools.twoPoint(sumWeekProfit / userList.size());
                        if (userWeekProfit < 0){
                            userWeekProfit = 0.00;
                        }
                        map.put("userWeekProfit",userWeekProfit);
                        map.put("sumWeekProfit",sumWeekProfit);
                        map.put("weekRangeOne",weekRangeOne);
                        map.put("weekRangeLast",weekRangeLast);
                        map.put("code","2000");
                    }else{
                        //没有满足条件的用户
                        map.put("code","1003");
                    }
                }else {
                    //不到发放日，请求停止
                    map.put("code","1002");
                }
            }else{
                //今日已发放，请明日继续
                map.put("code","1001");
            }
        } catch (Exception e) {
            logger.error("获取符合周分红发放用户出错",e);
            map.put("code","5000");
        }
        return map;
    }

    /**
     * 执行周分红发放操作
     * @param weekUserId
     * @param sumWeekProfit
     * @param userWeekProfit
     * @param weekRangeOne
     * @param weekRangeLast
     * @return
     */
    @ResponseBody
    @RequestMapping("/executeWeekProfit")
    @Transactional
    public boolean executeWeekProfit(
            @RequestParam("weekUserId") Integer[] weekUserId,
            @RequestParam("sumWeekProfit") Double sumWeekProfit,
            @RequestParam("userWeekProfit") Double userWeekProfit,
            @RequestParam("weekRangeOne") String weekRangeOne,
            @RequestParam("weekRangeLast") String weekRangeLast){
        try {
            if (weekUserId != null){
                for (Integer weekUser:weekUserId) {
                    //获取符合分红发放的用户ID
                    //获取用户信息，获取用户分红账户
                    User user = userService.getUserMSGByUserId(weekUser);
                    //获取用户的分红
                    if (user != null && user.getUserProfitAccount()!= null){
                        //修改分红
                        User _user = new User();
                        if (user.getUserProfitAccount() != 0){
                            _user.setUserProfitAccount(user.getUserProfitAccount() + userWeekProfit.floatValue());
                        }else{
                            _user.setUserProfitAccount(userWeekProfit.floatValue());
                        }
                        _user.setId(weekUser);
                        int count = userService.update_user(_user);
                        if (count > 0){
                            //添加周分红记录
                            ShareProfitSourceLog shareProfitSourceLog = new ShareProfitSourceLog();
                            shareProfitSourceLog.setAddtime(Tools.date2Str(new Date()));
                            shareProfitSourceLog.setUserId(weekUser);
                            shareProfitSourceLog.setMoney(userWeekProfit.floatValue());
                            shareProfitSourceLog.setType(2);
                            boolean flag = shareProfitSourceLogService.addPlateGrantProfitLog(shareProfitSourceLog);
                            if (!flag){
                                return false;
                            }
                        }else {
                            return false;
                        }
                    }
                }
                String dayUserIdStr=StringUtils.join(weekUserId,",");
                //执行添加发放分红操作
                ProfitHiostory profitHiostory = new ProfitHiostory();
                profitHiostory.setAddtime(Tools.date2Str(new Date()));
                profitHiostory.setProfitHiostoryDate(weekRangeOne);
                profitHiostory.setProfitHiostoryEndDate(weekRangeLast);
                profitHiostory.setProfitType(2);
                profitHiostory.setSumProfitMoney(sumWeekProfit.floatValue());
                profitHiostory.setUserIds(dayUserIdStr);
                return profitHiostoryService.addProfitHiostory(profitHiostory);
            }
        } catch (Exception e) {
            logger.error("执行发放周分红操作出错",e);
        }
        return false;
    }

    /*****************************周分红操作end********************************/



    /*****************************月分红操作start******************************/

    /**
     * 获取月分红
     * @return
     */
    @ResponseBody
    @RequestMapping("/getMonthProfit")
    @Transactional
    public Map<String, Object> getMonthProfit(){
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            map = new HashMap<String, Object>();
            //根据当前日期和分红类型获取分红来源记录(获取月分红) 判断今日是否发放，防止重复发放
            List<ShareProfitSourceLog> shareProfitSourceLogs = shareProfitSourceLogService.getShareProfitLog(3,new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            if (shareProfitSourceLogs.size() <= 0){
                if (Calendar.getInstance().get(Calendar.DAY_OF_MONTH) == 28){
                    //获取对应的月分红发放日 每月1号进行发放
                    String[] lastMonth = Tools.getLastMonth();
                    if(lastMonth[0] != null && lastMonth[1] != null){
                        //存放满足月分红发放的所有用户
                        List<User> userList = new ArrayList<User>();
                        //1、获取符合月分红发放用户（条件：符合高级合伙人3、创始合伙人4职称且自我消费积分对应在400、500之上）
                        //获取系统参数配置
                        Sysconfig sysConfig = sysconfigService.getSysConfig();
                        //获取符合符合月分红发放的高级合伙人且个人上月消费积分大于400以上
                        List<User> advancedUserList = financialService.getUserDayProfit(3,sysConfig.getAdvancedCareerPersonalIntegral());
                        //获取符合符合月分红发放的创始合伙人且个人上月消费积分大于500以上
                        List<User> initiateUserList = financialService.getUserDayProfit(4,sysConfig.getInitiateCareerPersonalIntegral());
                        if (advancedUserList.size() > 0){
                            for (User user : advancedUserList) {
                                userList.add(user);
                            }
                        }
                        if (initiateUserList.size() > 0){
                            for (User user : initiateUserList) {
                                userList.add(user);
                            }
                        }
                        if(userList.size() > 0){
                            //存放满足月分红发放的所有用户ID
                            Integer[] userId = new Integer[userList.size()];
                            //获取满足月分红发放的所有用户ID
                            for (int i = 0; i < userList.size(); i++){
                                userId[i] = userList.get(i).getId();
                            }
                            //获取满足月分红发放的所有用户
                            map.put("userList",userList);
                            //获取满足月分红发放的所有用户ID
                            map.put("userId",userId);
                            //2、获取各用户应得月分红金额
                            //获取两日期之间成交订单销售总金额
                            String sumGoodsprice = orderService.getSUMGoodsPriceByDataRange(lastMonth[0] + " 00:00:00",lastMonth[1] + " 23:59:59");
                            if (sumGoodsprice == null){
                                sumGoodsprice = "0.00";
                            }
                            //获取两日期之间成交订单供货总价
                            String sumGoodsSupplyprice = orderService.getSUMGoodsSupplyPriceByDataRange(lastMonth[0] + " 00:00:00",lastMonth[1] + " 23:59:59");
                            if (sumGoodsSupplyprice == null){
                                sumGoodsSupplyprice = "0.00";
                            }

                            //获取产品销售提成
                            String salesCommission = orderService.getSUMsalesCommission(lastMonth[0]+" 00:00:00",lastMonth[1]+" 23:59:59");
                            if (salesCommission == null){
                                salesCommission = "0.00";
                            }

                            //获取毛利润  毛利润 = 两日期之间成交订单销售总金额 - 减运费 - 两日期之间成交订单供货总价
                            Double grossProfit = Double.parseDouble(sumGoodsprice.replaceAll(",","")) - Double.parseDouble(sumGoodsSupplyprice.replaceAll(",",""));
                            if(grossProfit < 0){
                                grossProfit = 0.00;
                            }
                            //获取对应日期发放的日分红总额  日分红总额 = 对应两日期之间各天日分红总额
                            String daySum = profitHiostoryService.getDaySum(lastMonth[0],lastMonth[1]);
                            if (daySum == null){
                                daySum = "0.00";
                            }
                            //获取对应日期发放的周分红总额  周分红总额 = 对应两日期之间各天周分红总额
                            String weekSum = profitHiostoryService.getWeekSum(lastMonth[0],lastMonth[1]);
                            if (weekSum == null){
                                weekSum = "0.00";
                            }

                            //月分红总额 月分红总额 = （对应两日期的毛利润 - 对应两日期的毛利润 * 运行成本比例 - 产品销售提成 - 对应日期的日分红总额 - 对应日期的周分红总额） * 月分红发放比例
                            Double sumMonthProfit =
                                    (grossProfit - grossProfit * (sysConfig.getOperatingCostsPer() / 100 ) -
                                    Double.parseDouble(salesCommission.replaceAll(",","")) -
                                    Double.parseDouble(daySum.replaceAll(",","")) -
                                    Double.parseDouble(weekSum.replaceAll(",",""))) * (sysConfig.getMonthProfitPer() / 100);
                            if (sumMonthProfit < 0){
                                sumMonthProfit = 0.00;
                            }
                            //获取符合条件的每位用户所得的周分红，且保留小数点后两位，其余舍去 每位用户所得的周分红 = 对应日期周分红总额 / 上个月符合周分红标准的总人数
                            Double userMonthProfit = Tools.twoPoint(sumMonthProfit / userList.size());
                            if (userMonthProfit < 0){
                                userMonthProfit = 0.00;
                            }
                            map.put("userMonthProfit",userMonthProfit);
                            map.put("sumMonthProfit",sumMonthProfit);
                            map.put("monthRangeOne",lastMonth[0]);
                            map.put("monthRangeLast",lastMonth[1]);
                            map.put("code","2000");
                        }else{
                            //没有满足条件的用户
                            map.put("code","1003");
                        }
                    }else {
                        //不到发放日，请求停止
                        map.put("code","1002");
                    }
                }else {
                    //不到发放日，请求停止
                    map.put("code","1002");
                }
            }else{
                //今日已发放，请明日继续
                map.put("code","1001");
            }
        } catch (Exception e) {
            logger.error("获取符合周分红发放用户出错",e);
            map.put("code","5000");
        }
        return map;
    }

    /**
     * 执行月分红发放操作
     * @param monthUserId
     * @param sumMonthProfit
     * @param userMonthProfit
     * @param monthRangeOne
     * @param monthRangeLast
     * @return
     */
    @ResponseBody
    @RequestMapping("/executeMonthProfit")
    @Transactional
    public boolean executeMonthProfit(
            @RequestParam("monthUserId") Integer[] monthUserId,
            @RequestParam("sumMonthProfit") Double sumMonthProfit,
            @RequestParam("userMonthProfit") Double userMonthProfit,
            @RequestParam("monthRangeOne") String monthRangeOne,
            @RequestParam("monthRangeLast") String monthRangeLast){
        try {
            if (monthUserId != null){
                for (Integer monthUser:monthUserId) {
                    //获取符合分红发放的用户ID
                    //获取用户信息，获取用户分红账户
                    User user = userService.getUserMSGByUserId(monthUser);
                    //获取用户的分红
                    if (user != null && user.getUserProfitAccount()!= null){
                        //修改分红
                        User _user = new User();
                        if (user.getUserProfitAccount() != 0){
                            _user.setUserProfitAccount(user.getUserProfitAccount() + userMonthProfit.floatValue());
                        }else{
                            _user.setUserProfitAccount(userMonthProfit.floatValue());
                        }
                        _user.setId(monthUser);
                        int count = userService.update_user(_user);
                        if (count > 0){
                            //添加月分红记录
                            ShareProfitSourceLog shareProfitSourceLog = new ShareProfitSourceLog();
                            shareProfitSourceLog.setAddtime(Tools.date2Str(new Date()));
                            shareProfitSourceLog.setUserId(monthUser);
                            shareProfitSourceLog.setMoney(userMonthProfit.floatValue());
                            shareProfitSourceLog.setType(3);
                            boolean flag = shareProfitSourceLogService.addPlateGrantProfitLog(shareProfitSourceLog);
                            if (!flag){
                                return false;
                            }
                        }else {
                            return false;
                        }
                    }
                }
                String dayUserIdStr=StringUtils.join(monthUserId,",");
                //执行添加发放分红操作
                ProfitHiostory profitHiostory = new ProfitHiostory();
                profitHiostory.setAddtime(Tools.date2Str(new Date()));
                profitHiostory.setProfitHiostoryDate(monthRangeOne);
                profitHiostory.setProfitHiostoryEndDate(monthRangeLast);
                profitHiostory.setProfitType(3);
                profitHiostory.setSumProfitMoney(sumMonthProfit.floatValue());
                profitHiostory.setUserIds(dayUserIdStr);
                return profitHiostoryService.addProfitHiostory(profitHiostory);
            }
        } catch (Exception e) {
            logger.error("执行发放月分红操作出错",e);
        }
        return false;
    }

    /*****************************月分红操作end*********************************/


    /*****************************季度分红操作start******************************/
    /**
     * 获取季度分红
     * @return
     */
    @ResponseBody
    @RequestMapping("/getQuarterProfit")
    @Transactional
    public Map<String, Object> getQuarterProfit(){
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            map = new HashMap<String, Object>();
            //根据当前日期和分红类型获取分红来源记录(获取季度分红) 判断今日是否发放，防止重复发放
            List<ShareProfitSourceLog> shareProfitSourceLogs = shareProfitSourceLogService.getShareProfitLog(4,new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            if (shareProfitSourceLogs.size() <= 0){
                //判断是否到发放日期（每年1月1号，4月1号，7月1号，10月1号）
                if (Calendar.getInstance().get(Calendar.DAY_OF_MONTH) == 1){
                    //获取对应的季度分红发放日 每月1号进行发放
                    String[] lastQuarter = Tools.getLastQuarter();
                    if(lastQuarter[0] != null && lastQuarter[1] != null && lastQuarter[2] != null){
                        //获取系统参数配置
                        Sysconfig sysConfig = sysconfigService.getSysConfig();
                        //存放满足季度分红发放的所有用户
                        //1、获取符合季度分红发放用户（条件：符合创始合伙人4职称且自我消费积分对应在500之上）
                        //获取符合符合季度分红发放的创始合伙人且个人上月消费积分大于500以上
                        List<User> userList = financialService.getUserDayProfit(4,sysConfig.getInitiateCareerPersonalIntegral());
                        if(userList.size() > 0){
                            //存放满足季度分红发放的所有用户ID
                            Integer[] userId = new Integer[userList.size()];
                            //获取满足季度分红发放的所有用户ID
                            for (int i = 0; i < userList.size(); i++){
                                userId[i] = userList.get(i).getId();
                            }
                            //获取满足季度分红发放的所有用户
                            map.put("userList",userList);
                            //获取满足季度分红发放的所有用户ID
                            map.put("userId",userId);
                            //2、获取各用户应得季度分红金额

                            //获取两日期之间成交订单销售总金额- 减运费
                            String sumGoodsprice1 = orderService.getSUMGoodsPriceByDataRange(lastQuarter[0] + "-01 00:00:00",lastQuarter[0] + "-28 23:59:59");
                            if (sumGoodsprice1 == null){
                                sumGoodsprice1 = "0.00";
                            }
                            String sumGoodsprice2 = orderService.getSUMGoodsPriceByDataRange(lastQuarter[1] + "-01 00:00:00",lastQuarter[1] + "-28 23:59:59");
                            if (sumGoodsprice2 == null){
                                sumGoodsprice2 = "0.00";
                            }
                            String sumGoodsprice3 = orderService.getSUMGoodsPriceByDataRange(lastQuarter[2] + "-01 00:00:00",lastQuarter[2] + "-28 23:59:59");
                            if (sumGoodsprice3 == null){
                                sumGoodsprice3 = "0.00";
                            }
                            Double sumGoodsprice =
                                Double.parseDouble(sumGoodsprice1.replaceAll(",","")) + Double.parseDouble(sumGoodsprice2.replaceAll(",","")) +
                                Double.parseDouble(sumGoodsprice3.replaceAll(",",""));



                            //获取两日期之间成交订单供货总价
                            String sumGoodsSupplyprice1 = orderService.getSUMGoodsSupplyPriceByDataRange(lastQuarter[0] + "-01 00:00:00",lastQuarter[0] + "-28 23:59:59");
                            if (sumGoodsSupplyprice1 == null){
                                sumGoodsSupplyprice1 = "0.00";
                            }
                            String sumGoodsSupplyprice2 = orderService.getSUMGoodsSupplyPriceByDataRange(lastQuarter[1] + "-01 00:00:00",lastQuarter[1] + "-28 23:59:59");
                            if (sumGoodsSupplyprice2 == null){
                                sumGoodsSupplyprice2 = "0.00";
                            }
                            String sumGoodsSupplyprice3 = orderService.getSUMGoodsSupplyPriceByDataRange(lastQuarter[2] + "-01 00:00:00",lastQuarter[2] + "-28 23:59:59");
                            if (sumGoodsSupplyprice3 == null){
                                sumGoodsSupplyprice3 = "0.00";
                            }
                            Double sumGoodsSupplyprice =
                                Double.parseDouble(sumGoodsSupplyprice1.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice2.replaceAll(",","")) +
                                Double.parseDouble(sumGoodsSupplyprice3.replaceAll(",",""));


                            //获取毛利润  毛利润 = 两日期之间成交订单销售总金额 - 两日期之间成交订单供货总价
                            Double grossProfit = sumGoodsprice - sumGoodsSupplyprice;
                            if(grossProfit < 0){
                                grossProfit = 0.00;
                            }

                            //获取对应日期发放的日分红总额  日分红总额 = 对应两日期之间各天日分红总额
                            String daySum1 = profitHiostoryService.getDaySum(lastQuarter[0]+"-01",lastQuarter[0]+"-28");
                            if (daySum1 == null){
                                daySum1 = "0.00";
                            }
                            String daySum2 = profitHiostoryService.getDaySum(lastQuarter[1]+"-01",lastQuarter[1]+"-28");
                            if (daySum2 == null){
                                daySum2 = "0.00";
                            }
                            String daySum3 = profitHiostoryService.getDaySum(lastQuarter[2]+"-01",lastQuarter[2]+"-28");
                            if (daySum3 == null){
                                daySum3 = "0.00";
                            }
                            Double daySum =
                                Double.parseDouble(daySum1.replaceAll(",","")) + Double.parseDouble(daySum2.replaceAll(",","")) +
                                Double.parseDouble(daySum3.replaceAll(",",""));



                            //获取对应日期发放的周分红总额  周分红总额 = 对应两日期之间各天周分红总额
                            String weekSum1 = profitHiostoryService.getWeekSum(lastQuarter[0]+"-01",lastQuarter[0]+"-28");
                            if (weekSum1 == null){
                                weekSum1 = "0.00";
                            }
                            String weekSum2 = profitHiostoryService.getWeekSum(lastQuarter[1]+"-01",lastQuarter[1]+"-28");
                            if (weekSum2 == null){
                                weekSum2 = "0.00";
                            }
                            String weekSum3 = profitHiostoryService.getWeekSum(lastQuarter[2]+"-01",lastQuarter[2]+"-28");
                            if (weekSum3 == null){
                                weekSum3 = "0.00";
                            }
                            Double weekSum =
                                Double.parseDouble(weekSum1.replaceAll(",","")) + Double.parseDouble(weekSum2.replaceAll(",","")) +
                                Double.parseDouble(weekSum3.replaceAll(",",""));


                            //获取对应日期发放的月分红总额  月分红总额 = 对应两日期之间各月分红总额
                            String monthSum1 = profitHiostoryService.getMonthSum(lastQuarter[0]+"-01",lastQuarter[0]+"-28");
                            if (monthSum1 == null){
                                monthSum1 = "0.00";
                            }
                            String monthSum2 = profitHiostoryService.getMonthSum(lastQuarter[1]+"-01",lastQuarter[1]+"-28");
                            if (monthSum2 == null){
                                monthSum2 = "0.00";
                            }
                            String monthSum3 = profitHiostoryService.getMonthSum(lastQuarter[2]+"-01",lastQuarter[2]+"-28");
                            if (monthSum3 == null){
                                monthSum3 = "0.00";
                            }
                            Double monthSum =
                                Double.parseDouble(monthSum1.replaceAll(",","")) + Double.parseDouble(monthSum2.replaceAll(",","")) +
                                Double.parseDouble(monthSum3.replaceAll(",",""));


                            String salesCommission1 = orderService.getSUMsalesCommission(lastQuarter[0]+"-01 00:00:00",lastQuarter[0]+"-28 23:59:59");
                            if (salesCommission1 == null){
                                salesCommission1 = "0.00";
                            }
                            String salesCommission2 = orderService.getSUMsalesCommission(lastQuarter[1]+"-01 00:00:00",lastQuarter[1]+"-28 23:59:59");
                            if (salesCommission2 == null){
                                salesCommission2 = "0.00";
                            }
                            String salesCommission3 = orderService.getSUMsalesCommission(lastQuarter[2]+"-01 00:00:00",lastQuarter[2]+"-28 23:59:59");
                            if (salesCommission3 == null){
                                salesCommission3 = "0.00";
                            }

                            Double salesCommission =
                                    Double.parseDouble(salesCommission1.replaceAll(",","")) + Double.parseDouble(salesCommission2.replaceAll(",","")) +
                                            Double.parseDouble(salesCommission3.replaceAll(",",""));

                            //季度分红总额 季度分红总额 = （对应两日期的毛利润 - 对应两日期的毛利润 * 运行成本比例  - 产品销售提成 - 对应日期的日分红总额 - 对应日期的周分红总额 - 对应日期的月分红总额） * 季度分红发放比例
                            Double sumQuarterProfit =
                                (grossProfit - grossProfit * (sysConfig.getOperatingCostsPer() / 100 ) - salesCommission - daySum - weekSum - monthSum) * (sysConfig.getQuarterProfitPer() / 100);

                            if (sumQuarterProfit < 0){
                                sumQuarterProfit = 0.00;
                            }
                            //获取符合条件的每位用户所得的季度分红，且保留小数点后两位，其余舍去 每位用户所得的季度分红 = 对应日期季度分红总额 / 上个季度符合季度分红标准的总人数
                            Double userQuarterProfit = Tools.twoPoint(sumQuarterProfit / userList.size());
                            if (userQuarterProfit < 0){
                                userQuarterProfit = 0.00;
                            }
                            map.put("userQuarterProfit",userQuarterProfit);
                            map.put("sumQuarterProfit",sumQuarterProfit);
                            map.put("quarterRangeOne",lastQuarter[0]);
                            map.put("quarterRangeLast",lastQuarter[2]);
                            map.put("code","2000");
                        }else{
                            //没有满足条件的用户
                            map.put("code","1003");
                        }
                    }else {
                        //不到发放日，请求停止
                        map.put("code","1002");
                    }
                }else {
                    //不到发放日，请求停止
                    map.put("code","1002");
                }
            }else{
                //今日已发放，请明日继续
                map.put("code","1001");
            }
        } catch (Exception e) {
            logger.error("获取符合季度分红发放用户出错",e);
            map.put("code","5000");
        }
        return map;
    }

    /**
     * 执行发放季度分红操作
     * @param quarterUserId
     * @param sumQuarterProfit
     * @param userQuarterProfit
     * @param quarterRangeOne
     * @param quarterRangeLast
     * @return
     */
    @ResponseBody
    @RequestMapping("/executeQuarterProfit")
    @Transactional
    public boolean executeQuarterProfit(
            @RequestParam("quarterUserId") Integer[] quarterUserId,
            @RequestParam("sumQuarterProfit") Double sumQuarterProfit,
            @RequestParam("userQuarterProfit") Double userQuarterProfit,
            @RequestParam("quarterRangeOne") String quarterRangeOne,
            @RequestParam("quarterRangeLast") String quarterRangeLast){
        try {
            if (quarterUserId != null){
                for (Integer quarterUser:quarterUserId) {
                    //获取符合分红发放的用户ID
                    //获取用户信息，获取用户分红账户
                    User user = userService.getUserMSGByUserId(quarterUser);
                    //获取用户的分红
                    if (user != null && user.getUserProfitAccount()!= null){
                        //修改分红
                        User _user = new User();
                        if (user.getUserProfitAccount() != 0){
                            _user.setUserProfitAccount(user.getUserProfitAccount() + userQuarterProfit.floatValue());
                        }else{
                            _user.setUserProfitAccount(userQuarterProfit.floatValue());
                        }
                        _user.setId(quarterUser);
                        int count = userService.update_user(_user);
                        if (count > 0){
                            //添加季度分红记录
                            ShareProfitSourceLog shareProfitSourceLog = new ShareProfitSourceLog();
                            shareProfitSourceLog.setAddtime(Tools.date2Str(new Date()));
                            shareProfitSourceLog.setUserId(quarterUser);
                            shareProfitSourceLog.setMoney(userQuarterProfit.floatValue());
                            shareProfitSourceLog.setType(4);
                            boolean flag = shareProfitSourceLogService.addPlateGrantProfitLog(shareProfitSourceLog);
                            if (!flag){
                                return false;
                            }
                        }else {
                            return false;
                        }
                    }
                }
                String dayUserIdStr=StringUtils.join(quarterUserId,",");
                //执行添加发放分红操作
                ProfitHiostory profitHiostory = new ProfitHiostory();
                profitHiostory.setAddtime(Tools.date2Str(new Date()));
                profitHiostory.setProfitHiostoryDate(quarterRangeOne);
                profitHiostory.setProfitHiostoryEndDate(quarterRangeLast);
                profitHiostory.setProfitType(4);
                profitHiostory.setSumProfitMoney(sumQuarterProfit.floatValue());
                profitHiostory.setUserIds(dayUserIdStr);
                return profitHiostoryService.addProfitHiostory(profitHiostory);
            }
        } catch (Exception e) {
            logger.error("执行发放季度分红操作出错",e);
        }
        return false;
    }

    /*****************************季度分红操作end********************************/




    /*****************************年分红操作start*******************************/
    /**
     * 获取年分红
     * @return
     */
    @ResponseBody
    @RequestMapping("/getYearProfit")
    @Transactional
    public Map<String, Object> getYearProfit(){
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            map = new HashMap<String, Object>();
            //根据当前日期和分红类型获取分红来源记录(获取年分红) 判断今日是否发放，防止重复发放
            List<ShareProfitSourceLog> shareProfitSourceLogs = shareProfitSourceLogService.getShareProfitLog(5,new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            if (shareProfitSourceLogs.size() <= 0){
                //判断是否到发放日期（每年1月15号）
                if (Calendar.getInstance().get(Calendar.DAY_OF_MONTH) == 15){
                    //获取对应的年分红发放日 每月15号进行发放
                    String[] lastYear = Tools.getLastYear();
                    if(lastYear[0] != null && lastYear[1] != null){
                        //存放满足年分红发放的所有用户
                        //1、获取符合年分红发放用户
                        List<User> userAllList = userService.getAllUserList();
                        if(userAllList.size() > 0){
                            //获取符所有用户
                            ArrayList<User> userList = new ArrayList<User>();
                            //获取满足年分红发放的所有用户ID
                            for (int i = 0; i < userAllList.size(); i++){
                                //判断是否是创始合伙人且连续满足条件到12个月之上
                                if (userAllList.get(i).getUserRole() == 4 && userAllList.get(i).getYearProfitContinuousMonth() >= 12){
                                    userList.add(userAllList.get(i));
                                }
                            }
                            if (userList.size() > 0){
                                //存放满足年分红发放的所有用户ID
                                Integer[] userId = new Integer[userList.size()];
                                for (int i = 0; i < userList.size(); i++){
                                    userId[i] = userList.get(i).getId();
                                }
                                //获取满足年分红发放的所有用户
                                map.put("userList",userList);
                                //获取满足年分红发放的所有用户ID
                                map.put("userId",userId);
                                //2、获取各用户应得年分红金额
                                //获取两日期之间成交订单销售总金额
                                String sumGoodsprice1 = orderService.getSUMGoodsPriceByDataRange(lastYear[0] + "-01 00:00:00",lastYear[0] + "-28 23:59:59");
                                if (sumGoodsprice1 == null){
                                    sumGoodsprice1 = "0.00";
                                }
                                String sumGoodsprice2 = orderService.getSUMGoodsPriceByDataRange(lastYear[1] + "-01 00:00:00",lastYear[1] + "-28 23:59:59");
                                if (sumGoodsprice2 == null){
                                    sumGoodsprice2 = "0.00";
                                }
                                String sumGoodsprice3 = orderService.getSUMGoodsPriceByDataRange(lastYear[2] + "-01 00:00:00",lastYear[2] + "-28 23:59:59");
                                if (sumGoodsprice3 == null){
                                    sumGoodsprice3 = "0.00";
                                }
                                String sumGoodsprice4 = orderService.getSUMGoodsPriceByDataRange(lastYear[3] + "-01 00:00:00",lastYear[3] + "-28 23:59:59");
                                if (sumGoodsprice4 == null){
                                    sumGoodsprice4 = "0.00";
                                }
                                String sumGoodsprice5 = orderService.getSUMGoodsPriceByDataRange(lastYear[4] + "-01 00:00:00",lastYear[4] + "-28 23:59:59");
                                if (sumGoodsprice5 == null){
                                    sumGoodsprice5 = "0.00";
                                }
                                String sumGoodsprice6 = orderService.getSUMGoodsPriceByDataRange(lastYear[5] + "-01 00:00:00",lastYear[5] + "-28 23:59:59");
                                if (sumGoodsprice6 == null){
                                    sumGoodsprice6 = "0.00";
                                }String sumGoodsprice7 = orderService.getSUMGoodsPriceByDataRange(lastYear[6] + "-01 00:00:00",lastYear[6] + "-28 23:59:59");
                                if (sumGoodsprice7 == null){
                                    sumGoodsprice7 = "0.00";
                                }
                                String sumGoodsprice8 = orderService.getSUMGoodsPriceByDataRange(lastYear[7] + "-01 00:00:00",lastYear[7] + "-28 23:59:59");
                                if (sumGoodsprice8 == null){
                                    sumGoodsprice8 = "0.00";
                                }String sumGoodsprice9 = orderService.getSUMGoodsPriceByDataRange(lastYear[8] + "-01 00:00:00",lastYear[8] + "-28 23:59:59");
                                if (sumGoodsprice9 == null){
                                    sumGoodsprice9 = "0.00";
                                }
                                String sumGoodsprice10 = orderService.getSUMGoodsPriceByDataRange(lastYear[9] + "-01 00:00:00",lastYear[9] + "-28 23:59:59");
                                if (sumGoodsprice10 == null){
                                    sumGoodsprice10 = "0.00";
                                }String sumGoodsprice11 = orderService.getSUMGoodsPriceByDataRange(lastYear[10] + "-01 00:00:00",lastYear[10] + "-28 23:59:59");
                                if (sumGoodsprice11 == null){
                                    sumGoodsprice11 = "0.00";
                                }
                                String sumGoodsprice12 = orderService.getSUMGoodsPriceByDataRange(lastYear[11] + "-01 00:00:00",lastYear[11] + "-28 23:59:59");
                                if (sumGoodsprice12 == null){
                                    sumGoodsprice12 = "0.00";
                                }

                                Double sumGoodsprice =
                                    Double.parseDouble(sumGoodsprice1.replaceAll(",","")) + Double.parseDouble(sumGoodsprice2.replaceAll(",","")) +
                                    Double.parseDouble(sumGoodsprice3.replaceAll(",","")) + Double.parseDouble(sumGoodsprice4.replaceAll(",","")) +
                                    Double.parseDouble(sumGoodsprice5.replaceAll(",","")) + Double.parseDouble(sumGoodsprice6.replaceAll(",","")) +
                                    Double.parseDouble(sumGoodsprice7.replaceAll(",","")) + Double.parseDouble(sumGoodsprice8.replaceAll(",","")) +
                                    Double.parseDouble(sumGoodsprice9.replaceAll(",","")) + Double.parseDouble(sumGoodsprice10.replaceAll(",","")) +
                                    Double.parseDouble(sumGoodsprice11.replaceAll(",","")) + Double.parseDouble(sumGoodsprice12.replaceAll(",",""));

                                //获取两日期之间成交订单供货总价
                                String sumGoodsSupplyprice1 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[0] + "-01 00:00:00",lastYear[0] + "-28 23:59:59");
                                if (sumGoodsSupplyprice1 == null){
                                    sumGoodsSupplyprice1 = "0.00";
                                }
                                String sumGoodsSupplyprice2 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[1] + "-01 00:00:00",lastYear[1] + "-28 23:59:59");
                                if (sumGoodsSupplyprice2 == null){
                                    sumGoodsSupplyprice2 = "0.00";
                                }
                                String sumGoodsSupplyprice3 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[2] + "-01 00:00:00",lastYear[2] + "-28 23:59:59");
                                if (sumGoodsSupplyprice3 == null){
                                    sumGoodsSupplyprice3 = "0.00";
                                }
                                String sumGoodsSupplyprice4 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[3] + "-01 00:00:00",lastYear[3] + "-28 23:59:59");
                                if (sumGoodsSupplyprice4 == null){
                                    sumGoodsSupplyprice4 = "0.00";
                                }
                                String sumGoodsSupplyprice5 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[4] + "-01 00:00:00",lastYear[4] + "-28 23:59:59");
                                if (sumGoodsSupplyprice5 == null){
                                    sumGoodsSupplyprice5 = "0.00";
                                }
                                String sumGoodsSupplyprice6 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[5] + "-01 00:00:00",lastYear[5] + "-28 23:59:59");
                                if (sumGoodsSupplyprice6 == null){
                                    sumGoodsSupplyprice6 = "0.00";
                                }
                                String sumGoodsSupplyprice7 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[6] + "-01 00:00:00",lastYear[6] + "-28 23:59:59");
                                if (sumGoodsSupplyprice7 == null){
                                    sumGoodsSupplyprice7 = "0.00";
                                }
                                String sumGoodsSupplyprice8 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[7] + "-01 00:00:00",lastYear[7] + "-28 23:59:59");
                                if (sumGoodsSupplyprice8 == null){
                                    sumGoodsSupplyprice8 = "0.00";
                                }
                                String sumGoodsSupplyprice9 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[8] + "-01 00:00:00",lastYear[8] + "-28 23:59:59");
                                if (sumGoodsSupplyprice9 == null){
                                    sumGoodsSupplyprice9 = "0.00";
                                }
                                String sumGoodsSupplyprice10 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[9] + "-01 00:00:00",lastYear[9] + "-28 23:59:59");
                                if (sumGoodsSupplyprice10 == null){
                                    sumGoodsSupplyprice10 = "0.00";
                                }
                                String sumGoodsSupplyprice11 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[10] + "-01 00:00:00",lastYear[10] + "-28 23:59:59");
                                if (sumGoodsSupplyprice11 == null){
                                    sumGoodsSupplyprice11 = "0.00";
                                }
                                String sumGoodsSupplyprice12 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[11] + "-01 00:00:00",lastYear[11] + "-28 23:59:59");
                                if (sumGoodsSupplyprice12 == null){
                                    sumGoodsSupplyprice12 = "0.00";
                                }

                                Double sumGoodsSupplyprice =
                                    Double.parseDouble(sumGoodsSupplyprice1.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice2.replaceAll(",","")) +
                                    Double.parseDouble(sumGoodsSupplyprice3.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice4.replaceAll(",","")) +
                                    Double.parseDouble(sumGoodsSupplyprice5.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice6.replaceAll(",","")) +
                                    Double.parseDouble(sumGoodsSupplyprice7.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice8.replaceAll(",","")) +
                                    Double.parseDouble(sumGoodsSupplyprice9.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice10.replaceAll(",","")) +
                                    Double.parseDouble(sumGoodsSupplyprice11.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice12.replaceAll(",",""));


                                //获取毛利润  毛利润 = 两日期之间成交订单销售总金额 - 减运费 - 两日期之间成交订单供货总价
                                Double grossProfit = sumGoodsprice - sumGoodsSupplyprice;
                                if(grossProfit < 0){
                                    grossProfit = 0.00;
                                }

                                //获取对应日期发放的日分红总额  日分红总额 = 对应两日期之间各天日分红总额
                                String daySum1 = profitHiostoryService.getDaySum(lastYear[0]+"-01",lastYear[0]+"-28");
                                if (daySum1 == null){
                                    daySum1 = "0.00";
                                }
                                String daySum2 = profitHiostoryService.getDaySum(lastYear[1]+"-01",lastYear[1]+"-28");
                                if (daySum2 == null){
                                    daySum2 = "0.00";
                                }
                                String daySum3 = profitHiostoryService.getDaySum(lastYear[2]+"-01",lastYear[2]+"-28");
                                if (daySum3 == null){
                                    daySum3 = "0.00";
                                }
                                String daySum4 = profitHiostoryService.getDaySum(lastYear[3]+"-01",lastYear[3]+"-28");
                                if (daySum4 == null){
                                    daySum4 = "0.00";
                                }
                                String daySum5 = profitHiostoryService.getDaySum(lastYear[4]+"-01",lastYear[4]+"-28");
                                if (daySum5 == null){
                                    daySum5 = "0.00";
                                }
                                String daySum6 = profitHiostoryService.getDaySum(lastYear[5]+"-01",lastYear[5]+"-28");
                                if (daySum6 == null){
                                    daySum6 = "0.00";
                                }
                                String daySum7 = profitHiostoryService.getDaySum(lastYear[6]+"-01",lastYear[6]+"-28");
                                if (daySum7 == null){
                                    daySum7 = "0.00";
                                }
                                String daySum8 = profitHiostoryService.getDaySum(lastYear[7]+"-01",lastYear[7]+"-28");
                                if (daySum8 == null){
                                    daySum8 = "0.00";
                                }
                                String daySum9 = profitHiostoryService.getDaySum(lastYear[8]+"-01",lastYear[8]+"-28");
                                if (daySum9 == null){
                                    daySum9 = "0.00";
                                }
                                String daySum10 = profitHiostoryService.getDaySum(lastYear[9]+"-01",lastYear[9]+"-28");
                                if (daySum10 == null){
                                    daySum10 = "0.00";
                                }
                                String daySum11 = profitHiostoryService.getDaySum(lastYear[10]+"-01",lastYear[10]+"-28");
                                if (daySum11 == null){
                                    daySum11 = "0.00";
                                }
                                String daySum12 = profitHiostoryService.getDaySum(lastYear[11]+"-01",lastYear[11]+"-28");
                                if (daySum12 == null){
                                    daySum12 = "0.00";
                                }
                                Double daySum =
                                    Double.parseDouble(daySum1.replaceAll(",","")) + Double.parseDouble(daySum2.replaceAll(",","")) +
                                    Double.parseDouble(daySum3.replaceAll(",","")) + Double.parseDouble(daySum4.replaceAll(",","")) +
                                    Double.parseDouble(daySum5.replaceAll(",","")) + Double.parseDouble(daySum6.replaceAll(",","")) +
                                    Double.parseDouble(daySum7.replaceAll(",","")) + Double.parseDouble(daySum8.replaceAll(",","")) +
                                    Double.parseDouble(daySum9.replaceAll(",","")) + Double.parseDouble(daySum10.replaceAll(",","")) +
                                    Double.parseDouble(daySum11.replaceAll(",","")) + Double.parseDouble(daySum12.replaceAll(",",""));


                                //获取对应日期发放的周分红总额  周分红总额 = 对应两日期之间各天周分红总额
                                String weekSum1 = profitHiostoryService.getWeekSum(lastYear[0]+"-01",lastYear[0]+"-28");
                                if (weekSum1 == null){
                                    weekSum1 = "0.00";
                                }
                                String weekSum2 = profitHiostoryService.getWeekSum(lastYear[1]+"-01",lastYear[1]+"-28");
                                if (weekSum2 == null){
                                    weekSum2 = "0.00";
                                }
                                String weekSum3 = profitHiostoryService.getWeekSum(lastYear[2]+"-01",lastYear[2]+"-28");
                                if (weekSum3 == null){
                                    weekSum3 = "0.00";
                                }
                                String weekSum4 = profitHiostoryService.getWeekSum(lastYear[3]+"-01",lastYear[3]+"-28");
                                if (weekSum4 == null){
                                    weekSum4 = "0.00";
                                }
                                String weekSum5 = profitHiostoryService.getWeekSum(lastYear[4]+"-01",lastYear[4]+"-28");
                                if (weekSum5 == null){
                                    weekSum5 = "0.00";
                                }
                                String weekSum6 = profitHiostoryService.getWeekSum(lastYear[5]+"-01",lastYear[5]+"-28");
                                if (weekSum6 == null){
                                    weekSum6 = "0.00";
                                }
                                String weekSum7 = profitHiostoryService.getWeekSum(lastYear[5]+"-01",lastYear[6]+"-28");
                                if (weekSum7 == null){
                                    weekSum7 = "0.00";
                                }
                                String weekSum8 = profitHiostoryService.getWeekSum(lastYear[7]+"-01",lastYear[7]+"-28");
                                if (weekSum8 == null){
                                    weekSum8 = "0.00";
                                }
                                String weekSum9 = profitHiostoryService.getWeekSum(lastYear[8]+"-01",lastYear[8]+"-28");
                                if (weekSum9 == null){
                                    weekSum9 = "0.00";
                                }
                                String weekSum10 = profitHiostoryService.getWeekSum(lastYear[9]+"-01",lastYear[9]+"-28");
                                if (weekSum10 == null){
                                    weekSum10 = "0.00";
                                }
                                String weekSum11 = profitHiostoryService.getWeekSum(lastYear[10]+"-01",lastYear[10]+"-28");
                                if (weekSum11 == null){
                                    weekSum11 = "0.00";
                                }
                                String weekSum12 = profitHiostoryService.getWeekSum(lastYear[11]+"-01",lastYear[11]+"-28");
                                if (weekSum12 == null){
                                    weekSum12 = "0.00";
                                }

                                Double weekSum =
                                    Double.parseDouble(weekSum1.replaceAll(",","")) + Double.parseDouble(weekSum2.replaceAll(",","")) +
                                    Double.parseDouble(weekSum3.replaceAll(",","")) + Double.parseDouble(weekSum4.replaceAll(",","")) +
                                    Double.parseDouble(weekSum5.replaceAll(",","")) + Double.parseDouble(weekSum6.replaceAll(",","")) +
                                    Double.parseDouble(weekSum7.replaceAll(",","")) + Double.parseDouble(weekSum8.replaceAll(",","")) +
                                    Double.parseDouble(weekSum9.replaceAll(",","")) + Double.parseDouble(weekSum10.replaceAll(",","")) +
                                    Double.parseDouble(weekSum11.replaceAll(",","")) + Double.parseDouble(weekSum12.replaceAll(",",""));


                                //获取对应日期发放的月分红总额  月分红总额 = 对应两日期之间各月分红总额
                                String monthSum1 = profitHiostoryService.getMonthSum(lastYear[0]+"-01",lastYear[0]+"-28");
                                if (monthSum1 == null){
                                    monthSum1 = "0.00";
                                }
                                String monthSum2 = profitHiostoryService.getMonthSum(lastYear[1]+"-01",lastYear[1]+"-28");
                                if (monthSum2 == null){
                                    monthSum2 = "0.00";
                                }
                                String monthSum3 = profitHiostoryService.getMonthSum(lastYear[2]+"-01",lastYear[2]+"-28");
                                if (monthSum3 == null){
                                    monthSum3 = "0.00";
                                }
                                String monthSum4 = profitHiostoryService.getMonthSum(lastYear[3]+"-01",lastYear[3]+"-28");
                                if (monthSum4 == null){
                                    monthSum4 = "0.00";
                                }
                                String monthSum5 = profitHiostoryService.getMonthSum(lastYear[4]+"-01",lastYear[4]+"-28");
                                if (monthSum5 == null){
                                    monthSum5 = "0.00";
                                }
                                String monthSum6 = profitHiostoryService.getMonthSum(lastYear[5]+"-01",lastYear[5]+"-28");
                                if (monthSum6 == null){
                                    monthSum6 = "0.00";
                                }
                                String monthSum7 = profitHiostoryService.getMonthSum(lastYear[6]+"-01",lastYear[6]+"-28");
                                if (monthSum7 == null){
                                    monthSum7 = "0.00";
                                }
                                String monthSum8 = profitHiostoryService.getMonthSum(lastYear[7]+"-01",lastYear[7]+"-28");
                                if (monthSum8 == null){
                                    monthSum8 = "0.00";
                                }
                                String monthSum9 = profitHiostoryService.getMonthSum(lastYear[8]+"-01",lastYear[8]+"-28");
                                if (monthSum9 == null){
                                    monthSum9 = "0.00";
                                }
                                String monthSum10 = profitHiostoryService.getMonthSum(lastYear[9]+"-01",lastYear[9]+"-28");
                                if (monthSum10 == null){
                                    monthSum10 = "0.00";
                                }
                                String monthSum11 = profitHiostoryService.getMonthSum(lastYear[10]+"-01",lastYear[10]+"-28");
                                if (monthSum11 == null){
                                    monthSum11 = "0.00";
                                }
                                String monthSum12 = profitHiostoryService.getMonthSum(lastYear[11]+"-01",lastYear[11]+"-28");
                                if (monthSum12 == null){
                                    monthSum12 = "0.00";
                                }

                                Double monthSum=
                                    Double.parseDouble(monthSum1.replaceAll(",","")) + Double.parseDouble(monthSum2.replaceAll(",","")) +
                                    Double.parseDouble(monthSum3.replaceAll(",","")) + Double.parseDouble(monthSum4.replaceAll(",","")) +
                                    Double.parseDouble(monthSum5.replaceAll(",","")) + Double.parseDouble(monthSum6.replaceAll(",","")) +
                                    Double.parseDouble(monthSum7.replaceAll(",","")) + Double.parseDouble(monthSum8.replaceAll(",","")) +
                                    Double.parseDouble(monthSum9.replaceAll(",","")) + Double.parseDouble(monthSum10.replaceAll(",","")) +
                                    Double.parseDouble(monthSum11.replaceAll(",","")) + Double.parseDouble(monthSum12.replaceAll(",",""));

                                //获取对应日期发放的季度分红总额  季度分红总额 = 对应两日期之间各月分红总额
                                String quarterSum1 = profitHiostoryService.getQuarterSum(lastYear[0]+"-01",lastYear[0]+"-28");
                                if (quarterSum1 == null){
                                    quarterSum1 = "0.00";
                                }
                                String quarterSum2 = profitHiostoryService.getQuarterSum(lastYear[1]+"-01",lastYear[1]+"-28");
                                if (quarterSum2 == null){
                                    quarterSum2 = "0.00";
                                }
                                String quarterSum3 = profitHiostoryService.getQuarterSum(lastYear[2]+"-01",lastYear[2]+"-28");
                                if (quarterSum3 == null){
                                    quarterSum3 = "0.00";
                                }
                                String quarterSum4 = profitHiostoryService.getQuarterSum(lastYear[3]+"-01",lastYear[3]+"-28");
                                if (quarterSum4 == null){
                                    quarterSum4 = "0.00";
                                }
                                String quarterSum5 = profitHiostoryService.getQuarterSum(lastYear[4]+"-01",lastYear[4]+"-28");
                                if (quarterSum5 == null){
                                    quarterSum5 = "0.00";
                                }
                                String quarterSum6 = profitHiostoryService.getQuarterSum(lastYear[5]+"-01",lastYear[5]+"-28");
                                if (quarterSum6 == null){
                                    quarterSum6 = "0.00";
                                }
                                String quarterSum7 = profitHiostoryService.getQuarterSum(lastYear[6]+"-01",lastYear[6]+"-28");
                                if (quarterSum7 == null){
                                    quarterSum7 = "0.00";
                                }
                                String quarterSum8 = profitHiostoryService.getQuarterSum(lastYear[7]+"-01",lastYear[7]+"-28");
                                if (quarterSum8 == null){
                                    quarterSum8 = "0.00";
                                }
                                String quarterSum9 = profitHiostoryService.getQuarterSum(lastYear[8]+"-01",lastYear[8]+"-28");
                                if (quarterSum9 == null){
                                    quarterSum9 = "0.00";
                                }
                                String quarterSum10 = profitHiostoryService.getQuarterSum(lastYear[9]+"-01",lastYear[9]+"-28");
                                if (quarterSum10 == null){
                                    quarterSum10 = "0.00";
                                }
                                String quarterSum11 = profitHiostoryService.getQuarterSum(lastYear[10]+"-01",lastYear[10]+"-28");
                                if (quarterSum11 == null){
                                    quarterSum11 = "0.00";
                                }
                                String quarterSum12 = profitHiostoryService.getQuarterSum(lastYear[11]+"-01",lastYear[11]+"-28");
                                if (quarterSum12 == null){
                                    quarterSum12 = "0.00";
                                }
                                Double quarterSum = Double.parseDouble(quarterSum1.replaceAll(",","")) + Double.parseDouble(quarterSum2.replaceAll(",","")) +
                                Double.parseDouble(quarterSum3.replaceAll(",","")) + Double.parseDouble(quarterSum4.replaceAll(",","")) +
                                Double.parseDouble(quarterSum5.replaceAll(",","")) + Double.parseDouble(quarterSum6.replaceAll(",","")) +
                                Double.parseDouble(quarterSum7.replaceAll(",","")) + Double.parseDouble(quarterSum8.replaceAll(",","")) +
                                Double.parseDouble(quarterSum9.replaceAll(",","")) + Double.parseDouble(quarterSum10.replaceAll(",","")) +
                                Double.parseDouble(quarterSum11.replaceAll(",","")) + Double.parseDouble(quarterSum12.replaceAll(",",""));

                                //获取系统参数配置
                                Sysconfig sysConfig = sysconfigService.getSysConfig();
                                Double yearProfitPer = 0.00;
                                if (!Tools.isEmpty(sysConfig.getYearProfitPer())){
                                    yearProfitPer = sysConfig.getYearProfitPer();
                                }

                                //获取产品销售提成
                                String salesCommission1 = orderService.getSUMsalesCommission(lastYear[0]+"-01 00:00:00",lastYear[0]+"-28 23:59:59");
                                if (salesCommission1 == null){
                                    salesCommission1 = "0.00";
                                }
                                String salesCommission2 = orderService.getSUMsalesCommission(lastYear[1]+"-01 00:00:00",lastYear[1]+"-28 23:59:59");
                                if (salesCommission2 == null){
                                    salesCommission2 = "0.00";
                                }
                                String salesCommission3 = orderService.getSUMsalesCommission(lastYear[2]+"-01 00:00:00",lastYear[2]+"-28 23:59:59");
                                if (salesCommission3 == null){
                                    salesCommission3 = "0.00";
                                }
                                String salesCommission4 = orderService.getSUMsalesCommission(lastYear[3]+"-01 00:00:00",lastYear[3]+"-28 23:59:59");
                                if (salesCommission4 == null){
                                    salesCommission4 = "0.00";
                                }
                                String salesCommission5 = orderService.getSUMsalesCommission(lastYear[4]+"-01 00:00:00",lastYear[4]+"-28 23:59:59");
                                if (salesCommission5 == null){
                                    salesCommission5 = "0.00";
                                }
                                String salesCommission6 = orderService.getSUMsalesCommission(lastYear[5]+"-01 00:00:00",lastYear[5]+"-28 23:59:59");
                                if (salesCommission6 == null){
                                    salesCommission6 = "0.00";
                                }
                                String salesCommission7 = orderService.getSUMsalesCommission(lastYear[6]+"-01 00:00:00",lastYear[6]+"-28 23:59:59");
                                if (salesCommission7 == null){
                                    salesCommission7 = "0.00";
                                }
                                String salesCommission8 = orderService.getSUMsalesCommission(lastYear[7]+"-01 00:00:00",lastYear[7]+"-28 23:59:59");
                                if (salesCommission8 == null){
                                    salesCommission8 = "0.00";
                                }
                                String salesCommission9 = orderService.getSUMsalesCommission(lastYear[8]+"-01 00:00:00",lastYear[8]+"-28 23:59:59");
                                if (salesCommission9 == null){
                                    salesCommission9 = "0.00";
                                }
                                String salesCommission10 = orderService.getSUMsalesCommission(lastYear[9]+"-01 00:00:00",lastYear[9]+"-28 23:59:59");
                                if (salesCommission10 == null){
                                    salesCommission10 = "0.00";
                                }
                                String salesCommission11 = orderService.getSUMsalesCommission(lastYear[10]+"-01 00:00:00",lastYear[10]+"-28 23:59:59");
                                if (salesCommission11 == null){
                                    salesCommission11 = "0.00";
                                }
                                String salesCommission12 = orderService.getSUMsalesCommission(lastYear[11]+"-01 00:00:00",lastYear[11]+"-28 23:59:59");
                                if (salesCommission12 == null){
                                    salesCommission12 = "0.00";
                                }

                                Double salesCommission =
                                    Double.parseDouble(salesCommission1.replaceAll(",","")) + Double.parseDouble(salesCommission2.replaceAll(",","")) +
                                    Double.parseDouble(salesCommission3.replaceAll(",","")) + Double.parseDouble(salesCommission4.replaceAll(",","")) +
                                    Double.parseDouble(salesCommission5.replaceAll(",","")) + Double.parseDouble(salesCommission6.replaceAll(",","")) +
                                    Double.parseDouble(salesCommission7.replaceAll(",","")) + Double.parseDouble(salesCommission8.replaceAll(",","")) +
                                    Double.parseDouble(salesCommission9.replaceAll(",","")) + Double.parseDouble(salesCommission10.replaceAll(",","")) +
                                    Double.parseDouble(salesCommission11.replaceAll(",","")) + Double.parseDouble(salesCommission12.replaceAll(",",""));

                                //年分红总额 年分红总额 =
                                // （对应两日期的毛利润 - 对应两日期的毛利润 * 运行成本比例 - 产品销售提成 - 对应日期的日分红总额 - 对应日期的周分红总额 - 对应日期的月分红总额 - 对应日期的季度分红总额） * 年分红发放比例
                                Double sumYearProfit = (grossProfit -
                                        grossProfit * (sysConfig.getOperatingCostsPer() / 100 ) - salesCommission - daySum - weekSum - monthSum - quarterSum) * (yearProfitPer / 100);
                                if (sumYearProfit < 0){
                                    sumYearProfit = 0.00;
                                }
                                //获取符合条件的每位用户所得的季度分红，且保留小数点后两位，其余舍去 每位用户所得的季度分红 = 对应日期季度分红总额 / 上个季度符合季度分红标准的总人数
                                Double userYearProfit = Tools.twoPoint(sumYearProfit / userList.size());
                                if (userYearProfit < 0){
                                    userYearProfit = 0.00;
                                }
                                map.put("userYearProfit",userYearProfit);
                                map.put("sumYearProfit",sumYearProfit);
                                map.put("yearRangeOne",lastYear[0]);
                                map.put("yearRangeLast",lastYear[11]);
                                map.put("code","2000");
                            }else{
                                //没有满足条件的用户
                                map.put("code","1003");
                            }
                        }else{
                            //没有满足条件的用户
                            map.put("code","1003");
                        }
                    }else {
                        //不到发放日，请求停止
                        map.put("code","1002");
                    }
                }else {
                    //不到发放日，请求停止
                    map.put("code","1002");
                }
            }else{
                //今日已发放，请明日继续
                map.put("code","1001");
            }
        } catch (Exception e) {
            logger.error("获取符合年分红发放用户出错",e);
            map.put("code","5000");
        }
        return map;
    }

    /**
     * 执行发放年分红操作
     * @param yearUserId
     * @param sumYearProfit
     * @param userYearProfit
     * @param yearRangeOne
     * @param yearRangeLast
     * @return
     */
    @ResponseBody
    @RequestMapping("/executeYearProfit")
    @Transactional
    public boolean executeYearProfit(
            @RequestParam("yearUserId") Integer[] yearUserId,
            @RequestParam("sumYearProfit") Double sumYearProfit,
            @RequestParam("userYearProfit") Double userYearProfit,
            @RequestParam("yearRangeOne") String yearRangeOne,
            @RequestParam("yearRangeLast") String yearRangeLast){
        try {
            if (yearUserId != null){
                for (Integer yearUser:yearUserId) {
                    //获取符合分红发放的用户ID
                    //获取用户信息，获取用户分红账户
                    User user = userService.getUserMSGByUserId(yearUser);
                    //获取用户的分红
                    if (user != null && user.getUserProfitAccount()!= null){
                        //修改分红
                        User _user = new User();
                        if (user.getUserProfitAccount() != 0){
                            _user.setUserProfitAccount(user.getUserProfitAccount() + userYearProfit.floatValue());
                        }else{
                            _user.setUserProfitAccount(userYearProfit.floatValue());
                        }
                        _user.setId(yearUser);
                        int count = userService.update_user(_user);
                        if (count > 0){
                            //添加年分红记录
                            ShareProfitSourceLog shareProfitSourceLog = new ShareProfitSourceLog();
                            shareProfitSourceLog.setAddtime(Tools.date2Str(new Date()));
                            shareProfitSourceLog.setUserId(yearUser);
                            shareProfitSourceLog.setMoney(userYearProfit.floatValue());
                            shareProfitSourceLog.setType(5);
                            boolean flag = shareProfitSourceLogService.addPlateGrantProfitLog(shareProfitSourceLog);
                            if (!flag){
                                return false;
                            }
                        }else {
                            return false;
                        }
                    }
                }
                String dayUserIdStr=StringUtils.join(yearUserId,",");
                //执行添加发放分红操作
                ProfitHiostory profitHiostory = new ProfitHiostory();
                profitHiostory.setAddtime(Tools.date2Str(new Date()));
                profitHiostory.setProfitHiostoryDate(yearRangeOne);
                profitHiostory.setProfitHiostoryEndDate(yearRangeLast);
                profitHiostory.setProfitType(5);
                profitHiostory.setSumProfitMoney(sumYearProfit.floatValue());
                profitHiostory.setUserIds(dayUserIdStr);
                return profitHiostoryService.addProfitHiostory(profitHiostory);
            }
        } catch (Exception e) {
            logger.error("执行发放年分红操作出错",e);
        }
        return false;
    }

    /*****************************年分红操作end********************************/

    /****************************杰出贡献奖操作start***************************/
    /**
     * 获取杰出贡献奖
     * @return
     */
    @ResponseBody
    @RequestMapping("/getOutstandingContributionProfit")
    @Transactional
    public Map<String, Object> getOutstandingContributionProfit(){
        HashMap<String, Object> map = new HashMap<String, Object>();
        try {
            map = new HashMap<String, Object>();
            //根据当前日期和分红类型获取分红来源记录(获取杰出贡献记录) 判断今日是否发放，防止重复发放
            List<ShareProfitSourceLog> shareProfitSourceLogs = shareProfitSourceLogService.getShareProfitLog(7,new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            if (shareProfitSourceLogs.size() <= 0){
                //判断是否到发放日期（每年1月15号）
                if (Calendar.getInstance().get(Calendar.DAY_OF_MONTH) == 15){
                    //获取对应的杰出贡献奖发放日 每月15号进行发放
                    String[] lastYear = Tools.getLastYear();
                    if(lastYear[0] != null && lastYear[1] != null){
                        //1、获取符合条件的用户
                        // 获取所有用户
                        List<User> userAllList = userService.getAllUserList();
                        if(userAllList.size() > 0){
                            //用于存放职称是合伙人且连续满足自我消费积分到12个月之上的用户
                            ArrayList<User> userList2 = new ArrayList<User>();
                            for (int i = 0; i < userAllList.size(); i++){
                                //判断是否是合伙人且连续满足条件到12个月之上 筛选出一级
                                if (userAllList.get(i).getUserRole() >= 2 && userAllList.get(i).getYearProfitContinuousMonth() >= 12){
                                    userList2.add(userAllList.get(i));
                                }
                            }
                            //用于存放满足条件的用户
                            ArrayList<User> userList = new ArrayList<User>();
                            if (userList2.size() > 0){
                                for (int i = 0; i < userList2.size(); i++){
                                    //获取已满足合伙人且连续满足条件到12个月之上的用户信息 满足条件的一级用户信息
                                    User userOne = userService.getUserMSGByUserId(userList2.get(i).getId());
                                    if (userOne != null && userOne.getUserShareid() != null){
                                        //用于存放一级以下符合条件的用户
                                        ArrayList<User> user = new ArrayList<User>();
                                        //获取二级
                                        List<User> userTwo = userService.getDownLevelUser(userOne.getUserShareid());
                                        if (userTwo.size() > 0){
                                            for (int j = 0; j < userTwo.size(); j++){
                                                ////后大于等于前 返回-1
                                                int resj1=Tools.compare_date(lastYear[0]+"-01 00:00:00",userTwo.get(j).getUserAddtime());
                                                ////前大于等于后 返回-1
                                                int resj2=Tools.compare_date(userTwo.get(j).getUserAddtime(),lastYear[11]+"-28 23:59:59");
                                                ////判断下级是否是在规定的时间内且是否是创始合伙人
                                                if (resj1 == -1 && resj2 == -1 && userTwo.get(j).getUserRole() == 4 && userTwo.get(j).getYearProfitContinuousMonth() >= 12){
                                                    //将满足条件的用户存放于user
                                                    user.add(userTwo.get(j));
                                                    //获取三级
                                                    List<User> userThree = userService.getDownLevelUser(userTwo.get(j).getUserShareid());
                                                    if (userThree.size() > 0){
                                                        for (int k = 0; k < userThree.size(); k++){
                                                            //后大于等于前 返回-1
                                                            int resk1=Tools.compare_date(lastYear[0]+"-01 00:00:00",userThree.get(k).getUserAddtime());
                                                            //前大于等于后 返回-1
                                                            int resk2=Tools.compare_date(userThree.get(k).getUserAddtime(),lastYear[11]+"-28 23:59:59");
                                                            if (resk1 == -1 && resk2 == -1 && userThree.get(k).getUserRole() == 4 && userThree.get(k).getYearProfitContinuousMonth() >= 12){
                                                                //将满足条件的用户存放于user
                                                                user.add(userThree.get(k));
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        //判断user大小
                                        if (user.size() >= 1){
                                            userList.add(userOne);
                                        }
                                    }
                                }
                            }
                            if (userList.size() > 0){
                                //存放满足杰出贡献奖发放的所有用户ID
                                Integer[] userId = new Integer[userList.size()];
                                for (int i = 0; i < userList.size(); i++){
                                    userId[i] = userList.get(i).getId();
                                }
                                //获取满足杰出贡献奖发放的所有用户
                                map.put("userList",userList);
                                //获取满足杰出贡献奖发放的所有用户ID
                                map.put("userId",userId);

                                //2、获取各用户应得杰出贡献奖金额
                                //获取两日期之间成交订单销售总金额
                                String sumGoodsprice1 = orderService.getSUMGoodsPriceByDataRange(lastYear[0] + "-01 00:00:00",lastYear[0] + "-28 23:59:59");
                                if (sumGoodsprice1 == null){
                                    sumGoodsprice1 = "0.00";
                                }
                                String sumGoodsprice2 = orderService.getSUMGoodsPriceByDataRange(lastYear[1] + "-01 00:00:00",lastYear[1] + "-28 23:59:59");
                                if (sumGoodsprice2 == null){
                                    sumGoodsprice2 = "0.00";
                                }
                                String sumGoodsprice3 = orderService.getSUMGoodsPriceByDataRange(lastYear[2] + "-01 00:00:00",lastYear[2] + "-28 23:59:59");
                                if (sumGoodsprice3 == null){
                                    sumGoodsprice3 = "0.00";
                                }
                                String sumGoodsprice4 = orderService.getSUMGoodsPriceByDataRange(lastYear[3] + "-01 00:00:00",lastYear[3] + "-28 23:59:59");
                                if (sumGoodsprice4 == null){
                                    sumGoodsprice4 = "0.00";
                                }
                                String sumGoodsprice5 = orderService.getSUMGoodsPriceByDataRange(lastYear[4] + "-01 00:00:00",lastYear[4] + "-28 23:59:59");
                                if (sumGoodsprice5 == null){
                                    sumGoodsprice5 = "0.00";
                                }
                                String sumGoodsprice6 = orderService.getSUMGoodsPriceByDataRange(lastYear[5] + "-01 00:00:00",lastYear[5] + "-28 23:59:59");
                                if (sumGoodsprice6 == null){
                                    sumGoodsprice6 = "0.00";
                                }String sumGoodsprice7 = orderService.getSUMGoodsPriceByDataRange(lastYear[6] + "-01 00:00:00",lastYear[6] + "-28 23:59:59");
                                if (sumGoodsprice7 == null){
                                    sumGoodsprice7 = "0.00";
                                }
                                String sumGoodsprice8 = orderService.getSUMGoodsPriceByDataRange(lastYear[7] + "-01 00:00:00",lastYear[7] + "-28 23:59:59");
                                if (sumGoodsprice8 == null){
                                    sumGoodsprice8 = "0.00";
                                }String sumGoodsprice9 = orderService.getSUMGoodsPriceByDataRange(lastYear[8] + "-01 00:00:00",lastYear[8] + "-28 23:59:59");
                                if (sumGoodsprice9 == null){
                                    sumGoodsprice9 = "0.00";
                                }
                                String sumGoodsprice10 = orderService.getSUMGoodsPriceByDataRange(lastYear[9] + "-01 00:00:00",lastYear[9] + "-28 23:59:59");
                                if (sumGoodsprice10 == null){
                                    sumGoodsprice10 = "0.00";
                                }String sumGoodsprice11 = orderService.getSUMGoodsPriceByDataRange(lastYear[10] + "-01 00:00:00",lastYear[10] + "-28 23:59:59");
                                if (sumGoodsprice11 == null){
                                    sumGoodsprice11 = "0.00";
                                }
                                String sumGoodsprice12 = orderService.getSUMGoodsPriceByDataRange(lastYear[11] + "-01 00:00:00",lastYear[11] + "-28 23:59:59");
                                if (sumGoodsprice12 == null){
                                    sumGoodsprice12 = "0.00";
                                }

                                Double sumGoodsprice =
                                        Double.parseDouble(sumGoodsprice1.replaceAll(",","")) + Double.parseDouble(sumGoodsprice2.replaceAll(",","")) +
                                                Double.parseDouble(sumGoodsprice3.replaceAll(",","")) + Double.parseDouble(sumGoodsprice4.replaceAll(",","")) +
                                                Double.parseDouble(sumGoodsprice5.replaceAll(",","")) + Double.parseDouble(sumGoodsprice6.replaceAll(",","")) +
                                                Double.parseDouble(sumGoodsprice7.replaceAll(",","")) + Double.parseDouble(sumGoodsprice8.replaceAll(",","")) +
                                                Double.parseDouble(sumGoodsprice9.replaceAll(",","")) + Double.parseDouble(sumGoodsprice10.replaceAll(",","")) +
                                                Double.parseDouble(sumGoodsprice11.replaceAll(",","")) + Double.parseDouble(sumGoodsprice12.replaceAll(",",""));

                                //获取两日期之间成交订单供货总价
                                String sumGoodsSupplyprice1 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[0] + "-01 00:00:00",lastYear[0] + "-28 23:59:59");
                                if (sumGoodsSupplyprice1 == null){
                                    sumGoodsSupplyprice1 = "0.00";
                                }
                                String sumGoodsSupplyprice2 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[1] + "-01 00:00:00",lastYear[1] + "-28 23:59:59");
                                if (sumGoodsSupplyprice2 == null){
                                    sumGoodsSupplyprice2 = "0.00";
                                }
                                String sumGoodsSupplyprice3 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[2] + "-01 00:00:00",lastYear[2] + "-28 23:59:59");
                                if (sumGoodsSupplyprice3 == null){
                                    sumGoodsSupplyprice3 = "0.00";
                                }
                                String sumGoodsSupplyprice4 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[3] + "-01 00:00:00",lastYear[3] + "-28 23:59:59");
                                if (sumGoodsSupplyprice4 == null){
                                    sumGoodsSupplyprice4 = "0.00";
                                }
                                String sumGoodsSupplyprice5 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[4] + "-01 00:00:00",lastYear[4] + "-28 23:59:59");
                                if (sumGoodsSupplyprice5 == null){
                                    sumGoodsSupplyprice5 = "0.00";
                                }
                                String sumGoodsSupplyprice6 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[5] + "-01 00:00:00",lastYear[5] + "-28 23:59:59");
                                if (sumGoodsSupplyprice6 == null){
                                    sumGoodsSupplyprice6 = "0.00";
                                }
                                String sumGoodsSupplyprice7 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[6] + "-01 00:00:00",lastYear[6] + "-28 23:59:59");
                                if (sumGoodsSupplyprice7 == null){
                                    sumGoodsSupplyprice7 = "0.00";
                                }
                                String sumGoodsSupplyprice8 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[7] + "-01 00:00:00",lastYear[7] + "-28 23:59:59");
                                if (sumGoodsSupplyprice8 == null){
                                    sumGoodsSupplyprice8 = "0.00";
                                }
                                String sumGoodsSupplyprice9 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[8] + "-01 00:00:00",lastYear[8] + "-28 23:59:59");
                                if (sumGoodsSupplyprice9 == null){
                                    sumGoodsSupplyprice9 = "0.00";
                                }
                                String sumGoodsSupplyprice10 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[9] + "-01 00:00:00",lastYear[9] + "-28 23:59:59");
                                if (sumGoodsSupplyprice10 == null){
                                    sumGoodsSupplyprice10 = "0.00";
                                }
                                String sumGoodsSupplyprice11 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[10] + "-01 00:00:00",lastYear[10] + "-28 23:59:59");
                                if (sumGoodsSupplyprice11 == null){
                                    sumGoodsSupplyprice11 = "0.00";
                                }
                                String sumGoodsSupplyprice12 = orderService.getSUMGoodsSupplyPriceByDataRange(lastYear[11] + "-01 00:00:00",lastYear[11] + "-28 23:59:59");
                                if (sumGoodsSupplyprice12 == null){
                                    sumGoodsSupplyprice12 = "0.00";
                                }

                                Double sumGoodsSupplyprice =
                                        Double.parseDouble(sumGoodsSupplyprice1.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice2.replaceAll(",","")) +
                                                Double.parseDouble(sumGoodsSupplyprice3.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice4.replaceAll(",","")) +
                                                Double.parseDouble(sumGoodsSupplyprice5.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice6.replaceAll(",","")) +
                                                Double.parseDouble(sumGoodsSupplyprice7.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice8.replaceAll(",","")) +
                                                Double.parseDouble(sumGoodsSupplyprice9.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice10.replaceAll(",","")) +
                                                Double.parseDouble(sumGoodsSupplyprice11.replaceAll(",","")) + Double.parseDouble(sumGoodsSupplyprice12.replaceAll(",",""));


                                //获取毛利润  毛利润 = 两日期之间成交订单销售总金额 - 减运费 - 两日期之间成交订单供货总价
                                Double grossProfit = sumGoodsprice - sumGoodsSupplyprice;
                                if(grossProfit < 0){
                                    grossProfit = 0.00;
                                }
                                //获取对应日期发放的日分红总额  日分红总额 = 对应两日期之间各天日分红总额
                                String daySum1 = profitHiostoryService.getDaySum(lastYear[0]+"-01",lastYear[0]+"-28");
                                if (daySum1 == null){
                                    daySum1 = "0.00";
                                }
                                String daySum2 = profitHiostoryService.getDaySum(lastYear[1]+"-01",lastYear[1]+"-28");
                                if (daySum2 == null){
                                    daySum2 = "0.00";
                                }
                                String daySum3 = profitHiostoryService.getDaySum(lastYear[2]+"-01",lastYear[2]+"-28");
                                if (daySum3 == null){
                                    daySum3 = "0.00";
                                }
                                String daySum4 = profitHiostoryService.getDaySum(lastYear[3]+"-01",lastYear[3]+"-28");
                                if (daySum4 == null){
                                    daySum4 = "0.00";
                                }
                                String daySum5 = profitHiostoryService.getDaySum(lastYear[4]+"-01",lastYear[4]+"-28");
                                if (daySum5 == null){
                                    daySum5 = "0.00";
                                }
                                String daySum6 = profitHiostoryService.getDaySum(lastYear[5]+"-01",lastYear[5]+"-28");
                                if (daySum6 == null){
                                    daySum6 = "0.00";
                                }
                                String daySum7 = profitHiostoryService.getDaySum(lastYear[6]+"-01",lastYear[6]+"-28");
                                if (daySum7 == null){
                                    daySum7 = "0.00";
                                }
                                String daySum8 = profitHiostoryService.getDaySum(lastYear[7]+"-01",lastYear[7]+"-28");
                                if (daySum8 == null){
                                    daySum8 = "0.00";
                                }
                                String daySum9 = profitHiostoryService.getDaySum(lastYear[8]+"-01",lastYear[8]+"-28");
                                if (daySum9 == null){
                                    daySum9 = "0.00";
                                }
                                String daySum10 = profitHiostoryService.getDaySum(lastYear[9]+"-01",lastYear[9]+"-28");
                                if (daySum10 == null){
                                    daySum10 = "0.00";
                                }
                                String daySum11 = profitHiostoryService.getDaySum(lastYear[10]+"-01",lastYear[10]+"-28");
                                if (daySum11 == null){
                                    daySum11 = "0.00";
                                }
                                String daySum12 = profitHiostoryService.getDaySum(lastYear[11]+"-01",lastYear[11]+"-28");
                                if (daySum12 == null){
                                    daySum12 = "0.00";
                                }
                                Double daySum =
                                        Double.parseDouble(daySum1.replaceAll(",","")) + Double.parseDouble(daySum2.replaceAll(",","")) +
                                                Double.parseDouble(daySum3.replaceAll(",","")) + Double.parseDouble(daySum4.replaceAll(",","")) +
                                                Double.parseDouble(daySum5.replaceAll(",","")) + Double.parseDouble(daySum6.replaceAll(",","")) +
                                                Double.parseDouble(daySum7.replaceAll(",","")) + Double.parseDouble(daySum8.replaceAll(",","")) +
                                                Double.parseDouble(daySum9.replaceAll(",","")) + Double.parseDouble(daySum10.replaceAll(",","")) +
                                                Double.parseDouble(daySum11.replaceAll(",","")) + Double.parseDouble(daySum12.replaceAll(",",""));


                                //获取对应日期发放的周分红总额  周分红总额 = 对应两日期之间各天周分红总额
                                String weekSum1 = profitHiostoryService.getWeekSum(lastYear[0]+"-01",lastYear[0]+"-28");
                                if (weekSum1 == null){
                                    weekSum1 = "0.00";
                                }
                                String weekSum2 = profitHiostoryService.getWeekSum(lastYear[1]+"-01",lastYear[1]+"-28");
                                if (weekSum2 == null){
                                    weekSum2 = "0.00";
                                }
                                String weekSum3 = profitHiostoryService.getWeekSum(lastYear[2]+"-01",lastYear[2]+"-28");
                                if (weekSum3 == null){
                                    weekSum3 = "0.00";
                                }
                                String weekSum4 = profitHiostoryService.getWeekSum(lastYear[3]+"-01",lastYear[3]+"-28");
                                if (weekSum4 == null){
                                    weekSum4 = "0.00";
                                }
                                String weekSum5 = profitHiostoryService.getWeekSum(lastYear[4]+"-01",lastYear[4]+"-28");
                                if (weekSum5 == null){
                                    weekSum5 = "0.00";
                                }
                                String weekSum6 = profitHiostoryService.getWeekSum(lastYear[5]+"-01",lastYear[5]+"-28");
                                if (weekSum6 == null){
                                    weekSum6 = "0.00";
                                }
                                String weekSum7 = profitHiostoryService.getWeekSum(lastYear[5]+"-01",lastYear[6]+"-28");
                                if (weekSum7 == null){
                                    weekSum7 = "0.00";
                                }
                                String weekSum8 = profitHiostoryService.getWeekSum(lastYear[7]+"-01",lastYear[7]+"-28");
                                if (weekSum8 == null){
                                    weekSum8 = "0.00";
                                }
                                String weekSum9 = profitHiostoryService.getWeekSum(lastYear[8]+"-01",lastYear[8]+"-28");
                                if (weekSum9 == null){
                                    weekSum9 = "0.00";
                                }
                                String weekSum10 = profitHiostoryService.getWeekSum(lastYear[9]+"-01",lastYear[9]+"-28");
                                if (weekSum10 == null){
                                    weekSum10 = "0.00";
                                }
                                String weekSum11 = profitHiostoryService.getWeekSum(lastYear[10]+"-01",lastYear[10]+"-28");
                                if (weekSum11 == null){
                                    weekSum11 = "0.00";
                                }
                                String weekSum12 = profitHiostoryService.getWeekSum(lastYear[11]+"-01",lastYear[11]+"-28");
                                if (weekSum12 == null){
                                    weekSum12 = "0.00";
                                }

                                Double weekSum =
                                        Double.parseDouble(weekSum1.replaceAll(",","")) + Double.parseDouble(weekSum2.replaceAll(",","")) +
                                                Double.parseDouble(weekSum3.replaceAll(",","")) + Double.parseDouble(weekSum4.replaceAll(",","")) +
                                                Double.parseDouble(weekSum5.replaceAll(",","")) + Double.parseDouble(weekSum6.replaceAll(",","")) +
                                                Double.parseDouble(weekSum7.replaceAll(",","")) + Double.parseDouble(weekSum8.replaceAll(",","")) +
                                                Double.parseDouble(weekSum9.replaceAll(",","")) + Double.parseDouble(weekSum10.replaceAll(",","")) +
                                                Double.parseDouble(weekSum11.replaceAll(",","")) + Double.parseDouble(weekSum12.replaceAll(",",""));


                                //获取对应日期发放的月分红总额  月分红总额 = 对应两日期之间各月分红总额
                                String monthSum1 = profitHiostoryService.getMonthSum(lastYear[0]+"-01",lastYear[0]+"-28");
                                if (monthSum1 == null){
                                    monthSum1 = "0.00";
                                }
                                String monthSum2 = profitHiostoryService.getMonthSum(lastYear[1]+"-01",lastYear[1]+"-28");
                                if (monthSum2 == null){
                                    monthSum2 = "0.00";
                                }
                                String monthSum3 = profitHiostoryService.getMonthSum(lastYear[2]+"-01",lastYear[2]+"-28");
                                if (monthSum3 == null){
                                    monthSum3 = "0.00";
                                }
                                String monthSum4 = profitHiostoryService.getMonthSum(lastYear[3]+"-01",lastYear[3]+"-28");
                                if (monthSum4 == null){
                                    monthSum4 = "0.00";
                                }
                                String monthSum5 = profitHiostoryService.getMonthSum(lastYear[4]+"-01",lastYear[4]+"-28");
                                if (monthSum5 == null){
                                    monthSum5 = "0.00";
                                }
                                String monthSum6 = profitHiostoryService.getMonthSum(lastYear[5]+"-01",lastYear[5]+"-28");
                                if (monthSum6 == null){
                                    monthSum6 = "0.00";
                                }
                                String monthSum7 = profitHiostoryService.getMonthSum(lastYear[6]+"-01",lastYear[6]+"-28");
                                if (monthSum7 == null){
                                    monthSum7 = "0.00";
                                }
                                String monthSum8 = profitHiostoryService.getMonthSum(lastYear[7]+"-01",lastYear[7]+"-28");
                                if (monthSum8 == null){
                                    monthSum8 = "0.00";
                                }
                                String monthSum9 = profitHiostoryService.getMonthSum(lastYear[8]+"-01",lastYear[8]+"-28");
                                if (monthSum9 == null){
                                    monthSum9 = "0.00";
                                }
                                String monthSum10 = profitHiostoryService.getMonthSum(lastYear[9]+"-01",lastYear[9]+"-28");
                                if (monthSum10 == null){
                                    monthSum10 = "0.00";
                                }
                                String monthSum11 = profitHiostoryService.getMonthSum(lastYear[10]+"-01",lastYear[10]+"-28");
                                if (monthSum11 == null){
                                    monthSum11 = "0.00";
                                }
                                String monthSum12 = profitHiostoryService.getMonthSum(lastYear[11]+"-01",lastYear[11]+"-28");
                                if (monthSum12 == null){
                                    monthSum12 = "0.00";
                                }

                                Double monthSum=
                                        Double.parseDouble(monthSum1.replaceAll(",","")) + Double.parseDouble(monthSum2.replaceAll(",","")) +
                                                Double.parseDouble(monthSum3.replaceAll(",","")) + Double.parseDouble(monthSum4.replaceAll(",","")) +
                                                Double.parseDouble(monthSum5.replaceAll(",","")) + Double.parseDouble(monthSum6.replaceAll(",","")) +
                                                Double.parseDouble(monthSum7.replaceAll(",","")) + Double.parseDouble(monthSum8.replaceAll(",","")) +
                                                Double.parseDouble(monthSum9.replaceAll(",","")) + Double.parseDouble(monthSum10.replaceAll(",","")) +
                                                Double.parseDouble(monthSum11.replaceAll(",","")) + Double.parseDouble(monthSum12.replaceAll(",",""));

                                //获取对应日期发放的季度分红总额  季度分红总额 = 对应两日期之间各月分红总额
                                String quarterSum1 = profitHiostoryService.getQuarterSum(lastYear[0]+"-01",lastYear[0]+"-28");
                                if (quarterSum1 == null){
                                    quarterSum1 = "0.00";
                                }
                                String quarterSum2 = profitHiostoryService.getQuarterSum(lastYear[1]+"-01",lastYear[1]+"-28");
                                if (quarterSum2 == null){
                                    quarterSum2 = "0.00";
                                }
                                String quarterSum3 = profitHiostoryService.getQuarterSum(lastYear[2]+"-01",lastYear[2]+"-28");
                                if (quarterSum3 == null){
                                    quarterSum3 = "0.00";
                                }
                                String quarterSum4 = profitHiostoryService.getQuarterSum(lastYear[3]+"-01",lastYear[3]+"-28");
                                if (quarterSum4 == null){
                                    quarterSum4 = "0.00";
                                }
                                String quarterSum5 = profitHiostoryService.getQuarterSum(lastYear[4]+"-01",lastYear[4]+"-28");
                                if (quarterSum5 == null){
                                    quarterSum5 = "0.00";
                                }
                                String quarterSum6 = profitHiostoryService.getQuarterSum(lastYear[5]+"-01",lastYear[5]+"-28");
                                if (quarterSum6 == null){
                                    quarterSum6 = "0.00";
                                }
                                String quarterSum7 = profitHiostoryService.getQuarterSum(lastYear[6]+"-01",lastYear[6]+"-28");
                                if (quarterSum7 == null){
                                    quarterSum7 = "0.00";
                                }
                                String quarterSum8 = profitHiostoryService.getQuarterSum(lastYear[7]+"-01",lastYear[7]+"-28");
                                if (quarterSum8 == null){
                                    quarterSum8 = "0.00";
                                }
                                String quarterSum9 = profitHiostoryService.getQuarterSum(lastYear[8]+"-01",lastYear[8]+"-28");
                                if (quarterSum9 == null){
                                    quarterSum9 = "0.00";
                                }
                                String quarterSum10 = profitHiostoryService.getQuarterSum(lastYear[9]+"-01",lastYear[9]+"-28");
                                if (quarterSum10 == null){
                                    quarterSum10 = "0.00";
                                }
                                String quarterSum11 = profitHiostoryService.getQuarterSum(lastYear[10]+"-01",lastYear[10]+"-28");
                                if (quarterSum11 == null){
                                    quarterSum11 = "0.00";
                                }
                                String quarterSum12 = profitHiostoryService.getQuarterSum(lastYear[11]+"-01",lastYear[11]+"-28");
                                if (quarterSum12 == null){
                                    quarterSum12 = "0.00";
                                }
                                Double quarterSum = Double.parseDouble(quarterSum1.replaceAll(",","")) + Double.parseDouble(quarterSum2.replaceAll(",","")) +
                                        Double.parseDouble(quarterSum3.replaceAll(",","")) + Double.parseDouble(quarterSum4.replaceAll(",","")) +
                                        Double.parseDouble(quarterSum5.replaceAll(",","")) + Double.parseDouble(quarterSum6.replaceAll(",","")) +
                                        Double.parseDouble(quarterSum7.replaceAll(",","")) + Double.parseDouble(quarterSum8.replaceAll(",","")) +
                                        Double.parseDouble(quarterSum9.replaceAll(",","")) + Double.parseDouble(quarterSum10.replaceAll(",","")) +
                                        Double.parseDouble(quarterSum11.replaceAll(",","")) + Double.parseDouble(quarterSum12.replaceAll(",",""));



                                //获取对应日期发放的年分红总额  年分红总额 = 对应两日期之间各月分红总额
                                String yearSum = profitHiostoryService.getYearSum(lastYear[0]+"-01",lastYear[11]+"-28");
                                if (yearSum == null){
                                    yearSum = "0.00";
                                }

                                //获取产品销售提成
                                String salesCommission1 = orderService.getSUMsalesCommission(lastYear[0]+"-01 00:00:00",lastYear[0]+"-28 23:59:59");
                                if (salesCommission1 == null){
                                    salesCommission1 = "0.00";
                                }
                                String salesCommission2 = orderService.getSUMsalesCommission(lastYear[1]+"-01 00:00:00",lastYear[1]+"-28 23:59:59");
                                if (salesCommission2 == null){
                                    salesCommission2 = "0.00";
                                }
                                String salesCommission3 = orderService.getSUMsalesCommission(lastYear[2]+"-01 00:00:00",lastYear[2]+"-28 23:59:59");
                                if (salesCommission3 == null){
                                    salesCommission3 = "0.00";
                                }
                                String salesCommission4 = orderService.getSUMsalesCommission(lastYear[3]+"-01 00:00:00",lastYear[3]+"-28 23:59:59");
                                if (salesCommission4 == null){
                                    salesCommission4 = "0.00";
                                }
                                String salesCommission5 = orderService.getSUMsalesCommission(lastYear[4]+"-01 00:00:00",lastYear[4]+"-28 23:59:59");
                                if (salesCommission5 == null){
                                    salesCommission5 = "0.00";
                                }
                                String salesCommission6 = orderService.getSUMsalesCommission(lastYear[5]+"-01 00:00:00",lastYear[5]+"-28 23:59:59");
                                if (salesCommission6 == null){
                                    salesCommission6 = "0.00";
                                }
                                String salesCommission7 = orderService.getSUMsalesCommission(lastYear[6]+"-01 00:00:00",lastYear[6]+"-28 23:59:59");
                                if (salesCommission7 == null){
                                    salesCommission7 = "0.00";
                                }
                                String salesCommission8 = orderService.getSUMsalesCommission(lastYear[7]+"-01 00:00:00",lastYear[7]+"-28 23:59:59");
                                if (salesCommission8 == null){
                                    salesCommission8 = "0.00";
                                }
                                String salesCommission9 = orderService.getSUMsalesCommission(lastYear[8]+"-01 00:00:00",lastYear[8]+"-28 23:59:59");
                                if (salesCommission9 == null){
                                    salesCommission9 = "0.00";
                                }
                                String salesCommission10 = orderService.getSUMsalesCommission(lastYear[9]+"-01 00:00:00",lastYear[9]+"-28 23:59:59");
                                if (salesCommission10 == null){
                                    salesCommission10 = "0.00";
                                }
                                String salesCommission11 = orderService.getSUMsalesCommission(lastYear[10]+"-01 00:00:00",lastYear[10]+"-28 23:59:59");
                                if (salesCommission11 == null){
                                    salesCommission11 = "0.00";
                                }
                                String salesCommission12 = orderService.getSUMsalesCommission(lastYear[11]+"-01 00:00:00",lastYear[11]+"-28 23:59:59");
                                if (salesCommission12 == null){
                                    salesCommission12 = "0.00";
                                }

                                Double salesCommission =
                                        Double.parseDouble(salesCommission1.replaceAll(",","")) + Double.parseDouble(salesCommission2.replaceAll(",","")) +
                                                Double.parseDouble(salesCommission3.replaceAll(",","")) + Double.parseDouble(salesCommission4.replaceAll(",","")) +
                                                Double.parseDouble(salesCommission5.replaceAll(",","")) + Double.parseDouble(salesCommission6.replaceAll(",","")) +
                                                Double.parseDouble(salesCommission7.replaceAll(",","")) + Double.parseDouble(salesCommission8.replaceAll(",","")) +
                                                Double.parseDouble(salesCommission9.replaceAll(",","")) + Double.parseDouble(salesCommission10.replaceAll(",","")) +
                                                Double.parseDouble(salesCommission11.replaceAll(",","")) + Double.parseDouble(salesCommission12.replaceAll(",",""));

                                //获取系统参数配置
                                Sysconfig sysConfig = sysconfigService.getSysConfig();
                                Double outstandingContributionProfitPer = 0.00;
                                if (!Tools.isEmpty(sysConfig.getYearProfitPer())){
                                    outstandingContributionProfitPer = sysConfig.getSpecialContributeAward();
                                }
                                //杰出贡献奖总额 杰出贡献奖总额 =
                                // （对应两日期的毛利润 - 对应两日期的毛利润 * 运行成本比例 - 产品销售提成 - 对应日期的日分红总额 - 对应日期的周分红总额 - 对应日期的月分红总额 - 对应日期的季度分红总额 - 对应日期的年分红总额） * 杰出贡献奖发放比例
                                Double sumOutstandingContributionProfit = (grossProfit -
                                        grossProfit * (sysConfig.getOperatingCostsPer() / 100 ) - salesCommission - daySum - weekSum - monthSum - quarterSum -
                                        Double.parseDouble(yearSum.replaceAll(",",""))) * (outstandingContributionProfitPer / 100);
                                if (sumOutstandingContributionProfit < 0){
                                    sumOutstandingContributionProfit = 0.00;
                                }
                                //获取符合条件的每位用户所得的杰出贡献奖，且保留小数点后两位，其余舍去 每位用户所得的杰出贡献奖 = 对应日期杰出贡献奖总额 / 符合季度分红标准的总人数
                                Double userOutstandingContributionProfit = Tools.twoPoint(sumOutstandingContributionProfit / userList.size());
                                if (userOutstandingContributionProfit < 0){
                                    userOutstandingContributionProfit = 0.00;
                                }
                                map.put("userOutstandingContributionProfit",userOutstandingContributionProfit);
                                map.put("sumOutstandingContributionProfit",sumOutstandingContributionProfit);
                                map.put("outstandingContributionRangeOne",lastYear[0]);
                                map.put("outstandingContributionRangeLast",lastYear[11]);
                                map.put("code","2000");
                            }else{
                                //没有满足条件的用户
                                map.put("code","1003");
                            }
                        }else{
                            //没有满足条件的用户
                            map.put("code","1003");
                        }
                    }else {
                        //不到发放日，请求停止
                        map.put("code","1002");
                    }
                }else {
                    //不到发放日，请求停止
                    map.put("code","1002");
                }
            }else{
                //今日已发放，请明日继续
                map.put("code","1001");
            }
        } catch (Exception e) {
            logger.error("获取符合年分红发放用户出错",e);
            map.put("code","5000");
        }
        return map;
    }

    /**
     * 执行杰出贡献奖发放操作
     * @param outstandingContributionUserId
     * @param sumOutstandingContributionProfit
     * @param userOutstandingContributionProfit
     * @param outstandingContributionRangeOne
     * @param outstandingContributionRangeLast
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/executeOutstandingContributionProfit" ,method = RequestMethod.POST)
    @Transactional
    public boolean executeOutstandingContributionProfit(
            @RequestParam("outstandingContributionUserId") Integer[] outstandingContributionUserId,
            @RequestParam("sumOutstandingContributionProfit") Double sumOutstandingContributionProfit,
            @RequestParam("userOutstandingContributionProfit") Double userOutstandingContributionProfit,
            @RequestParam("outstandingContributionRangeOne") String outstandingContributionRangeOne,
            @RequestParam("outstandingContributionRangeLast") String outstandingContributionRangeLast){
        try {
            if (outstandingContributionUserId != null){
                for (Integer outstandingContributionUser:outstandingContributionUserId) {
                    //获取符合分红发放的用户ID
                    //获取用户信息，获取用户分红账户
                    User user = userService.getUserMSGByUserId(outstandingContributionUser);
                    //获取用户的分红
                    if (user != null && user.getUserProfitAccount()!= null){
                        //修改分红
                        User _user = new User();
                        if (user.getUserProfitAccount() != 0){
                            _user.setUserProfitAccount(user.getUserProfitAccount() + userOutstandingContributionProfit.floatValue());
                        }else{
                            _user.setUserProfitAccount(userOutstandingContributionProfit.floatValue());
                        }
                        _user.setId(outstandingContributionUser);
                        int count = userService.update_user(_user);
                        if (count > 0){
                            //添加年分红记录
                            ShareProfitSourceLog shareProfitSourceLog = new ShareProfitSourceLog();
                            shareProfitSourceLog.setAddtime(Tools.date2Str(new Date()));
                            shareProfitSourceLog.setUserId(outstandingContributionUser);
                            shareProfitSourceLog.setMoney(userOutstandingContributionProfit.floatValue());
                            shareProfitSourceLog.setType(7);
                            boolean flag = shareProfitSourceLogService.addPlateGrantProfitLog(shareProfitSourceLog);
                            if (!flag){
                                return false;
                            }
                        }else {
                            return false;
                        }
                    }
                }
                String dayUserIdStr=StringUtils.join(outstandingContributionUserId,",");
                //执行添加发放分红操作
                ProfitHiostory profitHiostory = new ProfitHiostory();
                profitHiostory.setAddtime(Tools.date2Str(new Date()));
                profitHiostory.setProfitHiostoryDate(outstandingContributionRangeOne);
                profitHiostory.setProfitHiostoryEndDate(outstandingContributionRangeLast);
                profitHiostory.setProfitType(7);
                profitHiostory.setSumProfitMoney(sumOutstandingContributionProfit.floatValue());
                profitHiostory.setUserIds(dayUserIdStr);
                return profitHiostoryService.addProfitHiostory(profitHiostory);
            }
        } catch (Exception e) {
            logger.error("执行发放杰出贡献奖操作出错",e);
        }
        return false;
    }

    /****************************杰出贡献奖操作end*****************************/
    /*************************************************分红发放操作end****************************************************/


    /*************************************************分红记录操作start**************************************************/

    /**
     * 跳转到分红记录页面
     * @return
     */
    @RequestMapping("/go_participation_in_profit_logs")
    public ModelAndView go_participation_in_profit_logs(){
        return new ModelAndView("financial/participation_in_profit_logs.jsp");
    }

    /**
     * 根据类型获取分红记录
     * @param type
     * @return
     */
    @RequestMapping("/getShareProfitSourceLogByType")
    @ResponseBody
    public List<ShareProfitSourceLog> getShareProfitSourceLogByType(@RequestParam("type") Integer type){
        try {
            return shareProfitSourceLogService.getShareProfitSourceLogByType(type);
        } catch (Exception e) {
            logger.error("根据类型获取分红记录出错",e);
        }
        return null;
    }
    /*************************************************分红记录操作end****************************************************/

}
