package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.TransferLog;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Repository
public interface TransferLogMapper {

    /**
     * 获取转账记录
     * @return
     */
    List<TransferLog> getTransferLogList() throws Exception;
}
