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
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/assets/js/ace-extra.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/assets/dist/echarts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/H-ui.js"></script>
    <title>支付管理--支付方式</title>
</head>

<body>
<div class="margin clearfix">
    <div class="defray_style">
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert"><i class="fa fa-remove"></i></button>
            注：该支付方式启用并不能正常使用，需要开通支付功能才能使用相应的支付方式。
        </div>
        <!--支付列表-->
        <div class="defray_list cover_style clearfix">
            <div class="type_title">支付方式</div>
            <div class="defray_content clearfix">
                <%--<ul class="defray_info" style="height: 360px;">--%>
                    <%--<li class="defray_name">支付宝</li>--%>
                    <%--<li class="name_logo"><img src="${pageContext.request.contextPath}/static/admin/products/black/zhifb.jpg" width="100%" height="150px;" alt="支付宝"/></li>--%>
                    <%--<li class="description" style="height: 110px;">支付宝（中国）网络技术有限公司是国内领先的第三方支付平台，致力于提供“简单、安全、快速”的支付解决方案</li>--%>
                    <%--<li class="select">--%>
                        <%--<c:if test="${sysconfig.aliPayFlag == 1}">--%>
                            <%--<label>--%>
                                <%--<input name="form-field-radio" type="radio" class="ace" checked="checked">--%>
                                <%--<span class="lbl">启用</span>--%>
                            <%--</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <%--<label>--%>
                                <%--<input name="form-field-radio" type="radio" class="ace" onclick="changepayType(1,2,${sysconfig.id});">--%>
                                <%--<span class="lbl">关闭</span>--%>
                            <%--</label>--%>
                        <%--</c:if>--%>
                        <%--<c:if test="${sysconfig.aliPayFlag == 2}">--%>
                            <%--<label>--%>
                                <%--<input name="form-field-radio" type="radio" class="ace" onclick="changepayType(1,1,${sysconfig.id});">--%>
                                <%--<span class="lbl">启用</span>--%>
                            <%--</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <%--<label>--%>
                                <%--<input name="form-field-radio" type="radio" class="ace" checked="checked">--%>
                                <%--<span class="lbl">关闭</span>--%>
                            <%--</label>--%>
                        <%--</c:if>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <ul class="defray_info" style="height: 360px;">
                    <li class="defray_name">微信支付</li>
                    <li class="name_logo"><img src="${pageContext.request.contextPath}/static/admin/products/black/weixin.jpg" width="100%" height="150px;" alt="微信支付s"/></li>
                    <li class="description" style="height: 110px;">微信支付是集成在微信客户端的支付功能，用户可以通过手机完成快速的支付流程。</li>
                    <li class="select">
                        <c:if test="${sysconfig.weixinPayFlag == 1}">
                            <label>
                                <input name="form-field-radio1" type="radio" class="ace" checked="checked">
                                <span class="lbl">启用</span>
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label>
                                <input name="form-field-radio1" type="radio" class="ace" onclick="changepayType(2,2,${sysconfig.id});">
                                <span class="lbl">关闭</span>
                            </label>
                        </c:if>
                        <c:if test="${sysconfig.weixinPayFlag == 2}">
                            <label>
                                <input name="form-field-radio1" type="radio" class="ace" onclick="changepayType(2,1,${sysconfig.id});">
                                <span class="lbl">启用</span>
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label>
                                <input name="form-field-radio1" type="radio" class="ace" checked="checked">
                                <span class="lbl">关闭</span>
                            </label>
                        </c:if>
                    </li>
                </ul>
                <ul class="defray_info" style="height: 360px;">
                    <li class="defray_name">银联</li>
                    <li class="name_logo">
                        <img src="${pageContext.request.contextPath}/static/admin/products/black/yinglian.jpg" width="100%" height="150px;" alt="银联"/></li>
                    <li class="description" style="height: 110px;">中国银联是中国银行卡联合组织，通过银联跨行交易清算系统，实现商业银行系统间的互联互通和资源共享，保证银行卡跨行、跨地区和跨境的使用。</li>
                    <li class="select">
                        <c:if test="${sysconfig.unionpayPayFlag == 1}">
                            <label>
                                <input name="form-field-radio2" type="radio" class="ace" checked="checked">
                                <span class="lbl">启用</span>
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label>
                                <input name="form-field-radio2" type="radio" class="ace" onclick="changepayType(3,2,${sysconfig.id});">
                                <span class="lbl">关闭</span>
                            </label>
                        </c:if>
                        <c:if test="${sysconfig.unionpayPayFlag == 2}">
                            <label>
                                <input name="form-field-radio2" type="radio" class="ace" onclick="changepayType(3,1,${sysconfig.id});">
                                <span class="lbl">启用</span>
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label>
                                <input name="form-field-radio2" type="radio" class="ace" checked="checked">
                                <span class="lbl">关闭</span>
                            </label>
                        </c:if>
                    </li>
                </ul>
                <ul class="defray_info" style="height: 360px;">
                    <li class="defray_name">分红支付</li>
                    <li class="name_logo"><img src="${pageContext.request.contextPath}/static/admin/products/black/balance.jpg" width="100%" height="150px;" alt="分红支付"/> </li>
                    <li class="description" style="height: 110px;">分红支付是指某人在某个消费机构或账户中提前支付的预存金额，或是在该机构中消费的剩余金额，可用于支付您在该消费机构的购买行为。</li>
                    <li class="select">
                        <c:if test="${sysconfig.shareprofitPayFlag == 1}">
                            <label>
                                <input name="form-field-radio3" type="radio" class="ace" checked="checked">
                                <span class="lbl">启用</span>
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label>
                                <input name="form-field-radio3" type="radio" class="ace" onclick="changepayType(4,2,${sysconfig.id});">
                                <span class="lbl">关闭</span>
                            </label>
                        </c:if>
                        <c:if test="${sysconfig.shareprofitPayFlag == 2}">
                            <label>
                                <input name="form-field-radio3" type="radio" class="ace" onclick="changepayType(4,1,${sysconfig.id});">
                                <span class="lbl">启用</span>
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label>
                                <input name="form-field-radio3" type="radio" class="ace" checked="checked">
                                <span class="lbl">关闭</span>
                            </label>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    /**
     * 修改支付方式
     * @param type 支付方式
     * @param flag 是否显示
     */
    function changepayType(type,flag,id) {
        //支付宝
        if(type == 1){
            if(flag == 1){
                layer.confirm("确认要启用支付宝支付吗？",function () {
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_paySysConfig',
                        data : {
                            type : type,
                            flag : flag,
                            id : id
                        },
                        dataType : 'json',
                        success : function (result) {
                            layer.msg('成功启用支付宝支付!', {icon: 1, time: 1000},function () {
                                window.location.reload();
                            });
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                });
            }else{
                layer.confirm("确认要关闭支付宝支付吗？",function () {
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_paySysConfig',
                        data : {
                            type : type,
                            flag : flag,
                            id : id
                        },
                        dataType : 'json',
                        success : function (result) {
                            layer.msg('成功关闭支付宝支付!', {icon: 1, time: 1000},function () {
                                window.location.reload();
                            });
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                });
            }
        }
        //微信
        else if (type == 2){
            if (flag == 1){
                layer.confirm("确认要启用微信支付吗？",function () {
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_paySysConfig',
                        data : {
                            type : type,
                            flag : flag,
                            id : id
                        },
                        dataType : 'json',
                        success : function (result) {
                            layer.msg('成功启用微信支付!', {icon: 1, time: 1000},function () {
                                window.location.reload();
                            });
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                });
            }else{
                layer.confirm("确认要关闭微信支付吗？",function () {
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_paySysConfig',
                        data : {
                            type : type,
                            flag : flag,
                            id : id
                        },
                        dataType : 'json',
                        success : function (result) {
                            layer.msg('成功关闭微信支付!', {icon: 1, time: 1000},function () {
                                window.location.reload();
                            });
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                });
            }
        }
        //银联
        else if (type == 3){
            if (flag == 1){
                layer.confirm("确认要启用银联支付吗？",function () {
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_paySysConfig',
                        data : {
                            type : type,
                            flag : flag,
                            id : id
                        },
                        dataType : 'json',
                        success : function (result) {
                            layer.msg('成功启用银联支付!', {icon: 1, time: 1000},function () {
                                window.location.reload();
                            });
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                });
            }else{
                layer.confirm("确认要关闭银联支付吗？",function () {
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_paySysConfig',
                        data : {
                            type : type,
                            flag : flag,
                            id : id
                        },
                        dataType : 'json',
                        success : function (result) {
                            layer.msg('成功关闭银联支付!', {icon: 1, time: 1000},function () {
                                window.location.reload();
                            });
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                });
            }
        }
        //分红
        else if (type == 4){
            if (flag == 1){
                layer.confirm("确认要启用分红支付吗？",function () {
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_paySysConfig',
                        data : {
                            type : type,
                            flag : flag,
                            id : id
                        },
                        dataType : 'json',
                        success : function (result) {
                            layer.msg('成功启用分红支付!', {icon: 1, time: 1000},function () {
                                window.location.reload();
                            });
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                });
            }else{
                layer.confirm("确认要关闭分红支付吗？",function () {
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/update_paySysConfig',
                        data : {
                            type : type,
                            flag : flag,
                            id : id
                        },
                        dataType : 'json',
                        success : function (result) {
                            layer.msg('成功关闭分红支付!', {icon: 1, time: 1000},function () {
                                window.location.reload();
                            });
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                });
            }
        }
    }
</script>
</html>
