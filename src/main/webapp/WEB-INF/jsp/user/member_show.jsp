<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/codemirror.css">
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/font-awesome.min.css"/>
    <script src="<%=basePath%>static/admin/assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>static/admin/js/tools.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/admin/assets/layer/layer.js"></script>
    <title>用户查看</title>
</head>
<body>
    <div class="member_show">
        <div class="member_jbxx clearfix">
            <img class="img" src="<%=basePath%>static/admin/images/user.png">
            <dl class="right_xxln">
                <dt><span class="userNick" style="font-size: 2.5em;"></span></dt>
            </dl>
        </div>
        <div class="member_content">
            <ul>
                <li><label class="label_name">手机：</label><span class="name userTel"></span></li>
                <li><label class="label_name">注册时间：</label><span class="name userAddtime"></span></li>
                <li><label class="label_name">分红：</label><span class="name userProfitAccount"></span></li>
                <li><label class="label_name">积分：</label><span class="name integral"></span></li>
                <li><label class="label_name">合伙人角色：</label><span class="name userRole"></span></li>
            </ul>
        </div>
    </div>
</body>
<script>
    var id = GetUrlParam("id");
    $(document).ready(function () {
        if (!isEmpty(id)){
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/getUserMSGByUserId',
                data : {
                    id : id
                },
                dataType : 'json',
                success : function (result) {
                    if (result) {
                        if(!isEmpty(result)){
                            $(".userNick").html(result.userNick);
                            $(".userTel").html(result.userTel);
                            $(".userAddtime").html(result.userAddtime);
                            $(".userProfitAccount").html(result.userProfitAccount);
                            $(".integral").html(result.userPersonalIntegral + result.userDistributionIntegral);
                            if (result.userRole == 1){
                                $(".userRole").html("消费者");
                            }
                            if (result.userRole == 2){
                                $(".userRole").html("事业合伙人");
                            }
                            if (result.userRole == 3){
                                $(".userRole").html("高级合伙人");
                            }
                            if (result.userRole == 4){
                                $(".userRole").html("创始合伙人");
                            }
                        }else{
                            layer.msg('获取的数据为空！', {icon: 5, offset: 't'});
                        }
                    }
                },
                error : function () {
                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        } else{
            layer.msg('获取参数失败，请稍后再试！', {icon: 5, offset: 't'});
        }
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