package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.FinancialMapper;
import com.hrtxn.flchappinessmall.pojo.User;
import com.hrtxn.flchappinessmall.service.FinancialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class FinancialServiceImpl implements FinancialService {

    @Autowired
    private FinancialMapper financialMapper;

    /**
     * 获取符合符合日分红发放的用户
     * @param flag
     * @param personalIntegral
     * @return
     */
    @Override
    public List<User> getUserDayProfit(int flag, Integer personalIntegral) {
        return financialMapper.getUserDayProfit(flag,personalIntegral);
    }
}
