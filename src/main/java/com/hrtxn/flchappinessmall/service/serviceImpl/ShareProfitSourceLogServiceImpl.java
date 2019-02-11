package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.ShareProfitSourceLogMapper;
import com.hrtxn.flchappinessmall.pojo.ShareProfitSourceLog;
import com.hrtxn.flchappinessmall.service.ShareProfitSourceLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class ShareProfitSourceLogServiceImpl implements ShareProfitSourceLogService {

    @Autowired
    private ShareProfitSourceLogMapper shareProfitSourceLogMapper;

    /**
     * 添加平台充值分红记录
     * @param shareProfitSourceLog
     * @return
     */
    public boolean addPlateGrantProfitLog(ShareProfitSourceLog shareProfitSourceLog) throws Exception {
        return shareProfitSourceLogMapper.addPlateGrantProfitLog(shareProfitSourceLog) > 0 ? true : false;
    }

    /**
     * 获取某一用发放的分红
     * @param id
     * @return
     */
    @Override
    public List<ShareProfitSourceLog> getProfitLog(Integer id) throws Exception {
        return shareProfitSourceLogMapper.getProfitLog(id);
    }

    /**
     * 根据类型获取分红记录
     * @param type
     * @return
     */
    @Override
    public List<ShareProfitSourceLog> getShareProfitSourceLogByType(Integer type) throws Exception {
        return shareProfitSourceLogMapper.getShareProfitSourceLogByType(type);
    }

    /**
     * 根据当前日期和分红类型获取分红来源记录
     * @param format
     * @param type
     * @return
     * @throws Exception
     */
    @Override
    public List<ShareProfitSourceLog> getShareProfitLog(Integer type,String format) throws Exception {
        return shareProfitSourceLogMapper.getShareProfitLog(type,format);
    }


}
