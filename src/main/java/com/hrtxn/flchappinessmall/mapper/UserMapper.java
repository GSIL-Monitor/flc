package com.hrtxn.flchappinessmall.mapper;


import com.hrtxn.flchappinessmall.pojo.User;
import com.hrtxn.flchappinessmall.pojo.pojoVo.UserCountVo;
import com.hrtxn.flchappinessmall.pojo.pojoVo.UserVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author:封润
 * @Date:2018-09-27 11:54
 * @Description:<描述>
 */
public interface UserMapper {

    /**
     * 获取所有用户信息
     * @return
     * @throws Exception
     */
    public List<User> getAllUserList() throws Exception;

    /**
     * 获取所有用户信息 包含推荐店铺信息
     * @return
     * @throws Exception
     */
    public List<UserVo> getAllUserList2() throws Exception;

    /**
     * 根据id修改用户的信息
     * @param user
     * @return
     */
    int update_user(User user) throws Exception;

    /**
     * 根据ID获取某一个用户的信息
     * @param id
     * @return
     */
    User getUserMSGByUserId(@Param("id") Integer id) throws Exception;

    /**
     * 添加用户信息
     * @param user
     * @return
     */
    int add_user(User user) throws Exception;

    /**
     * 获取分销商
     * @param userShareid
     * @return
     */
    List<User> getDownLevelUser(@Param("userShareid") String userShareid) throws Exception;

    /**
     * 获取用户各角色总人数
     * @return
     */
    List<UserCountVo> getUserCountByGroup() throws Exception;

    /**
     * 根据电话号码获取某一个用户的信息
     * @param userTel
     * @return
     */
    User getUserMSGByUserTel(@Param("userTel") String userTel) throws Exception;
}
