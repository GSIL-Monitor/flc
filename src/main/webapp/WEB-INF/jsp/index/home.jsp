<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/font-awesome.min.css"/>
    <link href="<%=basePath%>static/admin/assets/css/codemirror.css" rel="stylesheet">
    <!--[if IE 7]>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="<%=basePath%>static/admin/assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="<%=basePath%>static/admin/assets/js/html5shiv.js"></script>
    <script src="<%=basePath%>static/admin/assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="<%=basePath%>static/admin/assets/js/jquery.min.js"></script>
    <!-- <![endif]-->
    <script src="<%=basePath%>static/admin/assets/dist/echarts.js"></script>
    <script src="<%=basePath%>static/admin/assets/js/bootstrap.min.js"></script>
    <title>系统首页</title>
</head>
<body>
<div class="page-content clearfix">
    <div class="alert alert-block alert-success">
        <button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>
        <i class="icon-ok green"></i>欢迎使用<strong class="green">四叶草幸福商城后台管理系统
        <small>(v1.0)</small>
    </strong>,您本次登录时间为${admin.adminLastLoginTime}，登录IP:${admin.adminLoginIP}.
    </div>
    <div class="state-overview clearfix">
        <div class="col-lg-3 col-sm-6">
            <section class="panel">
                <div class="symbol terques">
                    <i class="icon-user"></i>
                </div>
                <div class="value">
                    <h1>${userCount}</h1>
                    <p>商城用户</p>
                </div>
            </section>
        </div>
        <div class="col-lg-3 col-sm-6">
            <section class="panel">
                <div class="symbol red">
                    <i class="icon-group"></i>
                </div>
                <div class="value">
                    <h1>${storeCount}</h1>
                    <p>商城商铺</p>
                </div>
            </section>
        </div>
        <div class="col-lg-3 col-sm-6">
            <section class="panel">
                <div class="symbol yellow">
                    <i class="icon-shopping-cart"></i>
                </div>
                <div class="value">
                    <h1>${orderCount}</h1>
                    <p>商城订单</p>
                </div>
            </section>
        </div>
        <div class="col-lg-3 col-sm-6">
            <section class="panel">
                <div class="symbol blue">
                    <i class="icon-bar-chart"></i>
                </div>
                <div class="value">
                    <h1>￥${sumMoneyByOrderStatus}</h1>
                    <p>交易总额</p>
                </div>
            </section>
        </div>
    </div>
    <!--实时交易记录-->
    <div class="clearfix">
        <div class="Order_Statistics ">
            <div class="title_name">订单统计信息</div>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="name">待结算订单：</td>
                    <td class="munber"><a href="#">${daijisuanOrderCount}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">待发货订单：</td>
                    <td class="munber"><a href="#">${daifahuoOrderCount}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">已成交订单数：</td>
                    <td class="munber"><a href="#">${finishedOrderCount}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">交易失败：</td>
                    <td class="munber"><a href="#">${failedOrderCount}</a>&nbsp;个</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="Order_Statistics">
            <div class="title_name">商品统计信息</div>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="name">商品总数：</td>
                    <td class="munber"><a href="#">${goodsListSize}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">上架商品：</td>
                    <td class="munber"><a href="#">${goodsByStatusMarketingSize}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">下架商品：</td>
                    <td class="munber"><a href="#">${goodsByStatusWeiguiSize}</a>&nbsp;个</td>
                </tr>
                <tr>
                    <td class="name">商品评论：</td>
                    <td class="munber"><a href="#">${evaluteCount}</a>&nbsp;条</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="Order_Statistics">
            <div class="title_name">合伙人信息统计</div>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="name">消费者：</td>
                    <td class="munber"><a href="#">${user1}</a>&nbsp;人</td>
                </tr>
                <tr>
                    <td class="name">事业合伙人：</td>
                    <td class="munber"><a href="#">${user2}</a>&nbsp;人</td>
                </tr>
                <tr>
                    <td class="name">高级合伙人：</td>
                    <td class="munber"><a href="#">${user3}</a>&nbsp;人</td>
                </tr>
                <tr>
                    <td class="name">创始合伙人：</td>
                    <td class="munber"><a href="#">${user4}</a>&nbsp;人</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="news_style">
            <div class="title_name">最新文章</div>
            <ul class="list" style="line-height: 32px;">
                <c:forEach var="article" items="${allArticles}" begin="1" end="5">
                    <li><i class="icon-bell red"></i><a href="#">${fn:substring(article.articleTitle, 0, 15)}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!--记录-->
    <div class="clearfix">
        <div class="home_btn">
            <div>
                <a href="${pageContext.request.contextPath}/classify/getClassifyListByLevelOne" title="产品分类" class="btn  btn-primary btn-sm no-radius">
                    <i class="bigger-200"><img src="<%=basePath%>static/admin/images/icon-cpgl.png"/></i>
                    <h5 class="margin-top">产品分类</h5>
                </a>
                <a href="${pageContext.request.contextPath}/admin/go_admin_info" title="个人信息" class="btn  btn-success btn-sm no-radius">
                    <i class="bigger-200"><img src="<%=basePath%>static/admin/images/icon-grxx.png"/></i>
                    <h5 class="margin-top">个人信息</h5>
                </a>
                <a href="${pageContext.request.contextPath}/admin/go_systems" title="系统设置" class="btn  btn-info btn-sm no-radius">
                    <i class="bigger-200"><img src="<%=basePath%>static/admin/images/xtsz.png"/></i>
                    <h5 class="margin-top">系统设置</h5>
                </a>
                <a href="${pageContext.request.contextPath}/admin/go_orderform" title="商品订单" class="btn  btn-purple btn-sm no-radius">
                    <i class="bigger-200"><img src="<%=basePath%>static/admin/images/icon-gwcc.png"/></i>
                    <h5 class="margin-top">商品订单</h5>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $('.no-radius').on('click', function () {
        var cname = $(this).attr("title");
        var chref = $(this).attr("href");
        var cnames = parent.$('.Current_page').html();
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe').html(cname);
        parent.$('#iframe').attr("src", chref).ready();
        parent.$('#parentIframe').css("display", "inline-block");
        parent.$('.Current_page').attr({"name": herf, "href": "javascript:void(0)"}).css({
            "color": "#4c8fbd",
            "cursor": "pointer"
        });
        parent.layer.close(index);
    });
    $(document).ready(function () {
        $(".t_Record").width($(window).width() - 640);
        //当文档窗口发生改变时 触发
        $(window).resize(function () {
            $(".t_Record").width($(window).width() - 640);
        });
    });
</script>