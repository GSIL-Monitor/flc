package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Admin;
import com.hrtxn.flchappinessmall.pojo.Menu;
import com.hrtxn.flchappinessmall.pojo.Role;
import com.hrtxn.flchappinessmall.pojo.pojoVo.RoleVo;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-30 下午 3:38
 * Description:<角色管理持久层>
 */
public interface RoleMapper {

    /**
     * 根据Id获取角色
     *
     * @param id
     * @return
     */
    Role selectByPrimaryKey(Integer id);

    /**
     * 获取全部角色
     *
     * @return
     */
    List<RoleVo> selectRoleAll();

    /**
     * 根据主键删除角色
     *
     * @param id
     */
    void deleteByPrimaryKey(Integer id);

    /**
     * 添加数据 动态sql
     *
     * @param role
     */
    void insertSelective(Role role);

    /**
     * 修改角色 动态sql
     *
     * @param role
     */
    void updateByPrimaryKeySelective(Role role);

    /**
     * 根据角色获取拥有改角色的管理员用户
     * @param roleId
     * @return
     */
    List<Admin> selectAdminListByRoleId(Integer roleId);

    /**
     * 根据角色Id获取拥有的Menu集合
     * @param roleId
     * @return
     */
   List<Menu> selectMunuByRoleId(Integer roleId);
}
