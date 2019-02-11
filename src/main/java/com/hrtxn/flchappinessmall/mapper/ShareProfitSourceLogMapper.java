package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.ShareProfitSourceLog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Repository
public interface ShareProfitSourceLogMapper {

    /**
     * 添加平台充值分红记录
     * @param shareProfitSourceLog
     * @return
     */
    int addPlateGrantProfitLog(ShareProfitSourceLog shareProfitSourceLog) throws Exception;

    /**
     * 获取某一用户发放的分红
     * @param id
     * @return
     */
    List<ShareProfitSourceLog> getProfitLog(@Param("id") Integer id) throws Exception;

    /**
     * 根据类型获取分红记录
     * @param type
     * @return
     */
    List<ShareProfitSourceLog> getShareProfitSourceLogByType(@Param("type") Integer type) throws Exception;

    /**
     * 根据当前日期和分红类型获取分红来源记录
     * @param format
     * @param type
     * @return
     */
    List<ShareProfitSourceLog> getShareProfitLog(@Param("type") Integer type,@Param("format") String format) throws Exception;
}
