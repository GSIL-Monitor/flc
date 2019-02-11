<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/H-ui.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>退款管理</title>
</head>

<body>
<div class="margin clearfix">
    <div id="refund_style">
        <!--退款列表-->
        <div class="refund_list">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                    <tr>
                        <th width="120px">订单编号</th>
                        <th width="250px">产品名称</th>
                        <th width="100px">交易金额</th>
                        <th width="110px">交易时间</th>
                        <th width="110px">申请时间</th>
                        <th width="100px">退款金额</th>
                        <th width="80px">退款数量</th>
                        <th width="70px">状态</th>
                        <th width="200px">原因</th>
                        <th width="200px">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.orderNum}</td>
                            <td>${order.goodsName}</td>
                            <td>${order.goodsActualPrice}</td>
                            <td>${order.orderAddtime}</td>
                            <td>${order.applicationTime}</td>
                            <td>${order.refundMoney}</td>
                            <td>${order.goodsAmount}</td>
                            <td class="td-status">
                                <c:if test="${order.refundBigStatus == 1}">
                                    <span class="label label-success radius">申请中</span>
                                </c:if>
                                <c:if test="${order.refundBigStatus == 2}">
                                    <span class="label label-success radius">已完成</span>
                                </c:if>
                            </td>
                            <td>${order.refundReasons}</td>
                            <td>
                                <a title="退款订单详细" href="javascript:void(0);" onclick="refund_detail(${order.orderNum});" class="btn btn-xs btn-info Refund_detailed">详细</a>
                                <a title="删除" href="javascript:void(0);" onclick="order_form_del(this,${order.id})" class="btn btn-xs btn-danger">删除</a>
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
    //分页
    $('#sample-table').dataTable({
        "bProcessing" : true,//是否显示进度提示
        "aaSorting": [[ 5, "desc" ]],//默认第几个排序
        "aLengthMenu" : [5,10,20,50,100],
        "bAutoWidth" : true,
        "aoColumnDefs": [
            {"orderable":false,"aTargets":[1,7,8,9]}// 制定列不参与排序
        ],
        "oLanguage" : {
            "sProcessing" : "正在获取数据，请稍后...",
            "sLengthMenu" : "每页 _MENU_ 条记录",
            "sZeroRecords" : "对不起，没有您要搜索的内容",
            "sInfo" : "从_START_到_END_条 总记录_TOTAL_条 第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
            "sInfoEmpty" : "无记录",
            "sInfoFiltered" : "(全部记录数 _MAX_ 条)",
            "sInfoPostFix" : "",
            "sSearch" : "搜索",
            "sUrl" : "",
            "oPaginate" :{
                "sFirst" : "首页",
                "sPrevious" : "上一页",
                "sNext" : "下一页",
                "sLast" : "末页"
            }
        }
    });
    /*订单-删除*/
    function order_form_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/delete_order',
                dataType : 'json',
                data : {
                    id : id
                },
                success : function (result) {
                    if (result){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    }else{
                        layer.msg('删除失败，请稍后再试！', {icon: 7, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    }
    
    function refund_detail(orderNum) {
        window.location.href = "${pageContext.request.contextPath}/admin/refundDetail?orderNum="+orderNum;
    }
</script>