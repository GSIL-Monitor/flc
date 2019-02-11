package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.common.AjaxCommon;
import com.hrtxn.flchappinessmall.common.Res;
import com.hrtxn.flchappinessmall.mapper.MuenMapper;
import com.hrtxn.flchappinessmall.pojo.Menu;
import com.hrtxn.flchappinessmall.pojo.pojoVo.MenuVo;
import com.hrtxn.flchappinessmall.service.MenuService;
import com.hrtxn.flchappinessmall.service.RoleService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Author:封润
 * Date:2018-11-02 下午 3:26
 * Description:<描述>
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MuenMapper muenMapper;
    @Autowired
    private MenuService menuService;
    @Autowired
    private RoleService roleService;//角色
    private Logger logger = Logger.getLogger(StoreController.class);

    /**
     * 获取菜单全部url 并且封装完成返回至页面 (同时返回的数据还有这个角色已经拥有的权限)
     *
     * @param modelAndView
     * @return
     */
    @RequestMapping("/getmenuall")
    public ModelAndView getMenuAll(ModelAndView modelAndView, Integer roleId, String roleName) {
        //获取该角色拥有的 menu菜单
System.err.println("角色id:"+roleId);

        if(1==roleId){
            modelAndView.addObject("msg","很抱歉,你正在私自操作的的动作很危险,不允许操作!");
            modelAndView.setViewName("login.jsp");
            return modelAndView;
        }

        List<MenuVo> menuVoList = menuService.getMenuAll();
        modelAndView.setViewName("/admin/competence.jsp");
        modelAndView.addObject("menuVoList", menuVoList);
        modelAndView.addObject("roleId", roleId);
        modelAndView.addObject("roleName", roleName);

/*
        for(MenuVo menuVo:menuVoList){
            System.err.println("一级菜单名:"+menuVo.getName());
            for (MenuVo menuVo1:menuVo.getMenuVoList()){
                System.err.println("二级菜单:"+menuVo1.getName());
                for (MenuVo menuVo2:menuVo1.getMenuVoList()){
                    System.err.println("三级菜单名:"+menuVo2.getName());
                }

            }
            System.out.println("========================================");
        }*/




    /*    for (MenuVo menuVo : menuVoList) {
            System.err.println("0级名:" + menuVo.getName());

            for (MenuVo menuVo1 : menuVo.getMenuVoList()) {
                System.err.println("1级名:" + menuVo1.getName());

                for (MenuVo menuVo2 : menuVo1.getMenuVoList()) {
                    System.err.println("2级名:" + menuVo2.getName());
                }
            }
        }*/
        return modelAndView;
    }


    /**
     * 获取属于当前角色的menu菜单
     * @param roleId
     * @return
     */
    @ResponseBody
    @RequestMapping("/getmenubyroleid")
    public Res getMenuByRoleId(Integer roleId){
        Res res = new Res();

        try {
            List<Menu> roleMenuList = roleService.getMunuByRoleId(roleId);
            res.setObj(roleMenuList);
            res.setCode(AjaxCommon.RES_TRUE);//2000 代表操作成功
            res.setMsg("已为您展示当前角色拥有的权限");
        } catch (Exception e) {
            res.setCode(AjaxCommon.RES_ERROR);//5000 代表系统异常
            res.setMsg("系统异常,请稍后重试");
            logger.error("功能:[获取属于当前角色的menu菜单] * 出现异常类:[MenuController] * 出现异常方法:[getMenuByRoleId]  异常信息 :", e);

        }
        return res;

    }


//============================================================================
//============================以下为开发过程使用代码============================
//============================================================================


    /**
     * 获取零级菜单
     */
    @RequestMapping("/gozeromenu")
    public ModelAndView gozeromenu(ModelAndView modelAndView) {
        List<Menu> menuList = muenMapper.selectMenuZero();
        modelAndView.addObject("pid", 169);
        modelAndView.addObject("menuList", menuList);
        modelAndView.setViewName("/admin/zero.jsp");
        return modelAndView;
    }

    /**
     * 添加零级菜单
     */
    @RequestMapping("/addzeromenu")
    public ModelAndView addzeromenu(ModelAndView modelAndView, Menu menu) {
        muenMapper.insertSelective(menu);

        modelAndView = gozeromenu(modelAndView);
        return modelAndView;
    }


    /**
     * 根据0级id 获取一级url
     *
     * @param modelAndView
     * @param pid
     * @return
     */
    @RequestMapping("/goaddmenuone")
    public ModelAndView goAddMenuOne(ModelAndView modelAndView, Integer pid) {
        //获取一级url
        List<Menu> menuList = muenMapper.selectMenuOne(pid);
        modelAndView.addObject("pid", pid);
        modelAndView.addObject("menuList", menuList);
        modelAndView.setViewName("/admin/one.jsp");
        return modelAndView;
    }

    /**
     * 添加一级菜单
     */
    @RequestMapping("/addMenu")
    public ModelAndView addMenu(ModelAndView modelAndView, Menu menu) {
        muenMapper.insertSelective(menu);

        modelAndView = goAddMenuOne(modelAndView, menu.getPid());//获取一级url

        return modelAndView;
    }

    /**
     * 根据一级Url获取二级url
     *
     * @param modelAndView
     * @param
     * @return
     */
    @RequestMapping("/goaddmenutwo")
    public ModelAndView goAddMenuTwo(ModelAndView modelAndView, Integer oneId) {
        List<Menu> menuTwoList = muenMapper.getMenuTwo(oneId);
        modelAndView.addObject("menuTwoList", menuTwoList);
        modelAndView.addObject("pid", oneId);
        modelAndView.setViewName("/admin/two.jsp");
        return modelAndView;
    }

    /**
     * 添加二级菜单
     */
    @RequestMapping("/addmenutwo")
    public ModelAndView addMenuTwo(ModelAndView modelAndView, Menu menu) {

        muenMapper.insertSelective(menu);

        modelAndView = goAddMenuTwo(modelAndView, menu.getPid());
        return modelAndView;
    }


    /**
     * 根据二级Url获取三级url
     *
     * @param modelAndView
     * @param twoId
     * @return
     */
    @RequestMapping("/goaddmenuthree")
    public ModelAndView goAddMenuThree(ModelAndView modelAndView, Integer twoId) {

        List<Menu> menuThreeList = muenMapper.getMenuThree(twoId);
        modelAndView.addObject("menuThreeList", menuThreeList);
        modelAndView.addObject("pid", twoId);
        modelAndView.setViewName("/admin/zero.jsp");
        return modelAndView;
    }


}
