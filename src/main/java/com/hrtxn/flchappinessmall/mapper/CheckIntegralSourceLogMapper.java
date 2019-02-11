package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.CheckIntegralSourceLog;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Repository
public interface CheckIntegralSourceLogMapper {


    /**
     * 获取某一用户的考核积分来源记录
     * @param id
     * @return
     */
    List<CheckIntegralSourceLog> getIntegralLogByUserId(Integer id) throws Exception;

    /**
     * 添加充值积分记录
     * @param checkIntegralSourceLog
     * @return
     */
    int addCheckIntegralSourceLog(CheckIntegralSourceLog checkIntegralSourceLog) throws Exception;

    /**
     * 获取所有考核积分来源记录
     * @return
     */
    List<CheckIntegralSourceLog> getAllIntegralLOgs() throws Exception;
}
