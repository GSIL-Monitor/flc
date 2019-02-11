package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.ShareProfitWithdrawLog;

import java.util.List;

/**
 * Description: 分润提现业务类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface ShareProfitWithdrawLogService {

    /**
     * 获取分润提现记录
     * @return
     */
    List<ShareProfitWithdrawLog> getProfitWithdrawal() throws Exception;

    /**
     * 驳回分润提现申请
     * @param shareProfitWithdrawLog
     * @return
     */
    boolean update_shareProfitWithdrawLog(ShareProfitWithdrawLog shareProfitWithdrawLog) throws Exception;

    /**
     * 获取分润已操作记录
     * @return
     */
    List<ShareProfitWithdrawLog> getShareProfitWithdrawLog() throws Exception;
}
