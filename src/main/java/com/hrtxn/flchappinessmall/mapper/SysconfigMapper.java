package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Sysconfig;
import org.springframework.stereotype.Repository;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Repository
public interface SysconfigMapper {

    /**
     * 获取系统参数配置对象
     * @return
     */
    Sysconfig getSysConfig();

    /**
     * 修改系统分数（支付方式显示）
     * @param sysconfig
     * @return
     */
    int update_sysConfig(Sysconfig sysconfig) throws Exception;
}
