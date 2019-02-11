package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.Sysconfig;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface SysconfigService {

    /**
     *  获取支付方式
     * @return
     */
    Sysconfig getSysConfig() throws Exception;

    /**
     * 修改系统分数（支付方式显示）
     * @param sysconfig
     * @return
     */
    int update_sysConfig(Sysconfig sysconfig) throws Exception;
}
