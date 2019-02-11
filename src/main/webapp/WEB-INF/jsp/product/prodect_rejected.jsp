<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/displayPart.js" type="text/javascript"></script>
    <title>交易金额</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Shops_Audit">
        <div class="prompt">当前共有<b>${goodsVoListSize}</b>种商品被驳回</div>
        <!--申请列表-->
        <div class="audit_list">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                <tr>
                    <th width="190px">商品编号</th>
                    <th width="190px">商品名称</th>
                    <th width="140px">所属分类</th>
                    <th width="100px">供货价</th>
                    <th width="170px">库存数量</th>
                    <th width="120px">发货地</th>
                    <th width="">所属商家</th>
                    <th width="150px">添加时间</th>
                    <th width="120px">状态</th>
                    <th width="100px">操作</th>
                </tr>
                </thead>
                <tbody>
                <C:forEach items="${goodsVoList}" var="goodsVo">
                <tr>
                    <td>${goodsVo.id}</td>
                    <td>${goodsVo.storeName}</td>
                    <td>${goodsVo.threeClassifyName}</td>
                    <td>${goodsVo.goodsSupplyPrice}</td>
                    <td>${goodsVo.goodsInventory}</td>
                    <td>${goodsVo.goodsDispatchPlace}</td>
                    <td>${goodsVo.storeName}</td>
                    <td>${goodsVo.goodsAddtime}</td>

                    <c:if test="${goodsVo.goodsStatus == 5}">
                    <td><span class="label label-success radius">被驳回</span></td>
                    </c:if>
                    <td class="td-manage">
                        <a title="产品详细" href="${pageContext.request.contextPath}/goods/getgoodsbyid?id=${goodsVo.id}" class="btn btn-xs btn-info Refund_detailed">详细</a>
                        <!--<a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="btn btn-xs btn-danger">删除</a> -->
                    </td>
                </tr>
                </C:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    /*店铺-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', {icon: 0,}, function (index) {
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }
</script>
