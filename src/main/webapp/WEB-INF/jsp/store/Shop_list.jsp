<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.css"
          type="text/css">
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/H-ui.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/H-ui.admin.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>商铺管理--商铺列表</title>
</head>
<body>
<c:if test="${msg!=null}">
<h3 style="color:red">${msg}</h3>
</c:if>
<div class="clearfix">
    <div class="article_style" id="article_style">
        <div id="scrollsidebar" class="left_Treeview">
            <div class="show_btn" id="rightArrow"><span></span></div>
            <div class="widget-box side_content">
                <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                <div class="side_list">
                    <div class="widget-header header-color-green2">
                        <h4 class="lighter smaller">店铺分类</h4>
                    </div>
                    <div class="widget-body">
                        <ul class="b_P_Sort_list">
                            <li><i class="orange  fa fa-list "></i>
                                <a href="#">全部(${storeSize})</a>
                            </li>
                            <c:forEach items="${byClassifyCount}" var="classify">
                                <li><i class="fa fa-shopping-bag pink "></i> <a href="#">${classify.classifyName}(${classify.storeVoCount})</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--文章列表-->
        <div class="Ads_list">
            <div class="search_style">


            </div>
            <div class="article_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="120px">商铺编号</th>
                        <th width="180">商铺名称</th>
                        <th width="120px">推荐人</th>
                        <th width="120px">联系人</th>
                        <th width="120px">联系方式</th>
                        <th width="120px">登录账号</th>
                        <th width="120px">店铺类型</th>
                        <th width="">地址</th>
                        <th width="150px">添加时间</th>
                        <th width="150px">状态</th>
                        <th width="150px">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${storeList}" var="store">
                        <tr>
                            <td>${store.id}</td>
                            <td><u style="cursor:pointer" class="text-primary"
                                   onclick="store_show('查看商铺信息','${pageContext.request.contextPath}/store/getstorebyid',${store.id},'1500','700')">${store.storeName}</u>
                            </td>

                            <td>${store.referrerName}</td>
                            <td>${store.storeContactPeople}</td>
                            <td>${store.storeContactPeopleTel}</td>
                            <td>${store.storeNick}</td>
                            <td>${store.classifyName}</td>
                            <td>${store.companyPermanentAddress}</td>
                            <td>${store.storeAddtime}</td>

                            <c:if test="${store.storeStatus==1}">
                                <td class="td-status"><span class="label label-success radius">已启用</span></td>
                            </c:if>

                            <c:if test="${store.storeStatus==3}">
                                <td class="td-status"><span class="label label-defaunt radius">已停用</span></td>
                            </c:if>

                            <td class="td-manage">

                                <c:if test="${store.storeStatus==1}">
                                    <a onClick="member_stop(this,${store.id})" href="javascript:void(0);" title="停用"
                                       class="btn btn-xs ">
                                        <i class="fa fa-times bigger-120"></i></a>
                                </c:if>

                                <c:if test="${store.storeStatus==3}">
                                    <a onClick="member_start(this,${store.id})" href="javascript:void(0);" title="启用"
                                       class="btn btn-xs btn-success">
                                        <i class="fa fa-check bigger-120"></i></a>
                                </c:if>


                                <a title="删除" href="javascript:;" onclick="member_del(this,${store.id})"
                                   class="btn btn-xs btn-danger">
                                    <i class="fa fa-trash bigger-120"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $("#article_style").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            stylewidth: '220',
            spacingw: 30,//设置隐藏时的距离
            spacingh: 250,//设置显示时间距
            set_scrollsidebar: '.Ads_style',
            table_menu: '.Ads_list'
        });
    });
    //初始化宽度、高度
    $(".widget-box").height($(window).height());
    $(".Ads_list").width($(window).width() - 220);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height());
        $(".Ads_list").width($(window).width() - 220);
    });

    /*商铺-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', {icon: 0,}, function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/store/removerstore",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {
                        $(obj).parents("tr").remove();
                        layer.msg(data.msg, {icon: 1, time: 1000});
                    } else {
                        layer.msg(data.msg, {icon: 5, time: 1000});
                    }
                }
            });
        });
    }

    /*商铺-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/store/modifystatus",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_start(this,'+ id +')" href="javascript:;" title="启用"><i class="fa fa-check bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
                        $(obj).remove();
                        layer.msg('已停用!', {icon: 5, time: 1000});

                    } else {
                        layer.msg(data.msg, {icon: 2, offset: 't'})
                    }
                }
            });


        });
    }

    /*商铺-启用*/
    function member_start(obj, id) {

        layer.confirm('确认要启用吗？',
            function (index) {
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/store/modifystatus",
                    data: {"id": id},
                    dataType: "json",
                    success: function (data) {
                        if (data.code == 2000) {
                            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs" onClick="member_stop(this,'+id+')" href="javascript:;" title="停用"><i class="fa fa-times bigger-120"></i></a>');
                            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                            $(obj).remove();
                            layer.msg('已启用!', {icon: 6, time: 1000});
                        }
                    }
                });

            });
    }

    //显示店铺详细信息
    function store_show(title, url, id, w, h) {

        layer_show(title, url + '?id=' + id, w, h);
    }
</script>
<script type="text/javascript">
    //分页
    $('#sample-table').dataTable({
        "aaSorting": [[8, "desc"]],//默认第几个排序
        "bProcessing": true,//是否显示进度提示
        "aLengthMenu": [5, 10, 20, 50, 100],
        "bAutoWidth": true,
        "aoColumnDefs": [
            {"orderable": false, "aTargets": [1, 2, 3, 4, 5, 7,]}// 制定列不参与排序
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
</script>
