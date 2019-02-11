package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.common.AjaxCommon;
import com.hrtxn.flchappinessmall.common.Res;
import com.hrtxn.flchappinessmall.exception.GoodsVoListNotNullException;
import com.hrtxn.flchappinessmall.pojo.Brand;
import com.hrtxn.flchappinessmall.pojo.Goods;
import com.hrtxn.flchappinessmall.service.BrandService;
import com.hrtxn.flchappinessmall.service.GoodsService;
import com.hrtxn.flchappinessmall.tools.Constant;
import com.hrtxn.flchappinessmall.tools.QiniuUtils;
import com.hrtxn.flchappinessmall.tools.UUIDUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Author:封润
 * Date:2018-10-23 下午 3:45
 * Description:<品牌管理 controller>
 */
@Controller
@RequestMapping("/brand")
public class BrandController {

    @Autowired
    private BrandService brandService;
    @Autowired
    private GoodsService goodsService;//商品

    private Logger logger = Logger.getLogger(StoreController.class);


    /**
     * 获取品牌详情 包括其 品牌详情下的所有正在销售的产品
     *
     * @param modelAndView
     * @param id
     * @return
     */
    @RequestMapping("/getbrandbyidss")
    public ModelAndView getBrandByIdss(ModelAndView modelAndView, Integer id) {
        Brand brandById = brandService.getBrandById(id);
        System.err.println(brandById);
        List<Goods> goodsList = goodsService.selectByBrandIdStatusTwo(id);
        modelAndView.addObject("brand", brandById);//品牌信息
        modelAndView.addObject("goodsList", goodsList);//品牌下正在销售产品信息
        modelAndView.addObject("goodsListSize", goodsList.size());//品牌下正在销售产品数量
        modelAndView.setViewName("/product/brand_detailed.jsp");
        return modelAndView;

    }


    /**
     * 获取品牌列表
     *
     * @param modelAndView
     * @return
     */
    @RequestMapping("/getbrandall")
    public ModelAndView getBrandAll(ModelAndView modelAndView) {
        List<Brand> brandAllList = brandService.getBrandAll();
        modelAndView.addObject("brandAllList", brandAllList);
        modelAndView.setViewName("/product/brand_manage.jsp");
        return modelAndView;
    }

    /**
     * 修改品牌启用禁用
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/modfybrandtype")
    public Res modfyBrandType(Integer id) {
        Res res = new Res();
        try {
            brandService.modfyBrandType(id);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("品牌状态修改成功!");
        } catch (Exception e) {
            logger.error("功能:[修改品牌启用禁用] * 出现异常类:[BrandController] * 出现异常方法:[modfyBrandType] ", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表系统异常,操作失败
            res.setMsg("服务器异常,请稍后重试!");
        }
        return res;
    }

    /**
     * 删除品牌
     *
     * @param brand
     * @return
     */
    @ResponseBody
    @RequestMapping("/removebrand")
    public Res removeBrand(Brand brand) {
        Res res = new Res();
        try {
            brandService.removeBrand(brand);
            res.setCode(AjaxCommon.RES_TRUE);//常量值:2000 代表操作成功
            res.setMsg("删除品牌成功!");
        } catch (GoodsVoListNotNullException e) {
            res.setCode(AjaxCommon.RES_FALSE);//常量值:4000 代表操作失败
            res.setMsg(e.getMessage());
        } catch (Exception e) {
            logger.error("功能:[删除品牌] * 出现异常类:[BrandController] * 出现异常方法:[removeBrand] ", e);
            res.setCode(AjaxCommon.RES_ERROR);//常量值:5000 代表操作失败
            res.setMsg("服务器异常,请稍后重试!");
        }
        return res;
    }

    /**
     * 根据Id查询品牌后返回修改页面
     *
     * @param modelAndView
     * @param id
     * @return
     */
    @RequestMapping("/getbrandbyid")
    public ModelAndView getBrandById(ModelAndView modelAndView, Integer id) {
        Brand brandById = null;
        try {
            brandById = brandService.getBrandById(id);
        } catch (Exception e) {
            logger.error("功能:[根据Id查询品牌后返回修改页面] * 出现异常类:[BrandController] * 出现异常方法:[getBrandById] ", e);
        }
        modelAndView.addObject("brand", brandById);
        modelAndView.setViewName("/product/brand_update.jsp");
        return modelAndView;
    }


    /**
     * 修改品牌
     *
     * @param modelAndView
     * @param brand
     * @param adverPic
     * @param imgUrl
     * @return
     */
    @RequestMapping("/modifybrand")
    public ModelAndView modifyBrand(ModelAndView modelAndView, Brand brand, @RequestParam(value = "adverPic", required = false) CommonsMultipartFile adverPic, String imgUrl) {
        String qiNiuYunImgUrl = null;
        // 商品图片
        if (adverPic != null && !adverPic.isEmpty()) {

            //type 获取文件后缀名 /格式
            String type = adverPic.getOriginalFilename()
                    .substring(adverPic.getOriginalFilename().indexOf("."));// 获取图片分类
            //使用uuid生成七牛云文件名
            String filename = UUIDUtils.get8UUID() + type;// 文件名
            // 存到数据库使用链接

            try {
                //执行齐丽云上传操作
                //转换成字符流getBytes    filename文件名
                //Constant.GOODS 空间名  外链Constant.GOODSURL  存在路径返回值
                //图片路径 存到数据库使用
                // 上传图片到七牛云
                qiNiuYunImgUrl = QiniuUtils.qiniu(adverPic.getBytes(), filename, Constant.BRAND, Constant.BRANDURL);
            } catch (Exception e) {
                logger.error("获取商品1图片出错" + e);
            }

            //删除七牛云文件
            String[] imgUrlArray = imgUrl.split("/");
            QiniuUtils.deleteqiniu("erweima", imgUrlArray[3]);//第三个就是其文件名加后缀
        }
        //去空格
        brand.setBrandDescription(brand.getBrandDescription().trim());
        brand.setBrandName(brand.getBrandName().trim());
        if (adverPic.isEmpty()) {
            //如果没有修改图片就使用原图片地址
            brand.setBrandLogo(imgUrl);
        } else {
            //修改了图片就使用存到七牛云的图片URL地址
            brand.setBrandLogo(qiNiuYunImgUrl);
        }


        //执行修改操作
        brandService.modfyBrand(brand);
        //调用获取所有品牌列表的controller方法 等同于再次刷新一下页面,更新一下页面数据
        modelAndView = getBrandAll(modelAndView);
        return modelAndView;
    }

    /**
     * 跳转到添加品牌页面
     *
     * @param modelAndView
     * @return
     */
    @RequestMapping("/gobrandaddjsp")
    public ModelAndView goBrandAddJsp(ModelAndView modelAndView) {
        modelAndView.setViewName("/product/brand_add.jsp");
        return modelAndView;
    }


    /**
     * 添加品牌
     *
     * @param modelAndView
     * @param brand
     * @param adverPic
     * @param
     * @return
     */
    @RequestMapping("/addbrand")
    public ModelAndView addBrand(ModelAndView modelAndView, Brand brand, @RequestParam(value = "adverPic", required = false) CommonsMultipartFile adverPic) {
        String qiNiuYunImgUrl = null;
        System.out.println("显示隐藏值" + brand.getBrandType());
        // 商品图片
        if (adverPic != null && !adverPic.isEmpty()) {

            //type 获取文件后缀名 /格式
            String type = adverPic.getOriginalFilename()
                    .substring(adverPic.getOriginalFilename().indexOf("."));// 获取图片分类
            //使用uuid生成七牛云文件名
            String filename = UUIDUtils.get8UUID() + type;// 文件名
            // 存到数据库使用链接

            try {
                //执行齐丽云上传操作
                //转换成字符流getBytes    filename文件名
                //Constant.GOODS 空间名  外链Constant.GOODSURL  存在路径返回值
                //图片路径 存到数据库使用
                // 上传图片到七牛云
                qiNiuYunImgUrl = QiniuUtils.qiniu(adverPic.getBytes(), filename, Constant.BRAND, Constant.BRANDURL);
            } catch (Exception e) {
                logger.error("获取商品1图片出错" + e);
            }
        }
        //去空格
        brand.setBrandDescription(brand.getBrandDescription().trim());
        brand.setBrandName(brand.getBrandName().trim());
        //使用存到七牛云的图片URL地址
        brand.setBrandLogo(qiNiuYunImgUrl);
        //执行修改操作
        brandService.addBrand(brand);
        //调用获取所有品牌列表的controller方法 等同于再次刷新一下页面,更新一下页面数据
        modelAndView = getBrandAll(modelAndView);
        return modelAndView;
    }
}
