<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="<%=basePath%>static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/css/style.css"/>
    <link href="<%=basePath%>static/admin/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/font/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/Widget/dataTables/jquery.dataTables.min.css"/>
    <!--[if lte IE 8]><![endif]-->
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace-ie.min.css"/>
    <script src="<%=basePath%>static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/js/tools.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>

    <title>合伙人管理--分红来源记录</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Shops_Audit">
        <!--申请列表-->
        <div class="audit_list">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                <tr>
                    <th width="150">发放时间</th>
                    <th width="150">发放金额</th>
                    <th width="150">分红类型</th>
                    <th width="150">操作者</th>
                </tr>
                </thead>
                <tbody class="shareProfitLog">
                    <%--<tr>--%>
                        <%--<td>李五</td>--%>
                        <%--<td>16000000000</td>--%>
                        <%--<td>100</td>--%>
                        <%--<td>支付宝</td>--%>
                    <%--</tr>--%>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        var id = GetUrlParam("id");
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getProfitLog',
            data : {
                id : id
            },
            dataType : 'json',
            success : function (result) {
                if (!isEmpty(result) && result.length > 0){
                    var str = "";
                    for (var i = 0; i < result.length; i++){
                        str += "<tr>";
                            str += "<td>"+result[i].addtime+"</td>";
                            str += "<td>"+result[i].money+"</td>";
                            if(result[i].type == 1){
                                str += "<td>日分红</td>";
                            }
                            if(result[i].type == 2){
                                str += "<td>周分红</td>";
                            }
                            if(result[i].type == 3){
                                str += "<td>月分红</td>";
                            }
                            if(result[i].type == 4){
                                str += "<td>季度分红</td>";
                            }
                            if(result[i].type == 5){
                                str += "<td>年分红</td>";
                            }
                            if(result[i].type == 6){
                                str += "<td>分润</td>";
                            }
                            if(result[i].type == 7){
                                str += "<td>杰出贡献</td>";
                            }
                            if(result[i].type == 8){
                                str += "<td>平台发放分红</td>";
                            }
                            str += "<td>"+result[i].handlers+"</td>";
                        str += "</tr>";
                    }
                    $(".shareProfitLog").html(str);
                    //分页
                    $('#sample-table').dataTable({
                        "bProcessing" : true,//是否显示进度提示
                        "aaSorting": [[ 0, "desc" ]],//默认第几个排序
                        "aLengthMenu" : [8,15,20],
                        "bAutoWidth" : true,
                        "aoColumnDefs": [
                            {"orderable":false,"aTargets":[1,2,3]}// 制定列不参与排序
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
                }else{
                    $("#sample-table").html("<tr style='text-align: center;color:#333333;'><td>对不起，没有查询到相关数据！</td></tr>");
                    layer.msg('对不起，没有查询到相关数据！', {icon: 5, offset: 't'});
                }
            },
            error : function () {
                layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    });
    //获取URL链接中指定参数
    function GetUrlParam(paraName) {
        var url = document.location.toString();
        var arrObj = url.split("?");
        if (arrObj.length > 1) {
            var arrPara = arrObj[1].split("&");
            var arr;
            for (var i = 0; i < arrPara.length; i++) {
                arr = arrPara[i].split("=");
                if (arr != null && arr[0] == paraName) {
                    return arr[1];
                }
            }
            return "";
        }
        else {
            return "";
        }
    }
</script>
</html>
