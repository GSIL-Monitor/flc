package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.exception.RoleIsAdminNotNullException;
import com.hrtxn.flchappinessmall.mapper.AdminMapper;
import com.hrtxn.flchappinessmall.mapper.RelationMapper;
import com.hrtxn.flchappinessmall.mapper.RoleMapper;
import com.hrtxn.flchappinessmall.pojo.Admin;
import com.hrtxn.flchappinessmall.pojo.Menu;
import com.hrtxn.flchappinessmall.pojo.Relation;
import com.hrtxn.flchappinessmall.pojo.Role;
import com.hrtxn.flchappinessmall.pojo.pojoVo.RoleVo;
import com.hrtxn.flchappinessmall.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Author:封润
 * Date:2018-10-30 下午 3:48
 * Description:<角色逻辑层>
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)//事物默认隔离级别,回滚:任何异常都会回滚
public class RoleServiceImpl implements RoleService {


    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private AdminMapper adminMapper;//管理员

    @Autowired
    private RelationMapper relationMapper;//权限组

    /**
     * 获取全部角色
     *
     * @return
     */
    @Override
    public List<RoleVo> getRoleAll() {
        List<RoleVo> roles = roleMapper.selectRoleAll();
        return roles;
    }

    /**
     * 添加角色
     *
     * @param role
     */
    @Override
    public void addRole(Role role) {
        System.out.println("------------------------------------");
        roleMapper.insertSelective(role);
    }


    /**
     * 根据id获取角色
     *
     * @param id
     * @return
     */
    @Override
    public Role getRoleById(Integer id) {
        Role role = roleMapper.selectByPrimaryKey(id);
        return role;

    }

    /**
     * 修改角色
     *
     * @param role
     */
    @Override
    public void modifyRole(Role role) {
        roleMapper.updateByPrimaryKeySelective(role);
    }

    /**
     * 根据Id 删除角色
     *
     * @param id
     */
    @Override
    public void removeRole(Integer id) throws RoleIsAdminNotNullException {

        //删除前先判断是否还有管理员在使用当前角色

        List<Admin> adminList = adminMapper.selectAdminByRoleId(id);

        if (adminList.size() > 0) {
            throw new RoleIsAdminNotNullException("很抱歉,还有管理员在使用当前角色,无法删除!");
        }

        roleMapper.deleteByPrimaryKey(id);
    }

    /**
     * 对角色添加权限
     *
     * @param menuId
     * @param roleId
     * @param
     */
    @Override
    public void addRoleIsMenu(String menuId, Integer roleId) {
        //对角色添加权限前 先清空其所有权限
        relationMapper.delectRelationByRoleId(roleId);

        //对menuId进行分割处理成集合
        String[] menuArray = menuId.split(",");
        List<Relation> menuList = new ArrayList<Relation>();
        //处理权限组
        for (String menuS : menuArray) {
            Relation relation = new Relation();
            relation.setRoleid(roleId);
            relation.setMenuid(Long.valueOf(menuS));
            menuList.add(relation);
        }
        //对角色添加权限
        relationMapper.addRelation(menuList);
    }

    /**
     *根据角色Id获取拥有的Menu集合
     * @param roleId
     * @return
     */
    @Override
    public List<Menu> getMunuByRoleId(Integer roleId) {
        List<Menu> menuList = roleMapper.selectMunuByRoleId(roleId);
        return menuList;
    }
}
