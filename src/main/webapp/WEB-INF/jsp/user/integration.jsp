<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <!--[if lte IE 8]><![endif]-->
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace-ie.min.css"/>
    <%--<script src="<%=basePath%>static/admin/js/jquery-1.9.1.min.js"></script>--%>
    <script type="text/javascript" src="<%=basePath%>static/admin/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>static/admin/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>static/admin/assets/js/typeahead-bs2.min.js"></script>
    <script src="<%=basePath%>static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/js/tools.js" type="text/javascript"></script>
    <title>合伙人管理--分销商管理</title>
</head>

<body>
<div class="margin clearfix">
    <div class="" id="Other_Management">
        <div class="search_style">
            <ul class="search_content clearfix">
                <li>
                    <label class="l_f">合伙人分享ID</label>
                    <input name="" type="text" class="userShareid" placeholder="输入合伙人分享ID" style="width:400px">
                </li>
                <li style="width:90px;">
                    <button type="button" class="btn_search"><i class="fa fa-search"></i>查询</button>
                </li>
            </ul>
        </div>
        <div class="list_style">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                    <tr>
                        <th width="80">分享ID</th>
                        <th width="100">用户名</th>
                        <th width="80">积分</th>
                        <th width="80">合伙人角色</th>
                        <th width="80">分销合伙人角色</th>
                        <th width="120">加入时间</th>
                        <th width="120">状态</th>
                    </tr>
                </thead>
                <tbody class="integration">
                    <tr style='text-align: center;color:#333333;'><td colspan="7">请输入要查询用户的分享ID！</td></tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $(".btn_search").click(function () {
            var userShareid = $(".userShareid").val();
            if(!isEmpty(userShareid)){
                $.ajax({
                    type : 'post',
                    url : '${pageContext.request.contextPath}/admin/getDownLevelUser',
                    data : {
                        userShareid : userShareid
                    },
                    dataType : 'json',
                    success : function (result) {
                        var oneLevel = result.userList1;
                        var twoLevel = result.userList2;
                        if(isEmpty(oneLevel) && isEmpty(twoLevel)){
                            $(".integration").html("<tr style='text-align: center;color:#333333;'><td colspan='7'>对不起，没有查询到相关数据！</td></tr>");
                            layer.msg('对不起，没有查询到相关数据！', {icon: 5, offset: 't'});
                        }else {
                            var str = "";
                            if (!isEmpty(oneLevel) && oneLevel.length > 0){
                                for (var i = 0; i < oneLevel.length; i++) {
                                    str += "<tr>";
                                        str += "<td>" + oneLevel[i].userShareid + "</td>";
                                        str += "<td>" + oneLevel[i].userNick +"</td>";
                                        str += "<td>" + oneLevel[i].userPersonalIntegral + oneLevel[i].userDistributionIntegral + "</td>";
                                        if (oneLevel[i].userRole == 1){
                                            str += "<td>消费者</td>";
                                        }
                                        if (oneLevel[i].userRole == 2){
                                            str += "<td>事业合伙人</td>";
                                        }
                                        if (oneLevel[i].userRole == 3){
                                            str += "<td>高级合伙人</td>";
                                        }
                                        if (oneLevel[i].userRole == 4){
                                            str += "<td>创始合伙人</td>";
                                        }
                                        str += "<td>朋友</td>";
                                        str += "<td>" + oneLevel[i].userAddtime + "</td>";
                                        if (oneLevel[i].userStatus == 1){
                                            str += "<td class='td-status'><span class='label label-success radius'>已启用</span></td>";
                                        }
                                        if (oneLevel[i].userStatus == 2){
                                            str += "<td class='td-status'><span class='label radius'>已禁用</span></td>";
                                        }
                                    str += "</tr>";
                                }
                            }
                            if (!isEmpty(twoLevel) && twoLevel.length > 0) {
                                for (var i = 0; i < twoLevel.length; i++) {
                                    str += "<tr>";
                                        str += "<td>" + twoLevel[i].userShareid + "</td>";
                                        str += "<td>" + twoLevel[i].userNick +"</td>";
                                        str += "<td>" + twoLevel[i].userPersonalIntegral + twoLevel[i].userDistributionIntegral + "</td>";
                                        if (twoLevel[i].userRole == 1){
                                            str += "<td>消费者</td>";
                                        }
                                        if (twoLevel[i].userRole == 2){
                                            str += "<td>事业合伙人</td>";
                                        }
                                        if (twoLevel[i].userRole == 3){
                                            str += "<td>高级合伙人</td>";
                                        }
                                        if (twoLevel[i].userRole == 4){
                                            str += "<td>创始合伙人</td>";
                                        }
                                        str += "<td>熟人</td>";
                                        str += "<td>" + twoLevel[i].userAddtime + "</td>";
                                        if (twoLevel[i].userStatus == 1){
                                            str += "<td class='td-status'><span class='label label-success radius'>已启用</span></td>";
                                        }
                                        if (twoLevel[i].userStatus == 2){
                                            str += "<td class='td-status'><span class='label radius'>已禁用</span></td>";
                                        }
                                    str += "</tr>";
                                }
                            }
                            $(".integration").html(str);
                        }
                    },
                    error : function () {
                        layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                    }
                });
            } else {
                layer.msg("请输入要查询用户的分享ID", {icon: 7, time: 1000});
            }
        });
    });
</script>
</html>
