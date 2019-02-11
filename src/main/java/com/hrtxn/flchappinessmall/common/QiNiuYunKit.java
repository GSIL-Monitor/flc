package com.hrtxn.flchappinessmall.common;

import com.hrtxn.flchappinessmall.tools.QiniuUtils;
import com.hrtxn.flchappinessmall.tools.UUIDUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * Author:封润
 * Date:2018-10-27 下午 2:57
 * Description:<七牛云上传图片工具类>
 */
public class QiNiuYunKit {


    /**
     * 上传图片
     * @param adverPic 上传文件
     * @return  七牛云图片地址
     */
    public static String uploading(String kongJian, CommonsMultipartFile adverPic){
        String qiNiuYunImgUrl=null;
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
                qiNiuYunImgUrl = QiniuUtils.qiniu(adverPic.getBytes(), filename, kongJian, "http://"+kongJian+".syc09098.com/");
            } catch (Exception e) {
                e.printStackTrace();

            }
        }
        return qiNiuYunImgUrl;
    }


    /**
     * 删除图片 二维码区域
     * @param imgcode 图片地址
     */
   public static void delectQiNiuYunImg(String kongJian, String imgcode){
        //删除七牛云文件
        String[] imgUrlArray = imgcode.split("/");
        QiniuUtils.deleteqiniu(kongJian, imgUrlArray[3]);//第三个就是其文件名加后缀
    }
//用到的地方:
//      删除分类:  类名:ClassifyServiceImpl  方法名:delectClassify
//      删除分类:  类名:ClassifyServiceImpl  方法名:delectClassify

}
