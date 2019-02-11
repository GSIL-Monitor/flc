package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.pojoVo.MenuVo;

import java.util.List;

/**
 * Author:封润
 * Date:2018-11-04 下午 4:35
 * Description:<描述>
 */
public interface MenuService {
    /**
     * 获取全部菜单url 根据等级封装完成
     * @return
     */
    List<MenuVo> getMenuAll();
}
