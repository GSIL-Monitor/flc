package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.AdvertiseMapper;
import com.hrtxn.flchappinessmall.pojo.Advertise;
import com.hrtxn.flchappinessmall.service.AdvertiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class AdvertiseServiceImpl implements AdvertiseService {

    @Autowired
    private AdvertiseMapper advertiseMapper;

    /**
     * 获取所有广告信息
     * @return
     */
    @Override
    public List<Advertise> getAllAdvertise() throws Exception {
        return advertiseMapper.getAllAdvertise();
    }

    /**
     * 添加广告
     * @param advertise
     * @return
     */
    @Override
    public int addAdvertise(Advertise advertise) throws Exception {
        return advertiseMapper.addAdvertise(advertise);
    }

    /**
     * 删除广告
     * @param id
     * @return
     */
    @Override
    public int deleteAdvertise(Integer id) throws Exception {
        return advertiseMapper.deleteAdvertise(id);
    }

    /**
     * 修改广告状态出错
     * @param advertise
     * @return
     */
    @Override
    public int update_advertise(Advertise advertise) throws Exception {
        return advertiseMapper.update_advertise(advertise);
    }

    /**
     * 根据ID获取广告信息
     * @param id
     * @return
     */
    @Override
    public Advertise getAdvertiseById(Integer id) throws Exception {
        return advertiseMapper.getAdvertiseById(id);
    }
}
