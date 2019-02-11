package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.ShareProfitSourceLog;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface ShareProfitSourceLogService {


    /**
     * 添加平台充值分红记录
     * @param plateGrantProfitLog
     * @return
     */
    boolean addPlateGrantProfitLog(ShareProfitSourceLog plateGrantProfitLog) throws Exception;

    /**
     * 获取某一用户发放的分红
     * @param id
     * @return
     */
    List<ShareProfitSourceLog> getProfitLog(Integer id) throws Exception;

    /**
     * 根据类型获取分红记录
     * @param type
     * @return
     */
    List<ShareProfitSourceLog> getShareProfitSourceLogByType(Integer type) throws Exception;

    /**
     * 根据当前日期和分红类型获取分红来源记录
     * @param format
     * @param type
     * @return
     */
    List<ShareProfitSourceLog> getShareProfitLog(Integer type,String format) throws Exception;
}
