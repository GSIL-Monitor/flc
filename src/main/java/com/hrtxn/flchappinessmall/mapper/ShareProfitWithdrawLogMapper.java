package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.ShareProfitWithdrawLog;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Repository
public interface ShareProfitWithdrawLogMapper {

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
    int update_shareProfitWithdrawLog(ShareProfitWithdrawLog shareProfitWithdrawLog) throws Exception;

    /**
     * 获取分润已操作记录
     * @return
     */
    List<ShareProfitWithdrawLog> getShareProfitWithdrawLog() throws Exception;
}
