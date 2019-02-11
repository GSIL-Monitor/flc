<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="${pageContext.request.contextPath}/static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/css/style.css"/>
    <link href="${pageContext.request.contextPath}/static/admin/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/H-ui.js" type="text/javascript"></script>
    <title>文章管理--文章详情</title>
</head>

<body>
<div class="margin clearfix">
    <div class="article_style">
        <div class="add_content" id="form-article-add">
            <ul>
                <li class="clearfix Mandatory">
                    <label class="label_name"><i>*</i>文章标题:</label>
                    <span class="formControls col-10">${article.articleTitle}</span>
                </li>
                <li class="clearfix">
                    <label class="label_name"><i>*</i>显示状态:</label>
                    <span class="formControls col-10">
                        <c:if test="${article.articleType == 1}">
                            <span class="add_date l_f">显示</span>
                        </c:if>
                        <c:if test="${article.articleType == 2}">
                            <span class="add_date l_f">隐藏</span>
                        </c:if>
                    </span>
                </li>
                <li class="clearfix Mandatory">
                    <label class="label_name"><i>*</i>发布时间:</label>
                    <span class="formControls col-10">${article.articleAddtime}</span>
                </li>
                <li class="clearfix Mandatory">
                    <label class="label_name"><i>*</i>发布人:</label>
                    <span class="formControls col-10">${article.articleAuthor}</span>
                </li>
                <li class="clearfix">
                    <label class="label_name"><i>*</i>文章内容:</label><br>
                    <div id="cartTable" style="border:1px solid #dedbdb;padding:30px;width: 80%;margin-left:90px;">
                        ${article.articleContent}
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>