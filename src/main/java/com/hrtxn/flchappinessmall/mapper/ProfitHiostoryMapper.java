package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.ProfitHiostory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Repository
public interface ProfitHiostoryMapper {

    /**
     * 添加发放分红操作
     * @param profitHiostory
     * @return
     */
    int addProfitHiostory(ProfitHiostory profitHiostory);

    /**
     * 获取对应日期的分红总额
     * @param weekRangeOne
     * @param weekRangeLast
     * @return
     */
    String getDaySum(@Param("weekRangeOne") String weekRangeOne, @Param("weekRangeLast") String weekRangeLast);

    /**
     * 获取对应日期发放的周分红总额
     * @param lastMonthOne
     * @param lastMonthLast
     * @return
     */
    String getWeekSum(@Param("lastMonthOne") String lastMonthOne, @Param("lastMonthLast") String lastMonthLast);

    /**
     * 获取对应日期发放的月分红总额
     * @param lastQuarterOne
     * @param lastQuarterLast
     * @return
     */
    String getMonthSum(@Param("lastQuarterOne") String lastQuarterOne, @Param("lastQuarterLast") String lastQuarterLast);

    /**
     * 获取对应日期发放的季度分红总额
     * @param lastYearOne
     * @param lastYearLast
     * @return
     */
    String getQuarterSum(@Param("lastYearOne") String lastYearOne, @Param("lastYearLast") String lastYearLast);

    /**
     * 获取对应日期发放的年分红总额
     * @param lastYearOne
     * @param lastYearLast
     * @return
     */
    String getYearSum(@Param("lastYearOne") String lastYearOne, @Param("lastYearLast") String lastYearLast);
}
