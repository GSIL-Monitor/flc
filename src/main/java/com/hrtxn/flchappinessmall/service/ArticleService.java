package com.hrtxn.flchappinessmall.service;

import com.hrtxn.flchappinessmall.pojo.Article;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
public interface ArticleService {

    /**
     * 获取所有文章
     * @return
     */
    List<Article> getAllArticles() throws Exception;

    /**
     * 修改文章状态
     * @param article
     * @return
     */
    int update_article(Article article) throws Exception;

    /**
     * 获取文章详情页
     * @return
     * @param id
     */
    Article go_articleDetail(Integer id) throws Exception;

    /**
     * 添加文章
     * @param article
     * @return
     */
    int add_article(Article article) throws Exception;

    /**
     * 删除文章
     * @param id
     * @return
     */
    int delete_article(Integer id) throws Exception;
}
