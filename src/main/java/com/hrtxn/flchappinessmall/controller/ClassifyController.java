package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.common.*;
import com.hrtxn.flchappinessmall.exception.ClassNotNullException;
import com.hrtxn.flchappinessmall.exception.ClassifyIndexOneException;
import com.hrtxn.flchappinessmall.exception.GoodsListNotNullException;
import com.hrtxn.flchappinessmall.exception.StoreListNotNullException;
import com.hrtxn.flchappinessmall.pojo.Classify;
import com.hrtxn.flchappinessmall.service.ClassifyService;
import com.hrtxn.flchappinessmall.tools.Constant;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Author:封润
 * Date:2018-10-26 上午 9:55
 * Description:<分类controller 层>
 */
@Controller
@RequestMapping("/classify")
public class ClassifyController {

    @Autowired
    private ClassifyService classifyService;

    private Logger logger = Logger.getLogger(StoreController.class);


    /**
     * 获取分类 1级
     *
     * @param modelAndView
     * @return
     */
    @RequestMapping("/getClassifyListByLevelOne")
    public ModelAndView getClassifyListByLevelOne(ModelAndView modelAndView) {
        List<Classify> classifyListByLevelOne = new ArrayList<Classify>();
        try {
            classifyListByLevelOne = classifyService.getClassifyListByLevelOne();
        } catch (Exception e) {
            logger.error("功能:[获取分类 1级] * 出现异常类:[ClassifyController] * 出现异常方法:[getClassifyListByLevelOne] ", e);

        }
        modelAndView.setViewName("/product/category_manage.jsp");
        modelAndView.addObject("classifyListByLevelOne", classifyListByLevelOne);
        return modelAndView;
    }

    /**
     * 修改分类隐藏显示
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/modifyclassifytype")
    public Res modifyClassifyType(Integer id) {
        Res res = new Res();

        try {
            classifyService.modifyClassifyType(id);
            res.setCode(AjaxCommon.RES_TRUE);
            res.setMsg("修改状态成功");
        } catch (Exception e) {
            res.setCode(AjaxCommon.RES_ERROR);
            res.setMsg("系统异常,请稍后重试!");
            logger.error("功能:[修改分类隐藏显示] * 出现异常类:[ClassifyController] * 出现异常方法:[modifyClassifyType] ", e);
        }
        return res;
    }

    /**
     * 根据Id获取分类信息
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/getclassifybyid")
    public Res getClassifyById(Integer id) {
        Res res = new Res();

        try {
            Classify classifyById = classifyService.getClassifyById(id);
            res.setCode(AjaxCommon.RES_TRUE);
            res.setMsg("修改状态成功");
            res.setObj(classifyById);
        } catch (Exception e) {
            res.setCode(AjaxCommon.RES_ERROR);
            res.setMsg("系统异常,请稍后重试!");
            logger.error("功能:[修改分类隐藏显示] * 出现异常类:[ClassifyController] * 出现异常方法:[modifyClassifyType] ", e);
        }
        return res;
    }


    /**
     * 修改分类
     *
     * @param
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/modifyclassify")
    public Res modifyClassify(Integer id, String classifyName, Integer classifytype, String classifyDescription, String imgcode, @RequestParam(value = "classifyImg", required = false) CommonsMultipartFile adverPic) {


        Res res = new Res();
        Classify classify = new Classify();
        String qiNiuYunImgUrl = null;
        //判断用户是否上传了新的图片 不为空的情况下做上传操作
        if (adverPic != null && !adverPic.isEmpty()) {
            //存储图片
            qiNiuYunImgUrl = QiNiuYunKit.uploading(Constant.FEN_LEI,adverPic);
            //删除图片
            QiNiuYunKit.delectQiNiuYunImg(Constant.FEN_LEI, imgcode);
        }

        if (adverPic != null && !adverPic.isEmpty()) {
            classify.setClassifyLogo(qiNiuYunImgUrl); //图片
        } else {
            classify.setClassifyLogo(imgcode);
        }
        //创建添加时间
        SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addTime = formatter2.format(new Date());//2017-09-15 13:18:44
        classify.setId(id);
        classify.setClassifyAddtime(addTime);
        classify.setClassifyType(classifytype);
        classify.setClassifyName(classifyName);
        classify.setClassifyDescription(classifyDescription);


        try {
            classifyService.modifyClassify(classify);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("修改分类成功");
        } catch (Exception e) {
            logger.error("功能:[修改分类] * 出现异常类:[ClassifyController] * 出现异常方法:[modifyClassify] ", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,修改分类失败 请稍后重试");
        }
        return res;
    }

    /**
     * 添加一级分类
     *
     * @param
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/addclassify")
    public Res addClassify(String classifyName, Integer classifytype, String classifyDescription, @RequestParam(value = "classifyImg", required = false) CommonsMultipartFile adverPic) {
        Res res = new Res();
        String qiNiuYunImgUrl = null;
        Classify classify = new Classify();

        // 商品图片
        if (adverPic != null && !adverPic.isEmpty()) {
            //存储图片
            qiNiuYunImgUrl = QiNiuYunKit.uploading(Constant.FEN_LEI,adverPic);
        }

        //创建添加时间
        SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addTime = formatter2.format(new Date());//2017-09-15 13:18:44

        classify.setClassifyAddtime(addTime);
        classify.setClassifyType(classifytype);
        classify.setClassifyName(classifyName);
        classify.setClassifyLogo(qiNiuYunImgUrl);                     //图片
        classify.setClassifyDescription(classifyDescription);
        classify.setClassifyLevel(ClassifyCommon.CLASSIFY_LEVEL_ONE);//常量值1 代表分类级别1


        try {
            classifyService.addClassify(classify);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("添加分类成功");
        } catch (Exception e) {
            logger.error("功能:[添加分类] * 出现异常类:[ClassifyController] * 出现异常方法:[addClassify] ", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }
        return res;
    }

    /**
     * 添加子分类
     *
     * @param classifyPId         上级Id
     * @param classifyPLevel      上级等级值
     * @param classifyName        分类名
     * @param classifytype        是否隐藏  1显示 2隐藏
     * @param adverPic            图片流
     * @param classifyDescription 分类描述
     * @return
     */
    @ResponseBody
    @RequestMapping("/addsonclassify")
    public Res addSonClassify(Integer classifyPId, Integer classifyPLevel, String classifyName, Integer classifytype, String classifyDescription, @RequestParam(value = "classifyImg", required = false) CommonsMultipartFile adverPic) {


        System.err.println("classifyPId:" + classifyPId);
        System.err.println("classifyPLevel:" + classifyPLevel);
        System.err.println("classifyName:" + classifyName);
        System.err.println("classifytype:" + classifytype);
        System.err.println("adverPic:" + adverPic);
        System.err.println("classifyDescription:" + classifyDescription);


        Res res = new Res();
        String qiNiuYunImgUrl = null;
        Classify classify = new Classify();

        // 商品图片
        if (adverPic != null && !adverPic.isEmpty()) {
            //存储图片
            try {
                qiNiuYunImgUrl = QiNiuYunKit.uploading(Constant.FEN_LEI,adverPic);
            } catch (Exception e) {
                logger.error("功能:[添加子分类] * 出现异常类:[ClassifyController] * 出现异常方法:[addSonClassify] * 备注 [上传图片出错]", e);
                res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
                res.setMsg("系统异常,上传图片失败,请稍后重试");
                return res;
            }
        }
        //创建添加时间
        SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addTime = formatter2.format(new Date());//2017-09-15 13:18:44

        classify.setClassifyAddtime(addTime);
        classify.setClassifyName(classifyName);
        classify.setClassifyParentid(classifyPId);
        System.out.println(classifyPId);
        classify.setClassifyLogo(qiNiuYunImgUrl);
        classify.setClassifyType(classifytype);
        classify.setClassifyDescription(classifyDescription);
        //通过上级级别 判断设置当前分类级别
        if (classifyPLevel == ClassifyCommon.CLASSIFY_LEVEL_ONE) {//常量值:1 代表一级
            classify.setClassifyLevel(ClassifyCommon.CLASSIFY_LEVEL_TWO);//常量值:2 代表二级
        }

        if (classifyPLevel == ClassifyCommon.CLASSIFY_LEVEL_TWO) {
            classify.setClassifyLevel(ClassifyCommon.CLASSIFY_LEVEL_THREE);//常量值:3 代表三级
        }

        //将子分类添加到数据库
        try {
            classifyService.addClassify(classify);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("添加子分类成功");
        } catch (Exception e) {
            logger.error("功能:[添加子分类] * 出现异常类:[ClassifyController] * 出现异常方法:[addSonClassify] ", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }
        return res;
    }


    /**
     * 删除一级分类
     */
    @ResponseBody
    @RequestMapping("/delectoneclassify")
    public Res delectOneClassify(Integer id) {
        Res res = new Res();
        try {
            classifyService.delectClassify(id);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("删除分类成功");
        } catch (ClassNotNullException e) {
            logger.error("功能:[删除一级分类] * 出现异常类:[ClassifyController] * 出现异常方法:[delectOneClassify] ", e);
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 代表  操作失败
            res.setMsg(e.getMessage());
        } catch (StoreListNotNullException e) {
            logger.error("功能:[删除一级分类] * 出现异常类:[ClassifyController] * 出现异常方法:[delectOneClassify] ", e);
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 代表 系统异常 操作失败
            res.setMsg(e.getMessage());
        } catch (GoodsListNotNullException e) {
            logger.error("功能:[删除一级分类] * 出现异常类:[ClassifyController] * 出现异常方法:[delectOneClassify] ", e);
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 代表 系统异常 操作失败
            res.setMsg(e.getMessage());
        } catch (Exception e) {
            logger.error("功能:[删除一级分类] * 出现异常类:[ClassifyController] * 出现异常方法:[delectOneClassify] ", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }
        return res;
    }


    /**
     * 根据父Id获取子分类信息  (返回modelandview)
     *
     * @param modelAndView
     * @param parentId
     * @return
     */
    @RequestMapping("/getclassifybypid")
    public ModelAndView getClassifyByPId(ModelAndView modelAndView, Integer parentId, Integer code, Integer classifyPLevel) {

        List<Classify> classifyList = new ArrayList<Classify>();
        if (parentId != null) {
            classifyList = classifyService.getClassifyByPId(parentId);
        }

        //如果识别code是2就返回到二级分类页面
        if (code == 2) {
            modelAndView.setViewName("/product/category_manage_er.jsp");
        }

        //如果识别code是3就返回到三级分类页面
        if (code == 3) {
            modelAndView.setViewName("/product/category_manage_san.jsp");
        }
        modelAndView.addObject("parentId", parentId);//父id
        modelAndView.addObject("classifyList", classifyList);
        modelAndView.addObject("classifyPLevel", classifyPLevel);//父等级 新增分类使用

        return modelAndView;
    }


    /**
     * 删除三级分类
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/delectthreeclassify")
    public Res delectThreeClassify(Integer id) {
        Res res = new Res();
        try {
            classifyService.delectClassifyLevelThree(id);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("删除分类成功");
        } catch (GoodsListNotNullException e) {
            logger.error("功能:[删除三级分类] * 出现异常类:[ClassifyController] * 出现异常方法:[delectThreeClassify] ", e);
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 代表  操作失败
            res.setMsg(e.getMessage());
        } catch (Exception e) {
            logger.error("功能:[删除三级分类] * 出现异常类:[ClassifyController] * 出现异常方法:[delectThreeClassify] ", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }
        return res;
    }

    /**
     * 删除二级分类
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/delecttwoclassify")
    public Res delectTwoClassify(Integer id) {
        Res res = new Res();

        try {
            classifyService.delectClassifyTwo(id);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("删除分类成功");
        } catch (GoodsListNotNullException e) {
            logger.error("功能:[删除二级分类] * 出现异常类:[ClassifyController] * 出现异常方法:[delectTwoClassify] ", e);
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 代表  操作失败
            res.setMsg(e.getMessage());
        } catch (Exception e) {
            logger.error("功能:[删除二级分类] * 出现异常类:[ClassifyController] * 出现异常方法:[delectTwoClassify] ", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }
        return res;
    }


    /**
     * 分类推荐管理
     * (推荐/取消推荐)
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/tuijian")
    public Res tuiJian(Classify classify) {
        Res res = new Res();

        System.out.println("传入的index:" + classify.getClassifyIndex());

        //反转推荐
        if (classify.getClassifyIndex() == ClassifyCommon.QUXIAOTUIJIAN) {//取消推荐
            classify.setClassifyIndex(ClassifyCommon.TUIJIAN);
            res.setMsg("分类推荐成功");
        }else if(classify.getClassifyIndex() == ClassifyCommon.TUIJIAN){
            classify.setClassifyIndex(ClassifyCommon.QUXIAOTUIJIAN);
            res.setMsg("取消分类推荐成功");
        }




        try {
            classifyService.tuijian(classify);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
        } catch (ClassifyIndexOneException e) {
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 代表 系统异常 操作失败
            res.setMsg(e.getMessage());
        } catch (Exception e) {
            logger.error("功能:[分类推荐管理] * 出现异常类:[ClassifyController] * 出现异常方法:[tuiJian] ", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表 系统异常 操作失败
            res.setMsg("系统异常,请稍后重试");
        }
        return res;
    }

}
