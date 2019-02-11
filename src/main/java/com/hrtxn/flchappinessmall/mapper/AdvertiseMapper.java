package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Advertise;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Repository
public interface AdvertiseMapper {

    /**
     * 获取所有广告信息
     * @return
     */
    List<Advertise> getAllAdvertise() throws Exception;

    /**
     * 添加广告
     * @param advertise
     * @return
     */
    int addAdvertise(Advertise advertise) throws Exception;

    /**
     * 删除广告
     * @param id
     * @return
     */
    int deleteAdvertise(@Param("id") Integer id) throws Exception;

    /**
     * 修改广告状态出错
     * @param advertise
     * @return
     */
    int update_advertise(Advertise advertise) throws Exception;

    /**
     * 根据ID获取广告信息
     * @param id
     * @return
     */
    Advertise getAdvertiseById(@Param("id") Integer id) throws Exception;
}
