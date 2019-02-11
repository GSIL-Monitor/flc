package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.TransferLogMapper;
import com.hrtxn.flchappinessmall.pojo.TransferLog;
import com.hrtxn.flchappinessmall.service.TransferLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class TransferLogServiceImpl implements TransferLogService {

    @Autowired
    private TransferLogMapper transferLogMapper;

    /**
     * 获取转账记录
     * @return
     */
    @Override
    public List<TransferLog> getTransferLogList() throws Exception {
        return transferLogMapper.getTransferLogList();
    }
}
