package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.ProfitHiostory;

/**
 * Description: 分红历史<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface ProfitHiostoryService {

    /**
     * 添加发放分红操作
     * @param profitHiostory
     * @return
     */
    boolean addProfitHiostory(ProfitHiostory profitHiostory);

    /**
     * 获取对应日期的分红总额
     * @param weekRangeOne
     * @param weekRangeLast
     * @return
     */
    String getDaySum(String weekRangeOne, String weekRangeLast);

    /**
     * 获取对应日期发放的周分红总额
     * @param lastMonthOne
     * @param lastMonthLast
     * @return
     */
    String getWeekSum(String lastMonthOne, String lastMonthLast);

    /**
     * 获取对应日期发放的月分红总额
     * @param lastQuarterOne
     * @param lastQuarterLast
     * @return
     */
    String getMonthSum(String lastQuarterOne, String lastQuarterLast);

    /**
     * 获取对应日期发放的季度分红总额
     * @param lastYearOne
     * @param lastYearLast
     * @return
     */
    String getQuarterSum(String lastYearOne, String lastYearLast);

    /**
     * 获取对应日期发放的年分红总额
     * @param lastYearOne
     * @param lastYearLast
     * @return
     */
    String getYearSum(String lastYearOne, String lastYearLast);
}
