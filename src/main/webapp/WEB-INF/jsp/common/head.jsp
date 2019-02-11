<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <title>顶部通用页面</title>
</head>
<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <img src="${pageContext.request.contextPath}/static/admin/images/log.png" width="250" height="75" alt="">
                </small>
            </a>
        </div>
        <div class="navbar-header operating pull-left"></div>
        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <span class="time"><em id="time"></em></span><span class="user-info"><small>欢迎光临,</small>${admin.adminNickName}</span>
                        <em class="icon-caret-down"></em>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_systems" title="网站设置" class="iframeurl">
                                <em class="icon-cog"></em>网站设置
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" name="${pageContext.request.contextPath}/admin/go_admin_info" title="个人信息" class="iframeurl">
                                <em class="icon-user"></em>个人资料
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" title="修改密码" class="change_Password">
                                <em class="icon-cog"></em>修改密码
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0);" id="Exit_system"><em class="icon-off"></em>退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<!--修改密码样式-->
<div class="change_Pass_style" id="change_Pass">
    <ul class="xg_style">
        <li>
            <label class="label_name" for="password">原&nbsp;&nbsp;密&nbsp;码</label>
            <input name="原密码" type="password" class="" id="password">
        </li>
        <li>
            <label class="label_name" for="Nes_pas">新&nbsp;&nbsp;密&nbsp;码</label>
            <input name="新密码" type="password" class="" id="Nes_pas">
        </li>
        <li>
            <label class="label_name" for="c_mew_pas">确认密码</label>
            <input name="再次确认密码" type="password" class="" id="c_mew_pas">
        </li>
    </ul>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        //时间设置
        function currentTime() {
            var d = new Date(), str = '';
            str += d.getFullYear() + '年';
            str += d.getMonth() + 1 + '月';
            str += d.getDate() + '日';
            str += d.getHours() + '时';
            str += d.getMinutes() + '分';
            str += d.getSeconds() + '秒';
            return str;
        }
        setInterval(function () {
            $('#time').html(currentTime)
        }, 1000);
        //修改密码
        $('.change_Password').on('click', function () {
            layer.open({
                type: 1,
                title: '修改密码',
                area: ['300px', '300px'],
                shadeClose: true,
                content: $('#change_Pass'),
                btn: ['确认修改'],
                yes: function (index, layero) {
                    if ($("#password").val() == "") {
                        layer.alert('原密码不能为空!', {
                            title: '提示框',
                            icon: 0
                        });
                        return false;
                    }
                    if ($("#Nes_pas").val() == "") {
                        layer.alert('新密码不能为空!', {
                            title: '提示框',
                            icon: 0
                        });
                        return false;
                    }

                    if ($("#c_mew_pas").val() === "") {
                        layer.alert('确认新密码不能为空!', {
                            title: '提示框',
                            icon: 0
                        });
                        return false;
                    }
                    if (!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
                        layer.alert('密码不一致!', {
                            title: '提示框',
                            icon: 0
                        });
                        return false;
                    }
                    else {
                        $.ajax({
                            type : 'post',
                            url : '${pageContext.request.contextPath}/admin/checkOldPassword',
                            dataType : 'json',
                            data : {
                                password : $("#password").val(),
                                id : ${admin.id}
                            },
                            success : function (result) {
                                if (result){
                                    layer.confirm("是否确认修改密码？",function () {
                                        $.ajax({
                                            type : 'post',
                                            url : '${pageContext.request.contextPath}/admin/update_adminPassword',
                                            dataType : 'json',
                                            data : {
                                                password : $("#Nes_pas").val(),
                                                id : ${admin.id}
                                            },
                                            success : function (result) {
                                                if (result){
                                                    layer.alert('修改成功,下次登录请使用新密码！', {
                                                        title: '提示框',
                                                        icon: 1,
                                                    });
                                                    layer.close(index);
                                                }else {
                                                    layer.msg('修改出错，请稍后再试！', {icon: 7, offset: 't'});
                                                }
                                            },
                                            error : function () {
                                                layer.msg('修改密码出错，请稍后再试！', {icon: 2, offset: 't'});
                                            }
                                        });
                                    });

                                }else {
                                    layer.alert('原密码不正确!', {
                                        title: '提示框',
                                        icon: 0
                                    });
                                }
                            },
                            error : function () {
                                layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                            }
                        });
                    }
                }
            });
        });
        $('#Exit_system').on('click', function () {
            layer.confirm('是否确定退出系统？', {
                    btn: ['是', '否'],//按钮
                    icon: 2
                },
                function () {
                    location.href = "${pageContext.request.contextPath}/admin/login_out";
                });
        });
    });
</script>
</html>
