package com.hrtxn.flchappinessmall.controller;

import com.hrtxn.flchappinessmall.pojo.Admin;
import com.hrtxn.flchappinessmall.pojo.Article;
import com.hrtxn.flchappinessmall.service.ArticleService;
import com.hrtxn.flchappinessmall.tools.Constant;
import com.hrtxn.flchappinessmall.tools.QiniuUtils;
import com.hrtxn.flchappinessmall.tools.Tools;
import com.hrtxn.flchappinessmall.tools.UUIDUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description: 文章控制类<描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Controller
@RequestMapping("/admin")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    private Logger logger = Logger.getLogger(ArticleController.class);

    /**
     * 获取所有文章
     * @return
     */
    @RequestMapping("/getAllArticles")
    public ModelAndView getAllArticles(){
        try {
            ModelAndView modelAndView = new ModelAndView("article/article_list.jsp");
            List<Article> articles = articleService.getAllArticles();
            modelAndView.addObject("articles",articles);
            return modelAndView;
        } catch (Exception e) {
            logger.error("获取所有文章出错",e);
        }
        return null;
    }

    /**
     * 修改文章状态
     * @param articleType
     * @param id
     * @return
     */
    @RequestMapping("/update_articleType")
    @ResponseBody
    public boolean update_articleType(
        @RequestParam("articleType") Integer articleType,
        @RequestParam("id") Integer id ){
        try {
            Article article = new Article();
            article.setArticleType(articleType);
            article.setId(id);
            return articleService.update_article(article) > 0 ? true : false;
        }catch (Exception e){
            logger.error("修改文章状态出错",e);
        }
        return false;
    }

    /**
     * 获取文章详情页
     * @param id
     * @return
     */
    @RequestMapping(value = "/go_articleDetail",method = RequestMethod.GET)
    public ModelAndView go_articleDetail(@RequestParam("id") Integer id){
        try {
            ModelAndView modelAndView = new ModelAndView("article/article_details.jsp");
            Article article = articleService.go_articleDetail(id);
            modelAndView.addObject("article",article);
            return modelAndView;
        } catch (Exception e) {
            logger.error("获取文章详情页出错",e);
        }
        return null;
    }

    /**
     * 跳转文章添加页
     * @return
     */
    @RequestMapping("/go_article_add")
    public ModelAndView go_article_add(){
        try {
            return new ModelAndView("article/article_add.jsp");
        } catch (Exception e) {
            logger.error("跳转文章添加页出错",e);
        }
        return null;
    }

    /**
     * 上传文件到七牛云
     * @param imgFile
     * @param request
     * @param dir
     * @return
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping("/articleUpload")
    public Map<String, Object> upload(MultipartFile imgFile, HttpServletRequest request,String dir) throws IOException {
        try {
            // 初始相关变量
            Map<String, Object> execute = new HashMap<String, Object>();
            String type = imgFile.getOriginalFilename().substring(imgFile.getOriginalFilename().indexOf("."));//获取后缀
            String key = UUIDUtils.get8UUID() + type;
            String url = QiniuUtils.qiniu(imgFile.getBytes(),key, Constant.ARTICLE,Constant.ARTICLEURL);
            // 返回上传文件的输出路径至前端
            execute.put("error", 0);
            execute.put("url", url);
            return execute;
        } catch (Exception e) {
            logger.error("文章上传文件到七牛云出错",e);
        }
        return null;
    }

    /**
     * 添加文章
     * @param articleTitle
     * @param articleType
     * @param articleContent
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/add_article")
    public boolean add_article(
        @RequestParam("articleTitle") String articleTitle,
        @RequestParam("articleType") Integer articleType,
        @RequestParam("articleContent") String articleContent,
        HttpServletRequest request){
        try {
            Article article = new Article();
            article.setArticleType(articleType);
            article.setArticleAddtime(Tools.date2Str(new Date()));
            article.setArticleAuthor(((Admin)request.getSession().getAttribute("admin")).getAdminNickName());
            article.setArticleContent(articleContent);
            article.setArticleTitle(articleTitle);
            return articleService.add_article(article) > 0 ? true : false;
        } catch (Exception e){
            logger.error("添加文章出错",e);
        }
        return false;
    }

    /**
     * 跳转到文章修改页
     * @param id
     * @return
     */
    @RequestMapping(value = "/go_articleUpdate",method = RequestMethod.GET)
    public ModelAndView go_articleUpdate(@RequestParam("id") Integer id){
        try {
            ModelAndView modelAndView = new ModelAndView("article/article_update.jsp");
            Article article = articleService.go_articleDetail(id);
            modelAndView.addObject("article",article);
            return modelAndView;
        } catch (Exception e) {
            logger.error("跳转到文章修改页出错",e);
        }
        return null;
    }

    /**
     * 修改文章内容
     * @param articleTitle
     * @param articleType
     * @param articleContent
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/update_article")
    public boolean update_article(
        @RequestParam("articleTitle") String articleTitle,
        @RequestParam("articleType") Integer articleType,
        @RequestParam("articleContent") String articleContent,
        @RequestParam("id") Integer id){
        try {
            Article article = new Article();
            article.setArticleType(articleType);
            article.setArticleContent(articleContent);
            article.setArticleTitle(articleTitle);
            article.setId(id);
            return articleService.update_article(article) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("修改文章内容出错",e);
        }
        return false;
    }

    /**
     * 删除文章
     * @param id
     * @return
     */
    @RequestMapping("/delete_article")
    @ResponseBody
    public boolean delete_article(@RequestParam("id") Integer id){
        try {
            return articleService.delete_article(id) > 0 ? true : false;
        } catch (Exception e) {
            logger.error("删除文章出错",e);
        }
        return false;
    }
}
