package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.UserMapper;
import com.hrtxn.flchappinessmall.pojo.User;
import com.hrtxn.flchappinessmall.pojo.pojoVo.UserCountVo;
import com.hrtxn.flchappinessmall.pojo.pojoVo.UserVo;
import com.hrtxn.flchappinessmall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:封润
 * @Date:2018-09-27 14:06
 * @Description:<描述>
 */
@Service
public class UserviceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 获取所有用户信息
     * @return
     * @throws Exception
     */
    public List<User> getAllUserList() throws Exception {
        return userMapper.getAllUserList();
    }
    /**
     * 获取所有用户信息
     * @return
     * @throws Exception
     */
    public List<UserVo> getAllUserList2() throws Exception {
        return userMapper.getAllUserList2();
    }

    /**
     * 根据id修改用户的信息
     * @param user
     * @return
     */
    public int update_user(User user) throws Exception {
        return userMapper.update_user(user);
    }

    /**
     * 根据ID获取某一个用户的信息
     * @param id
     * @return
     */
    public User getUserMSGByUserId(Integer id) throws Exception {
        return userMapper.getUserMSGByUserId(id);
    }

    /**
     * 添加用户信息
     * @param user
     * @return
     */
    public int add_user(User user) throws Exception {
        return userMapper.add_user(user);
    }

    /**
     * 获取分销商
     * @param userShareid
     * @return
     */
    public List<User> getDownLevelUser(String userShareid) throws Exception {
        return userMapper.getDownLevelUser(userShareid);
    }

    /**
     * 获取用户各角色总人数
     * @return
     */
    @Override
    public List<UserCountVo> getUserCountByGroup() throws Exception {
        return userMapper.getUserCountByGroup();
    }

    /**
     * 根据电话号码获取某一个用户的信息
     * @param userTel
     * @return
     */
    @Override
    public User getUserMSGByUserTel(String userTel) throws Exception {
        return userMapper.getUserMSGByUserTel(userTel);
    }
}
