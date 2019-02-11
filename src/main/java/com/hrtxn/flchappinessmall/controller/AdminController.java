package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.common.AjaxCommon;
import com.hrtxn.flchappinessmall.common.Res;
import com.hrtxn.flchappinessmall.exception.AdminNotDelect;
import com.hrtxn.flchappinessmall.pojo.Admin;
import com.hrtxn.flchappinessmall.pojo.pojoVo.AdminVo;
import com.hrtxn.flchappinessmall.pojo.pojoVo.RoleVo;
import com.hrtxn.flchappinessmall.service.AdminService;
import com.hrtxn.flchappinessmall.service.RoleService;
import com.hrtxn.flchappinessmall.tools.MD5Utils;
import com.hrtxn.flchappinessmall.tools.Tools;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Description: 管理员控制类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private RoleService roleService;//角色

    private Logger logger = Logger.getLogger(AdminController.class);


    /**
     * 获取管理员列表
     *
     * @return
     */
    @RequestMapping("/getadminall")
    public ModelAndView getAdminAll(ModelAndView modelAndView) {
        //获取所有管理员集合
        List<AdminVo> adminVoList = adminService.getAdminAll();
        //查询每个管理员拥有用户数量
        List<RoleVo> roleVoListSum = adminService.selectRoleSum();
        //获取到所有角色 添加管理员需要用到这些角色
        List<RoleVo> roleList = roleService.getRoleAll();

        modelAndView.addObject("adminVoList", adminVoList);//所有管理员集合
        modelAndView.addObject("roleVoList", roleVoListSum);//每个管理员拥有用户数量
        modelAndView.addObject("roleList", roleList);
        modelAndView.addObject("adminLength", adminVoList.size());//用户数量
        modelAndView.setViewName("admin/administrator.jsp");
        return modelAndView;
    }

    /**
     * 删除管理员
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/removeadmin")
    public Res removeAdmin(Integer id) {
        Res res = new Res();
        try {
            adminService.removeAdmin(id);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("删除管理员成功");
        } catch (AdminNotDelect e) {
            logger.error("功能:[删除管理员] * 出现异常类:[AdminController] * 出现异常方法:[removeAdmin]  异常信息 :", e);
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 代表操作失败
            res.setMsg(e.getMessage());
        } catch (Exception e) {
            logger.error("功能:[删除管理员] * 出现异常类:[AdminController] * 出现异常方法:[removeAdmin]  异常信息 :", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }
        return res;
    }


    /**
     * 添加管理员/修改管理员
     *
     * @param modelAndView
     * @param
     * @return
     */
    @RequestMapping("/addadmin")
    public ModelAndView addAdmin(ModelAndView modelAndView, Admin admin, String modify) {

        //判断是添加操作还是修改操作
        try {
            if (modify.equals("modify")) {
                adminService.updateAdmin(admin);//修改
            } else {
                adminService.addAdmin(admin);//添加
            }
        } catch (Exception e) {
            logger.error("功能:[添加管理员/修改管理员] * 出现异常类:[AdminController] * 出现异常方法:[addAdmin]  异常信息 :", e);
        }
        //获取管理员列表
        getAdminAll(modelAndView);
        return modelAndView;
    }


    /**
     * 根据管理员id获取管理员信息
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/getadminbyid")
    public Res getAdminById(Integer id) {
        Res res = new Res();
        System.out.println("++++++++++++++++++++");
        try {
            AdminVo adminVo = adminService.getRole(id);
            res.setMsg("获取管理员成功");
            res.setCode(AjaxCommon.RES_TRUE);
            res.setObj(adminVo);
        } catch (Exception e) {
            res.setMsg("获取管理员失败");
            res.setCode(AjaxCommon.RES_FALSE);
            logger.error("功能:[根据管理员id获取管理员信息] * 出现异常类:[AdminController] * 出现异常方法:[getAdminById]  异常信息 :", e);
        }
        return res;
    }


    /**
     * 权限管理
     *
     * @return
     */
    @RequestMapping("/go_admin_competence")
    public ModelAndView go_admin_competence(ModelAndView modelAndView) {
        modelAndView.setViewName("/admin/admin_competence.jsp");
        return modelAndView;
    }

    //====================================================
    //======================分割线     用Ajax展示要修改角色的页面=========================
    //====================================================


    /**
     * 跳转登录页
     *
     * @return
     */
    @RequestMapping("/admin_index")
    public ModelAndView admin_index() {
        return new ModelAndView("login.jsp");
    }

    /**
     * 执行登录操作
     *
     * @param adminNickName
     * @param adminPassword
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/admin_login")
    public boolean admin_login(String adminNickName, String adminPassword, String adminLoginIP, HttpServletRequest request) {


        Admin admin1 = new Admin();
        admin1.setAdminNickName(adminNickName);
        admin1.setAdminPassword(MD5Utils.GetMD5Code(adminPassword));
        Admin admin = null;

        try {
            admin = adminService.admin_login(admin1);
            if (null == admin) {
                return false;
            }
            //像数据库添加用户登录信息
            admin.setAdminLastLoginTime(new SimpleDateFormat("yyyy年MM月dd日HH时mm分").format(new Date()));
            admin.setAdminLoginIP(adminLoginIP);
            //执行添加操作
            Integer count = adminService.updateAdmin(admin);

            //根据用户名查用户  返回对象已经封装进了该对象所拥有的菜单menu
            AdminVo adminVo = adminService.getAdminByNickName(adminNickName);

            //添加用户操作执行成功的情况下向session保存用户信息
            if (1 == count) {
                request.getSession().setAttribute("admin", admin);
                request.getSession().setAttribute("adminVo", adminVo);

                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 退出
     *
     * @param request
     * @return
     */
    @RequestMapping("/login_out")
    public ModelAndView login_out(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/admin_index");
        request.getSession().removeAttribute("admin");
        request.getSession().removeAttribute("adminVo");
        return modelAndView;
    }


    /**
     * 跳转管理员管理--》分类管理
     *
     * @return
     */
    @RequestMapping("/go_admin_classify")
    public ModelAndView go_admin_classify() {
        ModelAndView modelAndView = new ModelAndView("admin/admin_classify.jsp");
        return modelAndView;
    }

    /**
     * 跳转管理员管理--》个人信息
     *
     * @return
     */
    @RequestMapping("/go_admin_info")
    public ModelAndView go_admin_info(HttpServletRequest request) {
        try {
            ModelAndView modelAndView = new ModelAndView("admin/admin_info.jsp");
            //根据ID获取管理员信息
            Admin admin = adminService.getAdminMSGById(((Admin) request.getSession().getAttribute("admin")).getId());
            modelAndView.addObject("admin", admin);
            return modelAndView;
        } catch (Exception e) {
            logger.error("跳转管理员管理--》个人信息出错", e);
        }
        return null;
    }

    /**
     * 修改管理员信息
     *
     * @param adminTel
     * @param adminTrueName
     * @param id
     * @return
     */
    @RequestMapping("/update_admin")
    @ResponseBody
    public boolean update_admin(
            @RequestParam("adminTel") String adminTel,
            @RequestParam("adminTrueName") String adminTrueName,
            @RequestParam("id") Integer id) {
        try {
            Admin admin = new Admin();
            admin.setAdminTel(adminTel);
            admin.setAdminTrueName(adminTrueName);
            admin.setId(id);
            return adminService.updateAdmin(admin) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("", e);
        }
        return false;
    }

    /**
     * 判断旧密码与输入的是否一致
     *
     * @param password
     * @param id
     * @return
     */
    @RequestMapping("/checkOldPassword")
    @ResponseBody
    public boolean checkOldPassword(
            @RequestParam("password") String password,
            @RequestParam("id") Integer id) {
        try {
            Admin admin = adminService.getAdminMSGById(id);
            if (!Tools.isEmpty(admin)) {
                //判断旧密码是否一致
                if (MD5Utils.GetMD5Code(password).equals(admin.getAdminPassword())) {
                    return true;
                }
            }
        } catch (Exception e) {
            logger.error("判断旧密码与输入的是否一致出错", e);
        }
        return false;
    }

    /**
     * 修改管理员密码
     *
     * @param password
     * @param id
     * @return
     */
    @RequestMapping("/update_adminPassword")
    @ResponseBody
    public boolean update_adminPassword(
            @RequestParam("password") String password,
            @RequestParam("id") Integer id) {
        try {
            Admin admin = new Admin();
            admin.setAdminPassword(MD5Utils.GetMD5Code(password));
            admin.setId(id);
            return adminService.updateAdmin(admin) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("修改管理员密码出错", e);
        }
        return false;
    }


}
