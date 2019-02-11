package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.ShareProfitWithdrawLogMapper;
import com.hrtxn.flchappinessmall.pojo.ShareProfitWithdrawLog;
import com.hrtxn.flchappinessmall.service.ShareProfitWithdrawLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class ShareProfitWithdrawLogServiceImpl implements ShareProfitWithdrawLogService {

    @Autowired
    private ShareProfitWithdrawLogMapper shareProfitWithdrawLogMapper;

    /**
     * 获取分润提现记录
     * @return
     */
    @Override
    public List<ShareProfitWithdrawLog> getProfitWithdrawal() throws Exception {
        return shareProfitWithdrawLogMapper.getProfitWithdrawal();
    }

    /**
     * 驳回分润提现申请
     * @param shareProfitWithdrawLog
     * @return
     */
    @Override
    public boolean update_shareProfitWithdrawLog(ShareProfitWithdrawLog shareProfitWithdrawLog) throws Exception {
        return shareProfitWithdrawLogMapper.update_shareProfitWithdrawLog(shareProfitWithdrawLog) > 0 ? true : false;
    }

    /**
     * 获取分润已操作记录
     * @return
     */
    @Override
    public List<ShareProfitWithdrawLog> getShareProfitWithdrawLog() throws Exception {
        return shareProfitWithdrawLogMapper.getShareProfitWithdrawLog();
    }
}
