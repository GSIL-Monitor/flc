<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/font-awesome.min.css"/>
    <link href="${pageContext.request.contextPath }/static/admin/Widget/icheck/icheck.css" rel="stylesheet"
          type="text/css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <%--datatype 插件开始--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.css" type="text/css">

    <%--datatype 插件结束--%>
    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js"
            type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/H-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/H-ui.admin.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>产品管理--品牌管理</title>
</head>

<body>
<div class="page-content clearfix">
    <div id="brand_style">
        <div class="search_style">
            <ul class="search_content clearfix">
            </ul>
        </div>
        <div class="border clearfix">
            <span class="l_f">
                <a href="${pageContext.request.contextPath}/brand/gobrandaddjsp" title="添加品牌" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加品牌</a>
            </span>
        </div>
        <!--品牌列表-->
        <div>
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                <tr>
                    <th width="80px">编号</th>
                    <th width="60px">品牌LOGO</th>
                    <th width="120px">品牌名称</th>
                    <th width="350px">描述</th>
                    <th width="180px">加入时间</th>
                    <th width="70px">状态</th>
                    <th width="200px">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${brandAllList}" var="brand">
                    <tr>
                        <td width="80px">${brand.id}</td>
                        <td>
                            <img src="${brand.brandLogo}" width="60" alt=""/>
                        </td>
                        <td>
                            <a href="javascript:void(0);" name="brand_detailed.html" style="cursor:pointer"
                               class="text-primary brond_name" onclick="generateOrders(${brand.id});"
                               title="${brand.brandName}">${brand.brandName}</a>
                        </td>
                        <td class="text-l">${brand.brandDescription}</td>
                        <td>${brand.brandAddtime}</td>
                        <c:if test="${brand.brandType==1}">
                            <td class="td-status"><span class="btn btn-xs btn-success">已显示</span></td>
                        </c:if>
                        <c:if test="${brand.brandType==2}">
                            <td class="td-status"><span class="btn btn-xs">已隐藏</span></td>
                        </c:if>


                        <td class="td-manage">
                            <c:if test="${brand.brandType==1}">
                            <a onClick="brand_stop(this,${brand.id})" href="javascript:void(0);" title="隐藏" class="btn btn-xs"><i class="icon-ok bigger-120"></i></a>
                            </c:if>
                            <c:if test="${brand.brandType==2}">
                            <a onClick="brand_start(this,${brand.id})" href="javascript:void(0);" title="显示" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                            </c:if>
                            <a title="编辑" href="${pageContext.request.contextPath}/brand/getbrandbyid?id=${brand.id}" class="btn btn-xs btn-info">
                                <i class="icon-edit bigger-120"></i>
                            </a>
                            <a title="删除" href="javascript:void(0);" onclick="member_del(this,${brand.id},'${brand.brandLogo}');"
                               class="btn btn-xs btn-warning">
                                <i class="icon-trash  bigger-120"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //初始化宽度、高度
    $(".chart_style").height($(window).height() - 215);
    $(".table_menu_list").height($(window).height() - 215);
    $(".table_menu_list ").width($(window).width() - 440);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".chart_style").height($(window).height() - 215);
        $(".table_menu_list").height($(window).height() - 215);
        $(".table_menu_list").width($(window).width() - 440);
    });
    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Order_form ,.brond_name').on('click', function () {
        var cname = $(this).attr("title");
        var cnames = parent.$('.Current_page').html();
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe span').html(cname);
        parent.$('#parentIframe').css("display", "inline-block");
        parent.$('.Current_page').attr("name", herf).css({"color": "#4c8fbd", "cursor": "pointer"});
        parent.layer.close(index);
    });

    function generateOrders(id) {
        window.location.href = "${pageContext.request.contextPath}/brand/getbrandbyidss?id="+id;
    }

    /*品牌-停用*/
    function brand_stop(obj, id) {
        layer.confirm('确认要隐藏吗？', function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/brand/modfybrandtype",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {

                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="brand_start(this,'+id+')" href="javascript:void(0);" title="显示" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="btn btn-xs">已停用</span>');
                        $(obj).remove();
                        layer.msg('已隐藏!', {icon: 5, time: 1000});
                    } else {
                        layer.msg(data.msg, {icon: 2, offset: 't'})
                    }
                }
            });
        });
    }


    /*用户-启用*/
    function brand_start(obj, id) {
        layer.confirm('确认要显示吗？', function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/brand/modfybrandtype",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {

                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="brand_stop(this,'+id+')" href="javascript:void(0);" title="隐藏" class="btn btn-xs"><i class="icon-ok bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="btn btn-xs btn-success">已启用</span>');
                        $(obj).remove();
                        layer.msg('已显示!', {icon: 6, time: 1000});
                    } else {
                        layer.msg(data.msg, {icon: 2, offset: 't'})
                    }
                }
            });
        });
    }

    /*品牌-编辑*/
    function member_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*品牌-删除*/
    function member_del(obj, id, logo) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/brand/removebrand",
                data: {"id": id ,"brandLogo": logo},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        layer.msg(data.msg, {icon: 2, offset: 't'})
                    }
                }
            });
        });
    }
</script>

<script type="text/javascript">
    //分页
    $('#sample-table').dataTable({
        "aaSorting": [[4, "asc"]],//默认第几个排序
        "bProcessing": true,//是否显示进度提示
        "aLengthMenu": [5, 10, 20, 50, 100],
        "bAutoWidth": true,
        "aoColumnDefs": [
            {"orderable": false, "aTargets": [1, 3, 6,]}// 制定列不参与排序
        ],
        "oLanguage": {
            "sProcessing": "正在获取数据，请稍后...",
            "sLengthMenu": "每页 _MENU_ 条记录",
            "sZeroRecords": "对不起，没有您要搜索的内容",
            "sInfo": "从_START_到_END_条 总记录_TOTAL_条 第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
            "sInfoEmpty": "无记录",
            "sInfoFiltered": "(全部记录数 _MAX_ 条)",
            "sInfoPostFix": "",
            "sSearch": "搜索",
            "sUrl": "",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上一页",
                "sNext": "下一页",
                "sLast": "末页"
            }
        }
    });

    /*字数限制*/
    function checkLength(which) {
        var maxChars = 500; //
        if (which.value.length > maxChars) {
            layer.open({
                icon: 2,
                title: '提示框',
                content: '您输入的字数超过限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //减去当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    }
</script>