package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.User;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface FinancialService {

    /**
     * 获取符合符合日分红发放的用户
     * @param flag
     * @param personalIntegral
     * @return
     */
    List<User> getUserDayProfit(int flag, Integer personalIntegral);
}
