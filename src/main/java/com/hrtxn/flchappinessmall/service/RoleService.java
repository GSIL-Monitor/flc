package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.exception.RoleIsAdminNotNullException;
import com.hrtxn.flchappinessmall.pojo.Menu;
import com.hrtxn.flchappinessmall.pojo.Role;
import com.hrtxn.flchappinessmall.pojo.pojoVo.RoleVo;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-30 下午 3:48
 * Description:<角色逻辑层>
 */
public interface RoleService {
    /**
     * 获取全部角色
     *
     * @return
     */
    List<RoleVo> getRoleAll();

    /**
     * 添加角色
     *
     * @param role
     */
    void addRole(Role role);

    /**
     * 根据id获取角色
     *
     * @param id
     * @return
     */
    Role getRoleById(Integer id);

    /**
     * 修改角色
     *
     * @param role
     */
    void modifyRole(Role role);

    /**
     * 删除角色
     *
     * @param id
     */
    void removeRole(Integer id) throws RoleIsAdminNotNullException;

    /**
     * 对角色添加权限
     *
     * @param menuId
     * @param roleId
     * @param
     */
    void addRoleIsMenu(String menuId, Integer roleId);

    /**
     * 根据角色Id获取拥有的Menu集合
     * @param roleId
     * @return
     */
    List<Menu> getMunuByRoleId(Integer roleId);

}
