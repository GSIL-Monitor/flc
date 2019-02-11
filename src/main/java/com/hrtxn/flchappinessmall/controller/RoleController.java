package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.common.AjaxCommon;
import com.hrtxn.flchappinessmall.common.Res;
import com.hrtxn.flchappinessmall.exception.RoleIsAdminNotNullException;
import com.hrtxn.flchappinessmall.pojo.Role;
import com.hrtxn.flchappinessmall.pojo.pojoVo.RoleVo;
import com.hrtxn.flchappinessmall.service.RoleService;
import com.hrtxn.flchappinessmall.tools.Tools;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Author:封润
 * Date:2018-10-30 下午 3:53
 * Description:<角色服务层>
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;
    private Logger logger = Logger.getLogger(StoreController.class);






    /**
     * 获取全部角色(返回角色列表页面)
     *
     * @param modelAndView
     * @return
     */
    @RequestMapping("/getroleall")
    public ModelAndView getRoleAll(ModelAndView modelAndView) {

        List<RoleVo> roleAllList = roleService.getRoleAll();
        modelAndView.addObject("roleAllList", roleAllList);
        modelAndView.setViewName("/admin/admin_classify.jsp");
        return modelAndView;
    }


    /**
     * 获取全部角色(返回权限管理页面)
     *
     * @param modelAndView
     * @return
     */
    @RequestMapping("/getroleallreturnmenu")
    public ModelAndView getRoleAllReturnMenu(ModelAndView modelAndView) {

        List<RoleVo> roleAllList = roleService.getRoleAll();
        modelAndView.addObject("roleAllList", roleAllList);
        modelAndView.setViewName("/admin/admin_competence.jsp");
        return modelAndView;
    }


    /**
     * 添加角色
     *
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/addrole")
    public Res addRole(Role role) {
        System.err.println("role:"+role);
        Res res = new Res();
        String addTime = Tools.date2Str(new Date());
        role.setAddtime(addTime);//角色添加时间字符串

        try {
            roleService.addRole(role);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("添加角色成功");
        } catch (Exception e) {
            logger.error("功能:[添加角色] * 出现异常类:[RoleController] * 出现异常方法:[addRole]  异常信息 :", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }
        return res;
    }

    /**
     * 根据id获取角色 返回Ajax对象
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/getrolebyid")
    public Res getRoleById(Integer id) {
        Res res = new Res();

        try {
            Role roleById = roleService.getRoleById(id);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("查询角色成功");
            res.setObj(roleById);
        } catch (Exception e) {
            logger.error("功能:[根据id获取角色 返回Ajax对象] * 出现异常类:[RoleController] * 出现异常方法:[getRoleById]  异常信息 :", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }
        return res;
    }

    /**
     * 修改角色
     *
     * @param role
     * @return
     */
    @ResponseBody
    @RequestMapping("/modifyrole")
    public Res modifyRole(Role role) {
        Res res = new Res();

        try {
            roleService.modifyRole(role);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("修改角色信息成功");
        } catch (Exception e) {
            logger.error("功能:[修改角色] * 出现异常类:[RoleController] * 出现异常方法:[modifyRole]  异常信息 :", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }

        return res;
    }

    /**
     * 删除角色
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/removerole")
    public Res removeRole(Integer id) {
        Res res = new Res();
        try {
            roleService.removeRole(id);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("删除角色成功");
        } catch (RoleIsAdminNotNullException e) {
            logger.error("功能:[删除角色] * 出现异常类:[RoleController] * 出现异常方法:[removeRole]  异常信息 :", e);
            res.setCode(AjaxCommon.RES_FALSE);//常量值:5000 代表 系统异常 操作失败
            res.setMsg(e.getMessage());
        } catch (Exception e) {
            logger.error("功能:[删除角色] * 出现异常类:[RoleController] * 出现异常方法:[removeRole]  异常信息 :", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }
        return res;
    }


    /**
     * 对角色添加权限
     *
     * @param menuId
     * @param roleId
     * @param modelAndView
     * @return
     */
    @RequestMapping("/addroleismenu")
    public ModelAndView addRoleIsMenu(String menuId, Integer roleId, ModelAndView modelAndView, HttpServletRequest request) {
        //添加权限
        roleService.addRoleIsMenu(menuId, roleId);

         modelAndView = getRoleAllReturnMenu(modelAndView);
        return modelAndView;
    }
}
