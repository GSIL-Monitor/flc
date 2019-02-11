package com.hrtxn.flchappinessmall.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 文章实体类
 */
@Data
public class Article implements Serializable {
    private Integer id;

    private String articleTitle;

    private String articleAddtime;

    private Integer articleType;

    private String articleAuthor;

    private String articleContent;
}