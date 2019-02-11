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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.css"
          type="text/css">
    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/laydate/laydate.js"
            type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/H-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/H-ui.admin.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>产品管理--品牌管理--品牌详细</title>
</head>

<body>
<div class="page-content clearfix">
    <div class="brand_detailed">
        <div class="brand_info clearfix">
            <div class="title_brand">品牌信息</div>
            <form action="#">
                <ul class="Info_style clearfix">
                    <li><label class="label_name">品牌名称：</label> <span class="name">${brand.brandName}</span></li>
                    <li><label class="label_name" style="width: 85px;">销售中商品：</label><span class="name">共${goodsListSize}件</span></li>
                    <li><label class="label_name">添加时间：</label><span class="name">${brand.brandAddtime}</span></li>
                    <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;态：</label>

                        <c:if test="${brand.brandType==1}">
                            <span class="btn btn-xs btn-success">显示</span>
                        </c:if>
                        <c:if test="${brand.brandType==2}">
                            <span class="btn btn-xs ">隐藏</span>
                        </c:if>
                    </li>

                    <li><label class="label_name">品牌介绍：</label>
                        <span class="name">${brand.brandDescription}</span>
                    </li>

                </ul>
                <div class="brand_logo">
                    <img src="${brand.brandLogo}" width="120px" height="60px" alt=""/>
                    <p class="name">${brand.brandName}</p>
                </div>
            </form>
        </div>
    </div>
    <!--产品列表-->
    <div class=" clearfix" id="">
        <!--列表展示-->
        <div id="testIframe" style="width:auto;height:auto;">
            <table class="table table-striped table-bordered table-hover" id="sample-table">

                <thead>
                <tr>
                    <th width="80px">产品编号</th>
                    <th width="250px">产品名称</th>
                    <th width="100px">供货价</th>
                    <th width="100px">零售价</th>
                    <th width="180px">添加时间</th>
                    <th width="70px">状态</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${goodsList}" var="goodsVo">
                <tr>
                    <td width="80px">${goodsVo.id}</td>
                    <td width="250px">${goodsVo.goodsName}</td>
                    <td width="100px">${goodsVo.goodsSupplyPrice}</td>
                    <td width="100px">${goodsVo.goodsRetailPrice}</td>
                    <td width="180px">${goodsVo.goodsAddtime}</td>
                    <td class="td-status">
                        <c:if test="${goodsVo.goodsStatus==1}">
                            <span class="label label-success radius">申请中</span>
                        </c:if>
                        <c:if test="${goodsVo.goodsStatus==2}">
                            <span class="label label-success radius">营销中</span>
                        </c:if>
                        <c:if test="${goodsVo.goodsStatus==3}">
                            <span class="label label-success radius">下架</span>
                        </c:if>
                        <c:if test="${goodsVo.goodsStatus==4}">
                            <span class="label label-success radius">违规下架</span>
                        </c:if>
                        <c:if test="${goodsVo.goodsStatus==5}">
                            <span class="label label-success radius">驳回</span>
                        </c:if>
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
    $(".widget-box").height($(window).height() - 215);
    $(".table_menu_list").width($(window).width() - 260);
    $(".table_menu_list").height($(window).height() - 215);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height() - 215);
        $(".table_menu_list").width($(window).width() - 260);
        $(".table_menu_list").height($(window).height() - 215);
    });
</script>
<script type="text/javascript">
    //分页
    $('#sample-table').dataTable({
        "aaSorting": [[4, "asc"]],//默认第几个排序
        "bProcessing": true,//是否显示进度提示
        "aLengthMenu": [5, 10, 20, 50, 100],
        "bAutoWidth": true,
        "aoColumnDefs": [
            {"orderable": false, "aTargets": [1,]}// 制定列不参与排序
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