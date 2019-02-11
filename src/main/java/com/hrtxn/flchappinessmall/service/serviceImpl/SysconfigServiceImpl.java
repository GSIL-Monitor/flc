package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.SysconfigMapper;
import com.hrtxn.flchappinessmall.pojo.Sysconfig;
import com.hrtxn.flchappinessmall.service.SysconfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class SysconfigServiceImpl implements SysconfigService {

    @Autowired
    private SysconfigMapper sysconfigMapper ;

    /**
     * 获取支付方式
     * @return
     */
    @Override
    public Sysconfig getSysConfig() throws Exception {
        return sysconfigMapper.getSysConfig();
    }

    /**
     * 修改系统分数（支付方式显示）
     * @param sysconfig
     * @return
     */
    @Override
    public int update_sysConfig(Sysconfig sysconfig) throws Exception {
        return sysconfigMapper.update_sysConfig(sysconfig);
    }
}
