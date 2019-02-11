package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.CheckIntegralSourceLogMapper;
import com.hrtxn.flchappinessmall.pojo.CheckIntegralSourceLog;
import com.hrtxn.flchappinessmall.service.CheckIntegralSourceLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class CheckIntegralSourceLogServiceImpl implements CheckIntegralSourceLogService {

    @Autowired
    private CheckIntegralSourceLogMapper checkIntegralSourceLogMapper;

    /**
     * 获取某一用户的考核积分来源记录
     * @param id
     * @return
     */
    public List<CheckIntegralSourceLog> getIntegralLogByUserId(Integer id) throws Exception {
        return checkIntegralSourceLogMapper.getIntegralLogByUserId(id);
    }

    /**
     * 添加充值积分记录
     * @param checkIntegralSourceLog
     * @return
     */
    public boolean addCheckIntegralSourceLog(CheckIntegralSourceLog checkIntegralSourceLog) throws Exception {
        return checkIntegralSourceLogMapper.addCheckIntegralSourceLog(checkIntegralSourceLog) > 0 ? true : false;
    }

    /**
     * 获取所有考核积分来源记录
     * @return
     */
    @Override
    public List<CheckIntegralSourceLog> getAllIntegralLOgs() throws Exception {
        return checkIntegralSourceLogMapper.getAllIntegralLOgs();
    }

}
