package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.TransferLog;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface TransferLogService {

    /**
     * 获取转账记录
     * @return
     */
    List<TransferLog> getTransferLogList() throws Exception;
}
