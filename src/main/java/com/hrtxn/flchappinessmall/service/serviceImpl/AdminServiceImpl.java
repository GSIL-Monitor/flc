package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.common.AdminCommon;
import com.hrtxn.flchappinessmall.exception.AdminNotDelect;
import com.hrtxn.flchappinessmall.mapper.AdminMapper;
import com.hrtxn.flchappinessmall.pojo.Admin;
import com.hrtxn.flchappinessmall.pojo.pojoVo.AdminVo;
import com.hrtxn.flchappinessmall.pojo.pojoVo.RoleVo;
import com.hrtxn.flchappinessmall.service.AdminService;
import com.hrtxn.flchappinessmall.tools.MD5Utils;
import com.hrtxn.flchappinessmall.tools.Tools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service

public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;


    /**
     * 根据用户名查询用户 返回的用户包含menu菜单对象
     * @param adminNickName
     * @return
     */
    @Override
    public AdminVo getAdminByNickName(String adminNickName) {

        AdminVo adminVo = adminMapper.selectAdminByNickName(adminNickName);
        return adminVo;
    }

    /**
     * 获取所有管理员
     *
     * @return
     */
    @Override
    public List<AdminVo> getAdminAll() {
        List<AdminVo> adminList = adminMapper.selectAdminAll();
        return adminList;
    }


    /**
     * 删除用户
     *
     * @param id
     */
    @Override
    public void removeAdmin(Integer id) throws AdminNotDelect {
        if (id != null && id == AdminCommon.ADMINID) {
            throw new AdminNotDelect("系统超级管理员无法被删除!!");
        }
        adminMapper.delectAdminById(id);
    }

    /**
     * 查询每个管理员拥有用户数量
     *
     * @return
     */
    @Override
    public List<RoleVo> selectRoleSum() {
        List<RoleVo> roleVos = adminMapper.selectRoleSum();
        return roleVos;
    }

    /**
     * 添加管理员
     *
     * @param admin
     */
    @Override
    public void addAdmin(Admin admin) {
        String addTime = Tools.date2Str(new Date());
        admin.setAdminAddtime(addTime);
        String MD5password = MD5Utils.GetMD5Code(admin.getAdminPassword());
        admin.setAdminPassword(MD5password);
        admin.setAdminLastLoginTime("");
        adminMapper.addAdmin(admin);
    }

    /**
     * 根据管理员id获取 管理员信息
     * @param id
     * @return
     */
    @Override
    public AdminVo getRole(Integer id) {

        AdminVo  adminVo= adminMapper.selectAdminById(id);
        return adminVo;
    }


    //=============================================================
    //==========================分割线================================
    //=============================================================

    /**
     * 执行登录操作
     *
     * @param admin
     * @return
     * @throws Exception
     */
    public Admin admin_login(Admin admin) throws Exception {
        return adminMapper.admin_login(admin);
    }

    /**
     * 修改管理员
     *
     * @param admin
     * @return
     */
    @Override
    public int updateAdmin(Admin admin) throws Exception {
        return adminMapper.updateAdmin(admin);
    }

    /**
     * 根据ID获取管理员信息
     *
     * @param id
     * @return
     */
    @Override
    public Admin getAdminMSGById(Integer id) throws Exception {
        return adminMapper.getAdminMSGById(id);
    }
}
