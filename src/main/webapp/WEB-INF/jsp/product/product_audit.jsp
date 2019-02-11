<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
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
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.css"
          type="text/css">
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/H-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/H-ui.admin.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>产品管理--产品申请</title>
</head>
<body>
<div class=" page-content clearfix">
    <div id="products_style">
        <div class="search_style">
        </div>
        <!--产品申请列表展示-->
        <div>
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                <tr>
                    <th width="80px">产品编号</th>
                    <th width="300px">产品名称</th>
                    <th width="100px">供货价</th>
                    <th width="100px">零售价</th>
                    <th width="100px">库存量</th>
                    <th width="100px">发货地</th>
                    <th width="190px">所属商家</th>
                    <th width="170px">添加时间</th>
                    <th width="150px">热销(平台)</th>
                    <th width="150px">新品(平台)</th>
                    <th width="180px">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${statusApplyForList}" var="goodsVo">
                    <tr>
                        <td>${goodsVo.id}</td>
                        <td>${goodsVo.goodsName}</td>
                        <td>${goodsVo.goodsSupplyPrice}</td>
                        <td>${goodsVo.goodsRetailPrice}</td>
                        <td>${goodsVo.goodsInventory}</td>
                        <td>${goodsVo.goodsDispatchPlace}</td>
                        <td><u style="cursor:pointer" class="text-primary"
                               onclick="store_show('查看商铺信息','${pageContext.request.contextPath}/store/getstorebyid',${goodsVo.storeId},'1500','700');">${goodsVo.storeName}</u>
                        </td>
                        <td>${goodsVo.goodsAddtime}</td>
                            <%--热销--%>
                        <td class="td-select">
                            <c:if test="${goodsVo.plateIsbelongHotFlag == 1}">
                                <a onClick="plate_isbelong_hot_flag(this,${goodsVo.id},1)" href="javascript:void(0);"
                                   title="是" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                            </c:if>

                            <c:if test="${goodsVo.plateIsbelongHotFlag == 2}">
                            <a onClick="plate_isbelong_hot_flag(this,${goodsVo.id},2)" href="javascript:void(0);"
                               title="否" class="btn btn-xs"> <i class="icon-ok bigger-120"></i></a>
                            </c:if>
                        </td>
                            <%--新品--%>
                        <td class="td-select">

                            <c:if test="${goodsVo.plateIsbelongNewFlag == 1}">
                            <a onClick="plate_isbelong_new_flag(this,${goodsVo.id},1)" href="javascript:void(0);"
                               title="是" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                            </c:if>

                            <c:if test="${goodsVo.plateIsbelongNewFlag == 2}">
                            <a onClick="plate_isbelong_new_flag(this,${goodsVo.id},2)" href="javascript:void(0);"
                               title="否" class="btn btn-xs"> <i class="icon-ok bigger-120"></i></a>
                            </c:if>
                        </td>
                        <td class="td-manage"><a title="详情"
                                                 href="${pageContext.request.contextPath}/goods/getgoodsbyid?id=${goodsVo.id}"
                                                 class="btn btn-xs btn-info"> 详情 </a> <a title="删除"
                                                                                         href="javascript:void(0);"
                                                                                         onclick="member_del(this,${goodsVo.id})"
                                                                                         class="btn btn-xs btn-danger">
                            删除 </a></td>

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

    /*产品-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/goods/delectgoods",
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

    //显示店铺详细信息
    function store_show(title, url, id, w, h) {
        layer_show(title, url + '?id=' + id, w, h);
    }

    //更改是否属于平台热销状态plate_isbelong_hot_flag
    function plate_isbelong_hot_flag(obj, id ,icode) {
        var msg;
        var hotId=icode;
        if(icode==1){
            msg='确定解除平台热销状态吗?'
        }
        if(icode==2){
            msg='确定变更为平台热销状态吗?'
        }

        layer.confirm(msg, function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/goods/modifyhot",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {
                        $(obj).parents("tr").remove();
                        layer.msg(data.msg, {icon: 1, time: 1000});
                        /*刷新页面*/
                        location.reload();
                    } else {
                        layer.msg(data.msg, {icon: 5, time: 1000});
                    }
                }
            });
        });
    }

    //更改是否属于平台新品状态plate_isbelong_new_flag
    function plate_isbelong_new_flag(obj, id ,icode) {
        var msg;
        var hotId=icode;
        if(icode==1){
            msg='确定解除平台新品状态吗?'
        }
        if(icode==2){
            msg='确定变更为平台新品状态吗?'
        }

        layer.confirm(msg, function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/goods/modifynew",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {
                        $(obj).parents("tr").remove();
                        layer.msg(data.msg, {icon: 1, time: 1000});
                        /*刷新页面*/
                        location.reload();
                    } else {
                        layer.msg(data.msg, {icon: 5, time: 1000});
                    }
                }
            });
        });
    }


</script>
<script type="text/javascript">
    //分页
    $('#sample-table').dataTable({
        "aaSorting": [[7, "desc"]],//默认第几个排序
        "bProcessing": true,//是否显示进度提示
        "aLengthMenu": [5, 10, 20, 50, 100],
        "bAutoWidth": true,
        "aoColumnDefs": [
            {"orderable": false, "aTargets": [5, 6, 10,]}// 制定列不参与排序
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
