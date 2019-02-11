package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.pojo.Admin;
import com.hrtxn.flchappinessmall.pojo.Advertise;
import com.hrtxn.flchappinessmall.service.AdvertiseService;
import com.hrtxn.flchappinessmall.tools.Constant;
import com.hrtxn.flchappinessmall.tools.QiniuUtils;
import com.hrtxn.flchappinessmall.tools.Tools;
import com.hrtxn.flchappinessmall.tools.UUIDUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description: 广告控制类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Controller
@RequestMapping("/admin")
public class AdvertiseController {
    @Autowired
    private AdvertiseService advertiseService;

    private Logger logger = Logger.getLogger(AdvertiseController.class);

    /**
     * 获取所有广告信息
     * @return
     */
    @RequestMapping("/getAllAdvertise")
    public ModelAndView getAllAdvertise(){
        try {
            ModelAndView modelAndView = new ModelAndView("advertise/advertising.jsp");
            List<Advertise> advertiseList = advertiseService.getAllAdvertise();
            modelAndView.addObject("advertiseList",advertiseList);
            return modelAndView;
        } catch (Exception e) {
            logger.error("获取所有广告信息出错",e);
        }
        return null;
    }

    /**
     * 添加广告
     * @param adverPlatform
     * @param adverLocation
     * @param adverContent
     * @param adverContenturl
     * @param adverType
     * @param adverImageurl
     * @param request
     * @return
     */
    @RequestMapping ("/addAdvertise")
    @ResponseBody
    public boolean addAdvertise(
            @RequestParam("adverPlatform") Integer adverPlatform,
            @RequestParam("adverLocation") Integer adverLocation,
            @RequestParam("adverContent") String adverContent,
            @RequestParam("adverContenturl") String adverContenturl,
            @RequestParam("adverType") Integer adverType,
            @RequestParam("adverImageurl") CommonsMultipartFile adverImageurl,
            HttpServletRequest request){
        try {
            //上传图片到七牛云
            String type0 = adverImageurl.getOriginalFilename().substring(adverImageurl.getOriginalFilename().indexOf("."));// 获取后缀
            String key0 = UUIDUtils.get8UUID() + type0;//生成文件名
            //获取七牛云链接
            String _adverImageurl = QiniuUtils.qiniu(adverImageurl.getBytes(),key0,Constant.ADVERTISE,Constant.ADVERTISEURL);

            //添加广告
            Advertise advertise = new Advertise();
            advertise.setAdverAddtime(Tools.date2Str(new Date()));
            advertise.setAdverContent(adverContent);
            advertise.setAdverHandlersType(2);
            advertise.setAdverHandlersName(((Admin)request.getSession().getAttribute("admin")).getAdminNickName());
            advertise.setAdverImageurl(_adverImageurl);
            advertise.setAdverLocation(adverLocation);
            advertise.setAdverPlatform(adverPlatform);
            advertise.setAdverContenturl(adverContenturl);
            advertise.setAdverType(adverType);
            return advertiseService.addAdvertise(advertise) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("添加广告出错",e);
        }
        return false;
    }

    /**
     * 删除广告
     * @param id
     * @return
     */
    @RequestMapping("/deleteAdvertise")
    @ResponseBody
    public Map<String,String> deleteAdvertise(@RequestParam("id") Integer id){
        HashMap<String,String> map = new HashMap<String, String>();
        try {

            //删除七牛云文件
            Advertise advertise = advertiseService.getAdvertiseById(id);
            if (advertise!=null && advertise.getAdverImageurl() != null){
                boolean deleteqiniu = QiniuUtils.deleteqiniu(Constant.ADVERTISE, advertise.getAdverImageurl().split("/")[3]);
                if (deleteqiniu){
                    int count = advertiseService.deleteAdvertise(id);
                    if (count > 0){
                        map.put("code","2000");
                    }
                }else {
                    //删除七牛云文件出错
                    map.put("code","7001");
                }
            }else {
                //获取广告出错
                map.put("code","7002");
            }
        } catch (Exception e) {
            logger.error("删除广告出错",e);
            map.put("code","5000");
        }
        return map;
    }

    /**
     * 修改广告状态出错
     * @param adverType
     * @param id
     * @return
     */
    @RequestMapping("/update_advertise")
    @ResponseBody
    public boolean update_advertise(
        @RequestParam("adverType") Integer adverType,
        @RequestParam("id") Integer id){
        try {
            Advertise advertise = new Advertise();
            advertise.setAdverType(adverType);
            advertise.setId(id);
            return advertiseService.update_advertise(advertise) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("修改广告状态出错",e);
        }
        return false;
    }

    /**
     * 修改广告信息
     * @param adverType
     * @param id
     * @return
     */
    @RequestMapping("/edit_advertise")
    @ResponseBody
    public boolean edit_advertise(
            @RequestParam("_adverPlatform") Integer adverPlatform,
            @RequestParam("_adverLocation") Integer adverLocation,
            @RequestParam("_adverContent") String adverContent,
            @RequestParam("_adverContenturl") String adverContenturl,
            @RequestParam("_adverType") Integer adverType,
            @RequestParam(value = "_adverImageurl",required = false) CommonsMultipartFile adverImageurl,
            @RequestParam("id") Integer id){
        try {
            //修改广告
            Advertise advertise = new Advertise();
            advertise.setAdverContent(adverContent);
            advertise.setAdverLocation(adverLocation);
            advertise.setAdverPlatform(adverPlatform);
            advertise.setAdverContenturl(adverContenturl);
            advertise.setAdverType(adverType);
            advertise.setId(id);
            if(!Tools.isEmpty(adverImageurl) && adverImageurl.getSize() > 0){
                //删除七牛云文件
                //先获取广告信息，获取七牛云文件链接
                Advertise advertiseById = advertiseService.getAdvertiseById(id);
                if (!Tools.isEmpty(advertiseById) && !Tools.isEmpty(advertiseById.getAdverImageurl())){
                    boolean flag = QiniuUtils.deleteqiniu(Constant.ADVERTISE, advertiseById.getAdverImageurl().split("/")[3]);
                    if (flag){
                        //上传图片到七牛云
                        String type0 = adverImageurl.getOriginalFilename().substring(adverImageurl.getOriginalFilename().indexOf("."));// 获取后缀
                        String key0 = UUIDUtils.get8UUID() + type0;//生成文件名
                        //获取七牛云链接
                        String _adverImageurl = QiniuUtils.qiniu(adverImageurl.getBytes(),key0,Constant.ADVERTISE,Constant.ADVERTISEURL);
                        advertise.setAdverImageurl(_adverImageurl);
                    }
                }
            }
            return advertiseService.update_advertise(advertise) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("修改广告状态出错",e);
        }
        return false;
    }

    /**
     * 根据ID获取广告信息
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/getAdvertiseById")
    public Advertise getAdvertiseById(@RequestParam("id") Integer id){
        try {
            return  advertiseService.getAdvertiseById(id);
        } catch (Exception e) {
            logger.error("根据ID获取广告信息出错",e);
        }
        return null;
    }
}
