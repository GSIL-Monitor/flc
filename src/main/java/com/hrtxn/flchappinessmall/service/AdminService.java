package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.exception.AdminNotDelect;
import com.hrtxn.flchappinessmall.pojo.Admin;
import com.hrtxn.flchappinessmall.pojo.pojoVo.AdminVo;
import com.hrtxn.flchappinessmall.pojo.pojoVo.RoleVo;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface AdminService {

    /**
     * 根据用户名查询用户 返回的用户包含menu菜单对象
     * @param adminNickName
     * @return
     */
    AdminVo getAdminByNickName(String adminNickName);

    /**
     * 获取所有管理员
     *
     * @return
     */
    List<AdminVo> getAdminAll();

    /**
     * 删除用户
     *
     * @param id
     */
    void removeAdmin(Integer id) throws AdminNotDelect;


    /**
     * 查询每个管理员拥有用户数量
     *
     * @return
     */
    List<RoleVo> selectRoleSum();

    /**
     * 添加管理员
     * @param admin
     */
    void addAdmin(Admin admin);

    /**
     * 根据管理员id获取 管理员信息
     * @param id
     * @return
     */
    AdminVo getRole(Integer id);

    //====================================================
    //======================分割线=========================
    //====================================================


    /**
     * 执行登录操作
     *
     * @param admin
     * @return
     * @throws Exception
     */
    public Admin admin_login(Admin admin) throws Exception;

    /**
     * 修改管理员
     *
     * @param admin
     * @return
     */
    int updateAdmin(Admin admin) throws Exception;

    /**
     * 根据ID获取管理员信息
     *
     * @param id
     * @return
     */
    Admin getAdminMSGById(Integer id) throws Exception;
}
