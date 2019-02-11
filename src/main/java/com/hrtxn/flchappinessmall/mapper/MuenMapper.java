package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Menu;
import com.hrtxn.flchappinessmall.pojo.pojoVo.MenuVo;

import java.util.List;

/**
 * Author:封润
 * Date:2018-11-02 下午 3:30
 * Description:<描述>
 */
public interface MuenMapper {


    /**
     * 获取全部菜单url 根据等级封装完成
     * @return
     */
    List<MenuVo> selectMenuAll();






    /**
     * 查询出零级分类
     */
    List<Menu> selectMenuZero();
    /**
     * 查询出一级分类
     */
    List<Menu> selectMenuOne(Integer pid);

    /**
     * 根据一级id查询二级
     *
     * @return
     */
    List<Menu> getMenuTwo(Integer id);

    /**
     * 根据二级Id查询三级
     *
     * @return
     */
    List<Menu> getMenuThree(Integer id);


    //添加菜单
    void insertSelective(Menu menu);
}
