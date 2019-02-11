package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.ProfitWithdrawLogMapper;
import com.hrtxn.flchappinessmall.pojo.ProfitWithdrawLog;
import com.hrtxn.flchappinessmall.pojo.ShareProfitWithdrawLog;
import com.hrtxn.flchappinessmall.service.ProfitWithdrawLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class ProfitWithdrawLogServiceImpl implements ProfitWithdrawLogService {

    @Autowired
    private ProfitWithdrawLogMapper profitWithdrawLogMapper;

    /**
     * 同意分红提现
     * @param profitWithdrawLog
     * @return
     */
    @Override
    public int update_ProfitWithdrawLog(ProfitWithdrawLog profitWithdrawLog) throws Exception {
        return profitWithdrawLogMapper.update_ProfitWithdrawLog(profitWithdrawLog);
    }

    /**
     * 获取用户分红提现记录
     * @return
     */
    @Override
    public List<ShareProfitWithdrawLog> getUserProfitWithdrawLogs() throws Exception {
        return profitWithdrawLogMapper.getUserProfitWithdrawLogs();
    }

    /**
     * 获取商铺分红提现记录
     * @return
     */
    @Override
    public List<ShareProfitWithdrawLog> getStoreProfitWithdrawLogs() throws Exception {
        return profitWithdrawLogMapper.getStoreProfitWithdrawLogs();
    }

    /**
     * 获取同意以及驳回的分红提现记录
     * @return
     */
    @Override
    public List<ProfitWithdrawLog> getProfitWithdrawLogs() throws Exception {
        return profitWithdrawLogMapper.getProfitWithdrawLogs();
    }

    /**
     * 获取用户分红提现记录
     * @return
     */
    @Override
    public List<ProfitWithdrawLog> getUserProfitedWithdrawLogs() throws Exception {
        return profitWithdrawLogMapper.getUserProfitedWithdrawLogs();
    }

    /**
     * 获取店铺分红提现记录
     * @return
     */
    @Override
    public List<ProfitWithdrawLog> getStoreProfitedWithdrawLogs() throws Exception {
        return profitWithdrawLogMapper.getStoreProfitedWithdrawLogs();
    }
}
