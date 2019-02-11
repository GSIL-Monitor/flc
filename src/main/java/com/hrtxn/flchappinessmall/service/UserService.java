package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.User;
import com.hrtxn.flchappinessmall.pojo.pojoVo.UserCountVo;
import com.hrtxn.flchappinessmall.pojo.pojoVo.UserVo;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface UserService {

    /**
     * 获取所有用户信息
     * @return
     * @throws Exception
     */
    public List<User> getAllUserList() throws Exception;

    /**
     * 获取所有用户信息 包含用户推荐的 店铺的信息
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
    User getUserMSGByUserId(Integer id) throws Exception;

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
    List<User> getDownLevelUser(String userShareid) throws Exception;

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
    User getUserMSGByUserTel(String userTel) throws Exception;
}
