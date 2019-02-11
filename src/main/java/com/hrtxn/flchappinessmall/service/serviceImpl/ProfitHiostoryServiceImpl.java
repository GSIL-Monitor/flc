package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.ProfitHiostoryMapper;
import com.hrtxn.flchappinessmall.pojo.ProfitHiostory;
import com.hrtxn.flchappinessmall.service.ProfitHiostoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class ProfitHiostoryServiceImpl implements ProfitHiostoryService {

    @Autowired
    private ProfitHiostoryMapper profitHiostoryMapper;

    /**
     * 添加发放分红操作
     * @param profitHiostory
     * @return
     */
    @Override
    public boolean addProfitHiostory(ProfitHiostory profitHiostory) {
        return profitHiostoryMapper.addProfitHiostory(profitHiostory) > 0 ? true : false;
    }

    /**
     * 获取对应日期的分红总额
     * @param weekRangeOne
     * @param weekRangeLast
     * @return
     */
    @Override
    public String getDaySum(String weekRangeOne, String weekRangeLast) {
        return profitHiostoryMapper.getDaySum(weekRangeOne,weekRangeLast);
    }

    /**
     * 获取对应日期发放的周分红总额
     * @param lastMonthOne
     * @param lastMonthLast
     * @return
     */
    @Override
    public String getWeekSum(String lastMonthOne, String lastMonthLast) {
        return profitHiostoryMapper.getWeekSum(lastMonthOne,lastMonthLast);
    }

    /**
     * 获取对应日期发放的月分红总额
     * @param lastQuarterOne
     * @param lastQuarterLast
     * @return
     */
    @Override
    public String getMonthSum(String lastQuarterOne, String lastQuarterLast) {
        return profitHiostoryMapper.getMonthSum(lastQuarterOne,lastQuarterLast);
    }

    /**
     * 获取对应日期发放的季度分红总额
     * @param lastYearOne
     * @param lastYearLast
     * @return
     */
    @Override
    public String getQuarterSum(String lastYearOne, String lastYearLast) {
        return profitHiostoryMapper.getQuarterSum(lastYearOne,lastYearLast);
    }

    /**
     * 获取对应日期发放的年分红总额
     * @param lastYearOne
     * @param lastYearLast
     * @return
     */
    @Override
    public String getYearSum(String lastYearOne, String lastYearLast) {
        return profitHiostoryMapper.getYearSum(lastYearOne,lastYearLast);
    }
}
