package com.hrtxn.flchappinessmall.mapper;

import com.hrtxn.flchappinessmall.pojo.Article;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:38
 */
@Repository
public interface ArticleMapper {

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
     * @param id
     * @return
     */
    Article go_articleDetail(@Param("id") Integer id) throws Exception;

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
