package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Admin;
import com.hrtxn.flchappinessmall.pojo.pojoVo.AdminVo;
import com.hrtxn.flchappinessmall.pojo.pojoVo.RoleVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:42
 */
@Repository
public interface AdminMapper {

    /**
     * 根据用户名查询用户 返回的用户包含menu菜单对象
     * @param adminNickName
     * @return
     */
    AdminVo selectAdminByNickName(String adminNickName);

    /**
     * 查询所有管理员
     * @return
     */
    List<AdminVo> selectAdminAll();

    /**
     * 删除管理员
     * @param id
     */
    void delectAdminById(Integer id);

    /**
     * 根据角色Id获取用户集合
     * @param roleId
     * @return
     */
    List<Admin> selectAdminByRoleId(Integer roleId);

    /**
     * 查询每个管理员拥有用户数量
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
    AdminVo selectAdminById(Integer id);
    //=======================================================
    //=====================分割线=============================
    //=======================================================






    /**
     * 执行登录操作
     *
     * @param admin
     * @return
     * @throws Exception
     */
    Admin admin_login(Admin admin) throws Exception;

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
    Admin getAdminMSGById(@Param("id") Integer id) throws Exception;
}
