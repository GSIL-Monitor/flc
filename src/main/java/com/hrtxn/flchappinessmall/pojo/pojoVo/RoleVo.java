package com.hrtxn.flchappinessmall.pojo.pojoVo;

import com.hrtxn.flchappinessmall.pojo.Menu;
import lombok.Data;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-31 下午 3:53
 * Description:<描述>
 */
@Data
public class RoleVo {
    private Integer id;

    private String name;

    private String tips;

    private String addtime;

    /**
     * 角色拥有用户数量
     */
    private Integer adminSum;

    /**
     * 角色拥有的用户的用户名以"," 分隔的字符串
     */
    private String adminNameS;

    /**
     * 角色拥有的菜单
     */
    private List<Menu> menuList;

}
