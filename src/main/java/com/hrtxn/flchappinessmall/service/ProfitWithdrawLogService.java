package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.ProfitWithdrawLog;
import com.hrtxn.flchappinessmall.pojo.ShareProfitWithdrawLog;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface ProfitWithdrawLogService {

    /**
     * 同意分红提现
     * @param profitWithdrawLog
     * @return
     */
    int update_ProfitWithdrawLog(ProfitWithdrawLog profitWithdrawLog) throws Exception;

    /**
     * 获取用户分红提现记录
     * @return
     */
    List<ShareProfitWithdrawLog> getUserProfitWithdrawLogs() throws Exception;

    /**
     * 获取商铺分红提现记录
     * @return
     */
    List<ShareProfitWithdrawLog> getStoreProfitWithdrawLogs() throws Exception;

    /**
     * 获取同意以及驳回的分红提现记录
     * @return
     */
    List<ProfitWithdrawLog> getProfitWithdrawLogs() throws Exception;

    /**
     * 获取用户分红提现记录
     * @return
     */
    List<ProfitWithdrawLog> getUserProfitedWithdrawLogs() throws Exception;

    /**
     * 获取店铺分红提现记录
     * @return
     */
    List<ProfitWithdrawLog> getStoreProfitedWithdrawLogs() throws Exception;
}
