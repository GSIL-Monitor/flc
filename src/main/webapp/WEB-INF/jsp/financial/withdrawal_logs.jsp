<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/displayPart.js" type="text/javascript"></script>
    <title>财务管理--提现记录</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Shops_Audit">
        <!--申请列表-->
        <div class="audit_list">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                <tr>
                    <th width="150">用户名</th>
                    <th width="150">手机</th>
                    <th width="150">提现金额</th>
                    <th width="150">提现方式</th>
                    <th width="150">提现账号</th>
                    <th width="150">申请时间</th>
                    <th width="150">同意时间</th>
                    <th width="150">操作者</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>李五</td>
                        <td>16000000000</td>
                        <td>100</td>
                        <td>支付宝</td>
                        <td>15000000350</td>
                        <td>2008-7-23 10:10:10</td>
                        <td>2008-7-23 12:12:12</td>
                        <td>admin</td>
                    </tr>
                    <tr>
                        <td>李五</td>
                        <td>16000000000</td>
                        <td>100</td>
                        <td>银行卡</td>
                        <td>6217993000025829587</td>
                        <td>2008-7-23 10:10:10</td>
                        <td>2008-7-23 12:12:12</td>
                        <td>admin</td>
                    </tr>
                </tbody>
            </table>
            <ul class="pager" style="text-align:right;color:#7c7c7c;">
                <li>共1234条记录，当前页1/5&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li><a href="#" style="color:#7c7c7c;">首页</a></li>
                <li><a href="#" style="color:#7c7c7c;">&laquo;</a></li>
                <li><a href="#" style="color:#7c7c7c;">1</a></li>
                <li><a href="#" style="color:#7c7c7c;">2</a></li>
                <li><a href="#" style="color:#7c7c7c;">3</a></li>
                <li><a href="#" style="color:#7c7c7c;">4</a></li>
                <li><a href="#" style="color:#7c7c7c;">5</a></li>
                <li><a href="#" style="color:#7c7c7c;">&raquo;</a></li>
                <li><a href="#" style="color:#7c7c7c;">末页</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
