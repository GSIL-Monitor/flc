package com.hrtxn.flchappinessmall.service.serviceImpl;

import com.hrtxn.flchappinessmall.mapper.ArticleMapper;
import com.hrtxn.flchappinessmall.pojo.Article;
import com.hrtxn.flchappinessmall.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description: <描述>
 * Author: zhouchuanyu
 * Date:2018-10-02 8:39
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    /**
     * 获取所有文章
     * @return
     */
    @Override
    public List<Article> getAllArticles() throws Exception {
        return articleMapper.getAllArticles();
    }

    /**
     * 修改文章状态
     * @param article
     * @return
     */
    @Override
    public int update_article(Article article) throws Exception {
        return articleMapper.update_article(article);
    }

    /**
     * 获取文章详情页
     * @return
     */
    @Override
    public Article go_articleDetail(Integer id) throws Exception {
        return articleMapper.go_articleDetail(id);
    }

    /**
     * 添加文章
     * @param article
     * @return
     */
    @Override
    public int add_article(Article article) throws Exception {
        return articleMapper.add_article(article);
    }

    /**
     * 删除文章
      * @param id
     * @return
     */
    @Override
    public int delete_article(Integer id) throws Exception {
        return articleMapper.delete_article(id);
    }

}
