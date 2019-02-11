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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>财务管理--分红记录</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Account_style">
        <!--记录-->
        <div class="recording_style">
            <div id="recording">
                <div class="hd">
                    <ul>
                        <li>日分红记录</li>
                        <li>周分红记录</li>
                        <li>月分红记录</li>
                        <li>季分红记录</li>
                        <li>年分红记录</li>
                        <li>推荐奖记录</li>
                        <li>杰出贡献奖记录</li>
                    </ul>
                </div>
                <div class="bd">
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table1">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">用户角色</th>
                                    <th width="150">手机</th>
                                    <th width="150">分红金额</th>
                                    <th width="150">分红时间</th>
                                </tr>
                            </thead>
                            <tbody class="dayProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>事业合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>10</td>--%>
                                    <%--<td>2008-7-23</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                    </ul>
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table2">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">用户角色</th>
                                    <th width="150">手机</th>
                                    <th width="150">分红金额</th>
                                    <th width="150">分红时间</th>
                                </tr>
                            </thead>
                            <tbody class="weekProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>事业合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>10</td>--%>
                                    <%--<td>2008-7-23</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                    </ul>
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table3">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">用户角色</th>
                                    <th width="150">手机</th>
                                    <th width="150">分红金额</th>
                                    <th width="150">分红时间</th>
                                </tr>
                            </thead>
                            <tbody class="monthProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>事业合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>10</td>--%>
                                    <%--<td>2008-7-23</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                    </ul>
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table4">
                            <thead>
                            <tr>
                                <th width="150">用户名</th>
                                <th width="150">用户角色</th>
                                <th width="150">手机</th>
                                <th width="150">分红金额</th>
                                <th width="150">分红时间</th>
                            </tr>
                            </thead>
                            <tbody class="quarterProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>高级合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>100</td>--%>
                                    <%--<td>2008-7-23</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                    </ul>
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table5">
                            <thead>
                            <tr>
                                <th width="150">用户名</th>
                                <th width="150">用户角色</th>
                                <th width="150">手机</th>
                                <th width="150">分红金额</th>
                                <th width="150">分红时间</th>
                            </tr>
                            </thead>
                            <tbody class="yearProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>高级合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>100</td>--%>
                                    <%--<td>2008-7-23</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                    </ul>
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table6">
                            <thead>
                            <tr>
                                <th width="150">用户名</th>
                                <th width="150">用户角色</th>
                                <th width="150">手机</th>
                                <th width="150">分红金额</th>
                                <th width="150">分红时间</th>
                            </tr>
                            </thead>
                            <tbody class="shareProfit">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>高级合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>100</td>--%>
                                    <%--<td>2008-7-23</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                    </ul>
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table7">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">用户角色</th>
                                    <th width="150">手机</th>
                                    <th width="150">分红金额</th>
                                    <th width="150">分红时间</th>
                                </tr>
                            </thead>
                            <tbody class="outstandingContribution">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>高级合伙人</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>100</td>--%>
                                    <%--<td>2008-7-23</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                    </ul>
                </div>
            </div>
        </div>
        <script type="text/javascript">jQuery("#recording").slide({trigger: "click"});</script>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function ($) {
        // <li>推荐奖记录</li>
        // <li>特殊奖记录</li>
        /**********************日分红记录*************************/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getShareProfitSourceLogByType',
            dataType : 'json',
            data : {
                type : 1
            },
            success : function (result) {
                var str = "";
                if (result != null && result.length > 0){
                    for (var i = 0; i < result.length; i++){
                        str += "<tr>";
                            str += "<td>"+result[i].userNick+"</td>";
                            if (result[i].userRole == 1){
                                str += "<td>消费者</td>";
                            }
                            if (result[i].userRole == 2){
                                str += "<td>事业合伙人</td>";
                            }if (result[i].userRole == 3){
                                str += "<td>高级合伙人</td>";
                            }if (result[i].userRole == 4){
                                str += "<td>创始合伙人</td>";
                            }
                            str += "<td>"+result[i].userTel+"</td>";
                            str += "<td>"+result[i].money+"</td>";
                            str += "<td>"+result[i].addtime+"</td>";
                        str += "</tr>";
                    }
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='5'>对不起，没有查询到相关数据！</td></tr>";
                }
                $(".dayProfit").html(str);
                $('#table1').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 4, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,3]}// 制定列不参与排序
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
            },
            error : function () {
                layer.msg('获取日分红出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });

        /**********************周分红记录*************************/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getShareProfitSourceLogByType',
            dataType : 'json',
            data : {
                type : 2
            },
            success : function (result) {
                var str = "";
                if (result != null && result.length > 0){
                    for (var i = 0; i < result.length; i++){
                        str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        if (result[i].userRole == 1){
                            str += "<td>消费者</td>";
                        }
                        if (result[i].userRole == 2){
                            str += "<td>事业合伙人</td>";
                        }if (result[i].userRole == 3){
                            str += "<td>高级合伙人</td>";
                        }if (result[i].userRole == 4){
                            str += "<td>创始合伙人</td>";
                        }
                        str += "<td>"+result[i].userTel+"</td>";
                        str += "<td>"+result[i].money+"</td>";
                        str += "<td>"+result[i].addtime+"</td>";
                        str += "</tr>";
                    }
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='5'>对不起，没有查询到相关数据！</td></tr>";
                }
                $(".weekProfit").html(str);
                $('#table2').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 4, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,3]}// 制定列不参与排序
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
            },
            error : function () {
                layer.msg('获取周分红出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });

        /**********************月分红记录*************************/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getShareProfitSourceLogByType',
            dataType : 'json',
            data : {
                type : 3
            },
            success : function (result) {
                var str = "";
                if (result != null && result.length > 0){
                    for (var i = 0; i < result.length; i++){
                        str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        if (result[i].userRole == 1){
                            str += "<td>消费者</td>";
                        }
                        if (result[i].userRole == 2){
                            str += "<td>事业合伙人</td>";
                        }if (result[i].userRole == 3){
                            str += "<td>高级合伙人</td>";
                        }if (result[i].userRole == 4){
                            str += "<td>创始合伙人</td>";
                        }
                        str += "<td>"+result[i].userTel+"</td>";
                        str += "<td>"+result[i].money+"</td>";
                        str += "<td>"+result[i].addtime+"</td>";
                        str += "</tr>";
                    }
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='5'>对不起，没有查询到相关数据！</td></tr>";
                }
                $(".monthProfit").html(str);
                $('#table3').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 4, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,3]}// 制定列不参与排序
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
            },
            error : function () {
                layer.msg('获取月分红出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });

        /**********************季度分红记录*************************/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getShareProfitSourceLogByType',
            dataType : 'json',
            data : {
                type : 4
            },
            success : function (result) {
                var str = "";
                if (result != null && result.length > 0){
                    for (var i = 0; i < result.length; i++){
                        str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        if (result[i].userRole == 1){
                            str += "<td>消费者</td>";
                        }
                        if (result[i].userRole == 2){
                            str += "<td>事业合伙人</td>";
                        }if (result[i].userRole == 3){
                            str += "<td>高级合伙人</td>";
                        }if (result[i].userRole == 4){
                            str += "<td>创始合伙人</td>";
                        }
                        str += "<td>"+result[i].userTel+"</td>";
                        str += "<td>"+result[i].money+"</td>";
                        str += "<td>"+result[i].addtime+"</td>";
                        str += "</tr>";
                    }
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='5'>对不起，没有查询到相关数据！</td></tr>";
                }
                $(".quarterProfit").html(str);
                $('#table4').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 4, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,3]}// 制定列不参与排序
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
            },
            error : function () {
                layer.msg('获取季度红出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });

        /**********************年度分红记录*************************/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getShareProfitSourceLogByType',
            dataType : 'json',
            data : {
                type : 5
            },
            success : function (result) {
                var str = "";
                if (result != null && result.length > 0){
                    for (var i = 0; i < result.length; i++){
                        str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        if (result[i].userRole == 1){
                            str += "<td>消费者</td>";
                        }
                        if (result[i].userRole == 2){
                            str += "<td>事业合伙人</td>";
                        }if (result[i].userRole == 3){
                            str += "<td>高级合伙人</td>";
                        }if (result[i].userRole == 4){
                            str += "<td>创始合伙人</td>";
                        }
                        str += "<td>"+result[i].userTel+"</td>";
                        str += "<td>"+result[i].money+"</td>";
                        str += "<td>"+result[i].addtime+"</td>";
                        str += "</tr>";
                    }
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='5'>对不起，没有查询到相关数据！</td></tr>";
                }
                $(".yearProfit").html(str);
                $('#table5').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 4, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,3]}// 制定列不参与排序
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
            },
            error : function () {
                layer.msg('获取年红出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });

        /**********************推荐奖记录*************************/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getShareProfitSourceLogByType',
            dataType : 'json',
            data : {
                type : 6
            },
            success : function (result) {
                var str = "";
                if (result != null && result.length > 0){
                    for (var i = 0; i < result.length; i++){
                        str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        if (result[i].userRole == 1){
                            str += "<td>消费者</td>";
                        }
                        if (result[i].userRole == 2){
                            str += "<td>事业合伙人</td>";
                        }if (result[i].userRole == 3){
                            str += "<td>高级合伙人</td>";
                        }if (result[i].userRole == 4){
                            str += "<td>创始合伙人</td>";
                        }
                        str += "<td>"+result[i].userTel+"</td>";
                        str += "<td>"+result[i].money+"</td>";
                        str += "<td>"+result[i].addtime+"</td>";
                        str += "</tr>";
                    }
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='5'>对不起，没有查询到相关数据！</td></tr>";
                }
                $(".shareProfit").html(str);
                $('#table6').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 4, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,3]}// 制定列不参与排序
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
            },
            error : function () {
                layer.msg('获取推荐奖记录出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });

        /**********************特殊奖记录*************************/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getShareProfitSourceLogByType',
            dataType : 'json',
            data : {
                type : 7
            },
            success : function (result) {
                var str = "";
                if (result != null && result.length > 0){
                    for (var i = 0; i < result.length; i++){
                        str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        if (result[i].userRole == 1){
                            str += "<td>消费者</td>";
                        }
                        if (result[i].userRole == 2){
                            str += "<td>事业合伙人</td>";
                        }if (result[i].userRole == 3){
                            str += "<td>高级合伙人</td>";
                        }if (result[i].userRole == 4){
                            str += "<td>创始合伙人</td>";
                        }
                        str += "<td>"+result[i].userTel+"</td>";
                        str += "<td>"+result[i].money+"</td>";
                        str += "<td>"+result[i].addtime+"</td>";
                        str += "</tr>";
                    }
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='5'>对不起，没有查询到相关数据！</td></tr>";
                }
                $(".outstandingContribution").html(str);
                $('#table7').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 4, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,3]}// 制定列不参与排序
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
            },
            error : function () {
                layer.msg('获取特殊奖记录出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    })

    jQuery(function ($) {
        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox').each(function () {
                this.checked = that.checked;
                $(this).closest('tr').toggleClass('selected');
            });
        });
    });
</script>