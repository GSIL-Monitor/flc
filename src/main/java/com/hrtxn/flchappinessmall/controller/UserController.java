package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.pojo.Admin;
import com.hrtxn.flchappinessmall.pojo.CheckIntegralSourceLog;
import com.hrtxn.flchappinessmall.pojo.ShareProfitSourceLog;
import com.hrtxn.flchappinessmall.pojo.User;
import com.hrtxn.flchappinessmall.pojo.pojoVo.UserCountVo;
import com.hrtxn.flchappinessmall.pojo.pojoVo.UserVo;
import com.hrtxn.flchappinessmall.service.CheckIntegralSourceLogService;
import com.hrtxn.flchappinessmall.service.ShareProfitSourceLogService;
import com.hrtxn.flchappinessmall.service.UserService;
import com.hrtxn.flchappinessmall.tools.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description: 用户控制类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */

@Controller
@RequestMapping("/admin")
public class UserController {
    @Autowired//用户
    private UserService userService;

    @Autowired//考核积分来源记录
    private CheckIntegralSourceLogService checkIntegralSourceLogService;

    @Autowired//平台发放分红记录
    private ShareProfitSourceLogService shareProfitSourceLogService;

    private Logger logger = Logger.getLogger(UserController.class);

    /**
     * 获取所有用户信息
     * @return
     */
    @RequestMapping("/getAllUserList")
    public ModelAndView getAllUserList(){
        ModelAndView modelAndView = new ModelAndView("user/user_list.jsp");
        try {
            List<UserVo> userList = userService.getAllUserList2();

            for (UserVo userVo:userList){

            }
            if(userList.size() > 0){
                modelAndView.addObject("users",userList);
            }
        } catch (Exception e) {
            logger.error("获取用户信息出错",e);
        }
        return modelAndView;
    }

    /**
     * 根据id修改用户的信息
     * @param userStatus
     * @return
     */
    @RequestMapping("/update_user")
    @ResponseBody
    public boolean update_user(
        //修改用户信息
        //@RequestParam(value = "userNick", required = false) String userNick,
        //@RequestParam(value = "userTel", required = false) String userTel,
        @RequestParam(value = "userProfitAccount", required = false) Float userProfitAccount,
        @RequestParam(value = "userRole", required = false) Integer userRole,
        @RequestParam(value = "userCheckIntegral", required = false) Integer userCheckIntegral,
        //修改用户状态
        @RequestParam(value = "userStatus", required = false) Integer userStatus,
        //充值
        @RequestParam(value = "type", required = false) Integer type,
        //@RequestParam(value = "userPersonalIntegral", required = false) Integer userPersonalIntegral,
        @RequestParam(value = "_userProfitAccount", required = false) Float _userProfitAccount,

        @RequestParam(value = "id", required = true) Integer id ,
        HttpServletRequest request){
        try {
            User user = new User();
            user.setUserStatus(userStatus);
            //user.setUserNick(userNick);
            //user.setUserTel(userTel);
            user.setUserProfitAccount(userProfitAccount);
            user.setUserRole(userRole);
            user.setUserCheckIntegral(userCheckIntegral);
            //判断type是否为空
            if(!Tools.isEmpty(type)){
                //获取用户信息
                User userMSGByUserId = userService.getUserMSGByUserId(id);
                //判断获取的用户对象是否为空
                if (!Tools.isEmpty(userMSGByUserId)){
                    //充值积分
                    //if(type == 1){
                    //    if (!Tools.isEmpty(userMSGByUserId.getUserPersonalIntegral())) {
                    //        user.setUserPersonalIntegral(userPersonalIntegral + userMSGByUserId.getUserPersonalIntegral());
                    //    }else {
                    //        user.setUserPersonalIntegral(userPersonalIntegral);
                    //    }
                    //    //添加充值积分记录
                    //    CheckIntegralSourceLog checkIntegralSourceLog = new CheckIntegralSourceLog();
                    //    checkIntegralSourceLog.setIntegralAddtime(Tools.date2Str(new Date()));
                    //    checkIntegralSourceLog.setIntegralCount(userPersonalIntegral);
                    //    checkIntegralSourceLog.setUserId(id);
                    //    checkIntegralSourceLog.setIntegralHandlers(((Admin)request.getSession().getAttribute("admin")).getAdminNickName());
                    //    checkIntegralSourceLog.setIntegralType(2);
                    //    boolean flag = checkIntegralSourceLogService.addCheckIntegralSourceLog(checkIntegralSourceLog);
                    //    logger.info("添加充值积分记录"+flag);
                    //}
                    //充值分红
                    if (type ==  2){
                        if (!Tools.isEmpty(userMSGByUserId.getUserProfitAccount())){
                            user.setUserProfitAccount(_userProfitAccount + userMSGByUserId.getUserProfitAccount());
                        }else {
                            user.setUserProfitAccount(_userProfitAccount);
                        }
                        //添加平台充值分红记录
                        ShareProfitSourceLog shareProfitSourceLog = new ShareProfitSourceLog();
                        shareProfitSourceLog.setAddtime(Tools.date2Str(new Date()));
                        shareProfitSourceLog.setUserId(id);
                        shareProfitSourceLog.setMoney(_userProfitAccount);
                        shareProfitSourceLog.setHandlers(((Admin)request.getSession().getAttribute("admin")).getAdminNickName());
                        shareProfitSourceLog.setType(8);
                        boolean _flag = shareProfitSourceLogService.addPlateGrantProfitLog(shareProfitSourceLog);
                        logger.info("添加充值分红记录"+_flag);
                    }
                }
            }
            user.setId(id);
            return userService.update_user(user) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("根据id修改用户的信息出错",e);
        }
        return false;
    }

    /**
     * 跳转用户信息详情页
     * @return
     */
    @RequestMapping("/go_member_show")
    public ModelAndView go_member_show(){
        return new ModelAndView("user/member_show.jsp");
    }

    /**
     * 跳转用户分红来源记录页
     * @return
     */
    @RequestMapping("/go_withdrawal_logs")
    public ModelAndView go_withdrawal_logs(){
        return new ModelAndView("user/withdrawal_logs.jsp");
    }

    /**
     * 跳转用户积分来源记录页
     * @return
     */
    @RequestMapping("/go_integral_logs")
    public ModelAndView go_integral_logs(){
        return new ModelAndView("user/integral_logs.jsp");
    }

    /**
     * 跳转分销商管理页
     * @return
     */
    @RequestMapping("/go_integration")
    public ModelAndView go_integration(){
        return new ModelAndView("user/integration.jsp");
    }

    /**
     * 跳转分销商管理页
     * @return
     */
    @RequestMapping("/go_member_grading")
    public ModelAndView go_member_grading(){
        ModelAndView modelAndView = new ModelAndView("user/member_grading.jsp");
        try {
            List<User> userList = userService.getAllUserList();
            if(userList.size() > 0){
                modelAndView.addObject("users",userList);
            }
            //获取用户各角色总人数
            Integer user1 = 0,user2 = 0,user3 = 0,user4 = 0;
            List<UserCountVo> list = userService.getUserCountByGroup();
            for (int i = 0; i < list.size(); i++){
                if (list.get(i).getUserRole() == 1){
                    user1 = list.get(i).getUserCount();
                }
                if (list.get(i).getUserRole() == 2){
                    user2 = list.get(i).getUserCount();
                }
                if (list.get(i).getUserRole() == 3){
                    user3 = list.get(i).getUserCount();
                }
                if (list.get(i).getUserRole() == 4){
                    user4 = list.get(i).getUserCount();
                }
            }
            modelAndView.addObject("user1",user1);
            modelAndView.addObject("user2",user2);
            modelAndView.addObject("user3",user3);
            modelAndView.addObject("user4",user4);
            modelAndView.addObject("userListSize",userList.size());
        } catch (Exception e) {
            logger.error("跳转分销商管理获取用户信息出错",e);
        }
        return modelAndView;
    }

    /**
     * 根据ID获取某一个用户的信息
     * @param id
     * @return
     */
    @RequestMapping("/getUserMSGByUserId")
    @ResponseBody
    public User getUserMSGByUserId(@RequestParam(value = "id", required = true) Integer id){
        try {
            return userService.getUserMSGByUserId(id);
        } catch (Exception e) {
            logger.error("根据ID获取某一个用户的信息出错",e);
        }
        return null;
    }

    /**
     * 根据电话号码获取某一个用户的信息
     * @param userTel
     * @return
     */
    @RequestMapping("/getUserMSGByUserTel")
    @ResponseBody
    public Boolean getUserMSGByUserTel(@RequestParam(value = "userTel", required = true) String userTel){
        try {
            User userMSGByUserTel = userService.getUserMSGByUserTel(userTel);
            if(!Tools.isEmpty(userMSGByUserTel)){
                return true;
            }
        } catch (Exception e) {
            logger.error("根据电话号码获取某一个用户的信息出错",e);
        }
        return false;
    }

    /**
     * 删除用户（逻辑删除）
     * @param id
     * @return
     */
    @RequestMapping("/delete_user")
    @ResponseBody
    public boolean delete_user (@RequestParam(value = "id", required = true) Integer id){
        try {
            User user = new User();
            user.setId(id);
            user.setUserStatus(-1);
            return userService.update_user(user) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("删除用户（逻辑删除）出错",e);
        }
        return false;
    }

    /**
     * 获取某一用户的考核积分来源记录
     * @param id
     * @return
     */
    @RequestMapping("/getIntegralLogByUserId")
    @ResponseBody
    public List<CheckIntegralSourceLog> getIntegralLogByUserId(@RequestParam(value = "id", required = true) Integer id){
        try {
            return checkIntegralSourceLogService.getIntegralLogByUserId(id);
        } catch (Exception e) {
            logger.error("获取某一用户的考核积分来源记录出错",e);
        }
        return null;
    }

    /**
     * 添加用户信息
     * @param userNick
     * @param userTel
     * @param userRole
     * @return
     */
    @RequestMapping("/add_user")
    @ResponseBody
    public boolean add_user(
        @RequestParam(value = "userNick", required = true) String userNick,
        @RequestParam(value = "userTel", required = true) String userTel,
        @RequestParam(value = "userRole", required = true) Integer userRole ){
        try {
            User user = new User();
            user.setUserStatus(1);
            user.setUserAddtime(Tools.date2Str(new Date()));
            user.setUserNick(userNick);
            user.setUserTel(userTel);
            user.setUserPassword(MD5Utils.GetMD5Code(userTel));
            user.setUserRole(userRole);
            int count = userService.add_user(user);
            if (count == 1) {
                //System.out.println(user.getId());
                //生成分享ID  邀请码生成方式：年份+四位随机数+ID
                String userShareid = new SimpleDateFormat("yyyy").format(new Date()) + Tools.getRandomNum4() + user.getId();

                //生成二维码图片
                //1、生成二维码图片名称
                String key = UUIDUtils.get8UUID() + ".jpg";
                //2、生成内部二维码链
                String text = Constant.ERWEIMASHAREURL+userShareid;
                //3、生成二维码
                BufferedImage image = QRCodeUtil.createImage(text, "", true);
                //4、执行上传到七牛云
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                ImageIO.write(image, QRCodeUtil.FORMAT_NAME, out);
                byte[] uploadBytes = out.toByteArray();
                String qrCodeUrl = QiniuUtils.qiniu(uploadBytes,key,Constant.ERWEIMA,Constant.ERWEIMAURL);
                User user1 = new User();
                user1.setUserShareid(userShareid);
                user1.setQrCodeUrl(qrCodeUrl);
                user1.setId(user.getId());
                return userService.update_user(user1) > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("添加用户信息出错",e);
        }
        return false;
    }

    /**
     * 获取分销商
     * @param userShareid
     * @return
     */
    @RequestMapping("/getDownLevelUser")
    @ResponseBody
    public Map<String,List<User>> getDownLevelUser(@RequestParam(value = "userShareid", required = true) String userShareid){
        //新建listMap存放所有分销商
        Map<String,List<User>> listMap = new HashMap<String, List<User>>();
        try {
            //获取一级分销商
            List<User> userList1 = userService.getDownLevelUser(userShareid);
            if (userList1.size() > 0) {
                listMap.put("userList1",userList1);
                for (int i = 0; i < userList1.size(); i++) {
                    //获取二级分销商
                    List<User> userList2 = userService.getDownLevelUser(userList1.get(i).getUserShareid());
                    if(userList2.size() > 0){
                        listMap.put("userList2",userList2);
                    }
                }
            }
            return listMap;
        } catch (Exception e) {
            logger.error("获取分销商出错",e);
        }
        return null;
    }

    /**
     * 获取用户发放的分红
     * @return
     */
    @RequestMapping("/getProfitLog")
    @ResponseBody
    public List<ShareProfitSourceLog> getProfitLog(@RequestParam(value = "id", required = true) Integer id){
        try {
            //获取用户发放的分红
            return shareProfitSourceLogService.getProfitLog(id);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("获取用户发放的分红出错",e);
        }
        return null;
    }
}
