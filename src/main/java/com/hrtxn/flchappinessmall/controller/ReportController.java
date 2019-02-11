package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.pojo.Admin;
import com.hrtxn.flchappinessmall.pojo.Report;
import com.hrtxn.flchappinessmall.service.ReportService;
import com.hrtxn.flchappinessmall.tools.Tools;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Description: 举报商品控制类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Controller
@RequestMapping("/admin")
public class ReportController {
    @Autowired
    private ReportService reportService;

    private Logger logger = Logger.getLogger(ReportController.class);

    /**
     * 跳转到举报管理页面
     * @return
     */
    @RequestMapping("/go_reports")
    public ModelAndView go_reports(){
        return new ModelAndView("message/report.jsp");
    }

    /**
     * 获取所有举报商品记录
     * @return
     */
    @RequestMapping("/getGoodsReports")
    @ResponseBody
    public List<Report> getGoodsReports(){
        try {
            return reportService.getGoodsReports();
        } catch (Exception e) {
            logger.error("获取所有举报商品记录出错",e);
        }
        return null;
    }

    /**
     * 获取所有举报店铺记录
     * @return
     */
    @RequestMapping("/getReportsStore")
    @ResponseBody
    public List<Report> getReportsStore(){
        try {
            return reportService.getReportsStore();
        } catch (Exception e) {
            logger.error("获取所有举报店铺记录出错",e);
        }
        return null;
    }

    /**
     * 修改操作备注
     * @param operationNote
     * @param id
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/reportReply")
    public boolean reportReply(
            @RequestParam("operationNote") String operationNote,
            @RequestParam("id") Integer id, HttpServletRequest request){
        try {
            Report report = new Report();
            report.setOperationNote(operationNote);
            report.setOperationHandler(((Admin)request.getSession().getAttribute("admin")).getAdminNickName());
            report.setOperationTime(Tools.date2Str(new Date()));
            report.setId(id);
            return reportService.reportReply(report) > 0 ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("修改操作备注",e);
        }
        return false;
    }

    /**
     * 删除举报商品记录
     * @return
     */
    @ResponseBody
    @RequestMapping("/deleteReport")
    public boolean deleteReport(@RequestParam("id") Integer id){
        try {
            return reportService.deleteReport(id) > 0 ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("删除举报商品记录出错",e);
        }
        return false;
    }
}
