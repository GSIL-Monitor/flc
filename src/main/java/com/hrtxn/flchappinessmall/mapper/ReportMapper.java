package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Report;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Repository
public interface ReportMapper {

    /**
     * 获取所有举报商品记录
     * @return
     */
    List<Report> getGoodsReports() throws Exception;

    /**
     * 修改操作备注
     * @param report
     * @return
     */
    int reportReply(Report report) throws Exception;

    /**
     * 删除举报商品记录
     * @param id
     * @return
     */
    int deleteReport(Integer id) throws Exception;

    /**
     * 获取所有举报店铺记录
     * @return
     */
    List<Report> getReportsStore() throws Exception;
}
