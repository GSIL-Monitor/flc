<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/css/style.css"/>
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]><![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/regular.js" type="text/javascript"></script>
    <title>管理员管理--个人信息管理</title>
</head>

<body>
<div class="clearfix">
    <div class="admin_info_style">
        <div class="admin_modify_style" id="Personal" style="width: 100%;">
            <div class="type_title">管理员信息</div>
            <div class="xinxi">
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" >昵称： </label>
                    <div class="col-sm-9">
                        <span class="col-sm-5">${admin.adminNickName}</span>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="change_Password()" class="btn btn-warning btn-xs">修改密码</a>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">移动电话： </label>
                    <div class="col-sm-9">
                        <input type="text" name="移动电话" value="${admin.adminTel}" class="col-xs-7 text_info adminTel" disabled="disabled">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">真实姓名： </label>
                    <div class="col-sm-9">
                        <input type="text" name="真实姓名" value="${admin.adminTrueName}" class="col-xs-7 text_info adminTrueName" disabled="disabled">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">权限： </label>
                    <div class="col-sm-9"><span>${admin.name}</span></div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">注册时间： </label>
                    <div class="col-sm-9"><span>${admin.adminAddtime}</span></div>
                </div>
                <div class="Button_operation clearfix">
                    <button onclick="modify();" class="btn btn-danger radius" type="submit">修改信息</button>
                    <button onclick="save_info();" class="btn btn-success radius" type="button">保存修改</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--修改密码样式-->
<div class="change_Pass_style" id="change_Pass">
    <ul class="xg_style">
        <li>
            <label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label>
            <input name="原密码" type="password" class="" id="password">
        </li>
        <li>
            <label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label>
            <input name="新密码" type="password" class="" id="Nes_pas">
        </li>
        <li>
            <label class="label_name">确认密码</label>
            <input name="再次确认密码" type="password" class="" id="c_mew_pas">
        </li>
    </ul>
</div>
</body>
</html>
<script type="text/javascript">
    //按钮点击事件
    function modify() {
        $('.text_info').attr("disabled", false);
        $('.text_info').addClass("add");
        $('#Personal').find('.xinxi').addClass("hover");
        $('#Personal').find('.btn-success').css({'display': 'block'});
    };

    function save_info() {
        layer.confirm("是否确认修改？",function () {
            var num = 0;
            var str = "";
            $(".xinxi input[type$='text']").each(function (n) {
                if ($(this).val() == "") {
                    layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
                        title: '提示框',
                        icon: 0,
                    });
                    num++;
                    return false;
                }
            });
            if (num > 0) {
                return false;
            }
            else {
                var adminTel = $(".adminTel").val();
                if (isTel(adminTel)){
                    //修改管理员信息
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_admin',
                        dataType : 'json',
                        data : {
                            adminTel : adminTel,
                            adminTrueName : $(".adminTrueName").val(),
                            id : ${admin.id}
                        },
                        success : function (result) {
                            if (result){
                                layer.alert('修改成功！', {
                                    title: '提示框',
                                    icon: 1,
                                });
                            }else{
                                layer.msg('修改管理员信息出错，请稍后再试！', {icon: 7, offset: 't'});
                            }
                        },
                        error : function () {
                            layer.msg('修改管理员信息出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                    $('#Personal').find('.xinxi').removeClass("hover");
                    $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
                    $('#Personal').find('.btn-success').css({'display': 'none'});
                }else {
                    layer.msg('电话号码格式不正确！', {icon: 7, offset: 't'});
                }
            }
        });
    };
    //初始化宽度、高度
    $(".admin_modify_style").height($(window).height());
    $(".recording_style").width($(window).width() - 400);
    //当文档窗口发生改变时 触发  
    $(window).resize(function () {
        $(".admin_modify_style").height($(window).height());
        $(".recording_style").width($(window).width() - 400);
    });

    //修改密码
    function change_Password() {
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

                if ($("#c_mew_pas").val() == "") {
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

    }
</script>