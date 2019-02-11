package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Repository
public interface FinancialMapper {

    /**
     * 获取符合符合日分红发放的用户
     * @param flag
     * @param personalIntegral
     * @return
     */
    List<User> getUserDayProfit(@Param("flag") int flag, @Param("personalIntegral") Integer personalIntegral);
}
