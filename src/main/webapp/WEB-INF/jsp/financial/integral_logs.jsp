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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/font/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>财务管理--积分记录</title>
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
                        <th width="150">积分来源</th>
                        <th width="150">积分</th>
                        <th width="150">到账时间</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${empty checkIntegralSourceLogs}">
                        <tr style='text-align: center;color:#333333;'><td colspan="5">对不起，没有查询到相关数据！</td></tr>
                    </c:if>
                    <c:if test="${not empty checkIntegralSourceLogs}">
                        <c:forEach var="checkIntegralSourceLog" items="${checkIntegralSourceLogs}">
                            <tr>
                                <td>${checkIntegralSourceLog.userNick}</td>
                                <td>${checkIntegralSourceLog.userTel}</td>
                                <c:if test="${checkIntegralSourceLog.integralType == 1}">
                                    <td>购物</td>
                                </c:if>
                                <c:if test="${checkIntegralSourceLog.integralType == 2}">
                                    <td>平台充值</td>
                                </c:if>
                                <c:if test="${checkIntegralSourceLog.integralType == 3}">
                                    <td>分销</td>
                                </c:if>
                                <td>${checkIntegralSourceLog.integralCount}</td>
                                <td>${checkIntegralSourceLog.integralAddtime}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    //分页
    $('#sample-table').dataTable({
        "bProcessing" : true,//是否显示进度提示
        "aaSorting": [[ 4, "desc" ]],//默认第几个排序
        "aLengthMenu" : [20,50,100],
        "bAutoWidth" : true,
        "aoColumnDefs": [
            {"orderable":false,"aTargets":[0,1,3]}// 制定列不参与排序
        ],
        "oLanguage" : {
            "sProcessing" : "正在获取数据，请稍后...",
            "sLengthMenu" : "每页 _MENU_ 条记录",
            "sZeroRecords" : "对不起，没有您要搜索的内容",
            "sInfo" : "从_START_到_END_条 总记录_TOTAL_条 第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
            "sInfoEmpty" : "无记录",
            "sInfoFiltered" : "(全部记录数 _MAX_ 条)",
            "sInfoPostFix" : "",
            "sSearch" : "搜索",
            "sUrl" : "",
            "oPaginate" :{
                "sFirst" : "首页",
                "sPrevious" : "上一页",
                "sNext" : "下一页",
                "sLast" : "末页"
            }
        }
    });
</script>
</html>