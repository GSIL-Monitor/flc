<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="${pageContext.request.contextPath}/static/admin/images/log.png" />
    <link href="<%=basePath%>static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/css/jquery.idcode.css"/>
    <script src="<%=basePath%>static/admin/assets/js/ace-extra.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/js/jquery.idcode.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/js/tools.js" type="text/javascript"></script>
    <script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <title>登录</title>
</head>
<body class="login-layout Reg_log_style">
<div class="logintop">
    <span>欢迎访问后台管理界面平台</span>
    <ul>
        <li><a href="http://47.92.203.99/index.php?s=/home/index/index">商城首页</a></li>
        <%--<li><a href="#">关于</a></li>--%>
    </ul>
</div>
<div class="loginbody">
    <div class="login-container">
        <div class="center">
            <img src="<%=basePath%>/static/admin/images/logo.png" alt=""/>
        </div>
        <h3 style="color:#cc0000;">${msg}</h3>
        <div class="space-6"></div>
        <div class="position-relative">
            <div id="login-box" class="login-box widget-box no-border visible">
                <div class="widget-body">
                    <div class="widget-main">
                        <h4 class="header blue lighter bigger">
                            <span class="icon-coffee green" style="font-style: italic;"></span>
                            管理员登录
                        </h4>
                        <div class="login_icon"><img src="<%=basePath%>/static/admin/images/login.png" alt=""/></div>
                        <form class="" action="">
                            <fieldset>
                                <ul>
                                    <li class="frame_style form_error">
                                        <label class="user_icon"></label>
                                        <input name="adminNickName" type="text" id="adminNickName" placeholder="用户名"/>
                                    </li>
                                    <li class="frame_style form_error">
                                        <label class="password_icon"></label>
                                        <input name="adminPassword" type="password" id="adminPassword" placeholder="密码"/>
                                    </li>
                                    <li class="frame_style form_error">
                                        <label class="Codes_icon lblVerification"></label>
                                        <input type="text" id="Txtidcode" class="txtVerification" placeholder="验证码"
                                               style="width: 160px;"/>
                                        <div class="Codes_region" id="idcode"></div>
                                    </li>
                                </ul>
                                <div class="space"></div>
                                <div class="clearfix">
                                    <button type="button" class="width-35 pull-right btn btn-sm btn-primary"
                                            id="login_btn" style="margin-right: 50%;">
                                        <em class="icon-key"></em>
                                        登录
                                    </button>
                                </div>
                                <div class="space-4"></div>
                            </fieldset>
                        </form>
                    </div>
                    <div class="toolbar clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //图片验证码
    $.idcode.setCode();

    //点击登录按钮
    $('#login_btn').on('click', function () {
        admin_login();
    });

    //键盘点击enter
    $(document).keyup(function(event){
        if(event.keyCode ==13){
            admin_login();
        }
    });

    //执行登录操作
    function admin_login(){
        var adminNickName = $("#adminNickName").val();
        var adminPassword = $("#adminPassword").val();
        var txtidcode = $("#Txtidcode").val();
        var _txtidcode = $.idcode.getCode().toLowerCase();
        // alert(returnCitySN);
        var adminLoginIP = returnCitySN["cip"];
        if (!isEmpty(adminNickName)){
            if (!isEmpty(adminPassword)){
                if (!isEmpty(txtidcode)){
                    //判断输入的验证码与图片显示的是否一致
                    if (txtidcode.toLowerCase() === _txtidcode){
                        $.ajax({
                            type : 'post',
                            url : '${pageContext.request.contextPath}/admin/admin_login',
                            data : {
                                adminNickName : adminNickName,
                                adminPassword : adminPassword,
                                adminLoginIP : adminLoginIP
                            },
                            dataType : 'json',
                            success : function (result) {
                                if(result){
                                    layer.msg("登录成功", {icon: 1, offset: 't'});
                                    window.location.href = "${pageContext.request.contextPath}/admin/index";
                                }else {
                                    layer.msg("用户名或密码出错", {icon: 3, offset: 't'});
                                }
                            },
                            error : function () {
                                layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                            }
                        });

                    } else{
                        layer.msg('验证码输入不正确！', {icon: 2, offset: 't'});
                    }
                } else{
                    layer.msg('验证码不能为空！', {icon: 2, offset: 't'});
                }
            } else{
                layer.msg('密码不能为空！', {icon: 2, offset: 't'});
            }
        } else{
            layer.msg('用户名不能为空！', {icon: 2, offset: 't'});
        }
    }
</script>