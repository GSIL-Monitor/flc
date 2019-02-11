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
    <script src="${pageContext.request.contextPath}/static/admin/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>提现/消费/转账记录</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Account_style">
        <!--记录-->
        <div class="recording_style">
            <div id="recording">
                <div class="hd">
                    <ul>
                        <li>用户分红提现记录</li>
                        <li>店铺分红提现记录</li>
                        <li>转账记录</li>
                        <li>分润提现记录</li>
                    </ul>
                </div>
                <div class="bd">
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table1">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">手机</th>
                                    <th width="150">提现金额</th>
                                    <th width="150">提现方式</th>
                                    <th width="150">提现账号</th>
                                    <th width="150">申请时间</th>
                                    <th width="150">同意时间</th>
                                    <th width="150">驳回理由</th>
                                    <th width="150">操作者</th>
                                </tr>
                            </thead>
                            <tbody class="userProfitWithdraw">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>100</td>--%>
                                    <%--<td>支付宝</td>--%>
                                    <%--<td>15000000350</td>--%>
                                    <%--<td>2008-7-23 10:10:10</td>--%>
                                    <%--<td>2008-7-23 12:12:12</td>--%>
                                    <%--<td>admin</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                    </ul>
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table2">
                            <thead>
                                <tr>
                                    <th width="150">商铺名</th>
                                    <th width="150">手机</th>
                                    <th width="150">提现金额</th>
                                    <th width="150">提现方式</th>
                                    <th width="150">提现账号</th>
                                    <th width="150">申请时间</th>
                                    <th width="150">同意时间</th>
                                    <th width="150">驳回理由</th>
                                    <th width="150">操作者</th>
                                </tr>
                            </thead>
                            <tbody class="storeProfitWithdraw">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>100</td>--%>
                                    <%--<td>支付宝</td>--%>
                                    <%--<td>15000000350</td>--%>
                                    <%--<td>2008-7-23 10:10:10</td>--%>
                                    <%--<td>2008-7-23 12:12:12</td>--%>
                                    <%--<td>admin</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                    </ul>
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table3">
                            <thead>
                                <tr>
                                    <th width="150">转账人</th>
                                    <th width="150">金额</th>
                                    <th width="150">转账时间</th>
                                    <th width="150">接收人电话</th>
                                    <th width="150">接收人ID</th>
                                </tr>
                            </thead>
                            <tbody class="transferLog">
                                <%--<tr>--%>
                                    <%--<td>李四</td>--%>
                                    <%--<td>100</td>--%>
                                    <%--<td>2018-07-25</td>--%>
                                    <%--<td>12345679890/12</td>--%>
                                <%--</tr>--%>
                            </tbody>
                        </table>
                    </ul>
                    <ul class="">
                        <table class="table table-striped table-bordered table-hover" id="table4">
                            <thead>
                                <tr>
                                    <th width="150">用户名</th>
                                    <th width="150">手机</th>
                                    <th width="150">提现金额</th>
                                    <th width="150">提现方式</th>
                                    <th width="150">提现账号</th>
                                    <th width="150">申请时间</th>
                                    <th width="150">同意时间</th>
                                    <th width="150">驳回理由</th>
                                    <th width="150">操作者</th>
                                </tr>
                            </thead>
                            <tbody class="shareProfitWithdrawLog">
                                <%--<tr>--%>
                                    <%--<td>李五</td>--%>
                                    <%--<td>16000000000</td>--%>
                                    <%--<td>100</td>--%>
                                    <%--<td>支付宝</td>--%>
                                    <%--<td>15000000350</td>--%>
                                    <%--<td>2008-7-23 10:10:10</td>--%>
                                    <%--<td>2008-7-23 12:12:12</td>--%>
                                    <%--<td>admin</td>--%>
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
    //获取用户分红提现记录（同意以及驳回）
    $.ajax({
        type : 'post',
        url : '${pageContext.request.contextPath}/admin/getUserProfitedWithdrawLogs',
        dataType : 'json',
        success : function (result) {
            var str = "";
            if (result != null && result.length > 0){
                for (var i = 0; i < result.length; i++){
                    str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        str += "<td>"+result[i].userTel+"</td>";
                        str += "<td>"+result[i].withdrawMoney+"</td>";
                        str += "<td>"+result[i].withdrawType+"</td>";
                        str += "<td>"+result[i].withdrawAccount+"</td>";
                        str += "<td>"+result[i].applicationTime+"</td>";
                        str += "<td>"+result[i].withdrawApproveTime+"</td>";
                        if (result[i].withdrawRejectReason != undefined){
                            str += "<td>"+result[i].withdrawRejectReason+"</td>";
                        }else{
                            str += "<td></td>";
                        }
                        str += "<td>"+result[i].withdrawHandlers+"</td>";
                    str += "</tr>";
                }
            }else {
                str += "<tr style='text-align: center;color:#333333;'><td colspan='7'>对不起，没有查询到相关数据！</td></tr>";
            }
            $(".userProfitWithdraw").html(str);
            //分页
            $('#table1').dataTable({
                "bProcessing" : true,//是否显示进度提示
                "aaSorting": [[ 5, "desc" ]],//默认第几个排序
                "aLengthMenu" : [8,15,20],
                "bAutoWidth" : true,
                "aoColumnDefs": [
                    {"orderable":false,"aTargets":[0,1,2,3,4,7]}// 制定列不参与排序
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
            layer.msg('获取用户分红提现记录出错，请稍后再试！', {icon: 2, offset: 't'});
        }
    });

    //获取店铺分红提现记录（同意以及驳回）
    $.ajax({
        type : 'post',
        url : '${pageContext.request.contextPath}/admin/getStoreProfitedWithdrawLogs',
        dataType : 'json',
        success : function (result) {
            var str = "";
            if (result != null && result.length > 0){
                for (var i = 0; i < result.length; i++){
                    str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        str += "<td>"+result[i].userTel+"</td>";
                        str += "<td>"+result[i].withdrawMoney+"</td>";
                        str += "<td>"+result[i].withdrawType+"</td>";
                        str += "<td>"+result[i].withdrawAccount+"</td>";
                        str += "<td>"+result[i].applicationTime+"</td>";
                        str += "<td>"+result[i].withdrawApproveTime+"</td>";
                        if (result[i].withdrawRejectReason != undefined){
                            str += "<td>"+result[i].withdrawRejectReason+"</td>";
                        }else{
                            str += "<td></td>";
                        }
                        str += "<td>"+result[i].withdrawHandlers+"</td>";
                    str += "</tr>";
                }
            }else {
                str += "<tr style='text-align: center;color:#333333;'><td colspan='7'>对不起，没有查询到相关数据！</td></tr>";
            }
            $(".storeProfitWithdraw").html(str);
            //分页
            $('#table2').dataTable({
                "bProcessing" : true,//是否显示进度提示
                "aaSorting": [[ 5, "desc" ]],//默认第几个排序
                "aLengthMenu" : [8,15,20],
                "bAutoWidth" : true,
                "aoColumnDefs": [
                    {"orderable":false,"aTargets":[0,1,2,3,4,7]}// 制定列不参与排序
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
            layer.msg('获取店铺分红提现记录出错，请稍后再试！', {icon: 2, offset: 't'});
        }
    });

    //获取转账记录
    $.ajax({
        type : 'post',
        url : '${pageContext.request.contextPath}/admin/getTransferLogList',
        dataType : 'json',
        success : function (result) {
            var str = "";
            if (result != null && result.length > 0){
                for (var i = 0; i < result.length; i++){
                    str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        str += "<td>"+result[i].transferMoney+"</td>";
                        str += "<td>"+result[i].transferAddtime+"</td>";
                        str += "<td>"+result[i].transferRecevierTel+"</td>";
                        str += "<td>"+result[i].transferReceiverUserid+"</td>";
                    str += "</tr>";
                }
            }else {
                str += "<tr style='text-align: center;color:#333333;'><td colspan='5'>对不起，没有查询到相关数据！</td></tr>";
            }
            $(".transferLog").html(str);
            //分页
            $('#table3').dataTable({
                "bProcessing" : true,//是否显示进度提示
                "aaSorting": [[ 2, "desc" ]],//默认第几个排序
                "aLengthMenu" : [8,15,20],
                "bAutoWidth" : true,
                "aoColumnDefs": [
                    {"orderable":false,"aTargets":[0,1,3,4]}// 制定列不参与排序
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
            layer.msg('获取转账记录出错，请稍后再试！', {icon: 2, offset: 't'});
        }
    });

    //获取分润提现记录
    $.ajax({
        type : 'post',
        url : '${pageContext.request.contextPath}/admin/getShareProfitWithdrawLog',
        dataType : 'json',
        success : function (result) {
            var str = "";
            if (result != null && result.length > 0){
                for (var i = 0; i < result.length; i++){
                    str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        str += "<td>"+result[i].userTel+"</td>";
                        str += "<td>"+result[i].withdrawMoney+"</td>";
                        str += "<td>"+result[i].withdrawType+"</td>";
                        str += "<td>"+result[i].withdrawAccount+"</td>";
                        str += "<td>"+result[i].withdrawAddtime+"</td>";
                        str += "<td>"+result[i].withdrawApproveTime+"</td>";
                        if (result[i].withdrawRejectReason != undefined){
                            str += "<td>"+result[i].withdrawRejectReason+"</td>";
                        }else{
                            str += "<td></td>";
                        }
                        str += "<td>"+result[i].withdrawHandlers+"</td>";
                    str += "</tr>";
                }
            }else {
                str += "<tr style='text-align: center;color:#333333;'><td colspan='7'>对不起，没有查询到相关数据！</td></tr>";
            }
            $(".shareProfitWithdrawLog").html(str);
            //分页
            $('#table4').dataTable({
                "bProcessing" : true,//是否显示进度提示
                "aaSorting": [[ 5, "desc" ]],//默认第几个排序
                "aLengthMenu" : [8,15,20],
                "bAutoWidth" : true,
                "aoColumnDefs": [
                    {"orderable":false,"aTargets":[0,1,2,3,4,7]}// 制定列不参与排序
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
            layer.msg('获取分润提现记录出错，请稍后再试！', {icon: 2, offset: 't'});
        }
    });

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