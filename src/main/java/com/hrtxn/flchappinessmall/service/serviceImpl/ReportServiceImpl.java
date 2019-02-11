package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.ReportMapper;
import com.hrtxn.flchappinessmall.pojo.Report;
import com.hrtxn.flchappinessmall.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportMapper reportMapper;

    /**
     * 获取所有举报商品记录
     * @return
     */
    @Override
    public List<Report> getGoodsReports() throws Exception {
        return reportMapper.getGoodsReports();
    }

    /**
     * 修改操作备注
     * @param report
     * @return
     */
    @Override
    public int reportReply(Report report) throws Exception {
        return reportMapper.reportReply(report);
    }

    /**
     * 删除举报商品记录
     * @param id
     * @return
     */
    @Override
    public int deleteReport(Integer id) throws Exception {
        return reportMapper.deleteReport(id);
    }

    /**
     * 获取所有举报店铺记录
     * @return
     */
    @Override
    public List<Report> getReportsStore() throws Exception {
        return reportMapper.getReportsStore();
    }
}
