<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/H-ui.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <title>退款详细</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Refund_detailed">
        <div class="Numbering">退款单编号:<b>${order.orderNum}</b></div>
        <div class="detailed_style">
            <!--退款信息-->
            <div class="Receiver_style">
                <div class="title_name">退款信息</div>
                <div class="Info_style clearfix">
                    <div class="col-xs-3">
                        <label class="label_name"> 退款人姓名： </label>
                        <div class="o_content">${order.receiverName}</div>
                    </div>
                    <div class="col-xs-3">
                        <label class="label_name"> 退款人电话： </label>
                        <div class="o_content">${order.receiverTel}</div>
                    </div>
                    <div class="col-xs-3">
                        <label class="label_name"> 退款方式：</label>
                        <c:if test="${order.orederPayType == 1}">
                            <div class="o_content">微信</div>
                        </c:if>
                        <c:if test="${order.orederPayType == 2}">
                            <div class="o_content">支付宝</div>
                        </c:if>
                        <c:if test="${order.orederPayType == 3}">
                            <div class="o_content">银联</div>
                        </c:if>
                        <c:if test="${order.orederPayType == 4}">
                            <div class="o_content">分红</div>
                        </c:if>
                    </div>
                    <div class="col-xs-3">
                        <label class="label_name"> 退款数量：</label>
                        <div class="o_content">${order.goodsAmount}件</div>
                    </div>
                    <div class="col-xs-3">
                        <label class="label_name"> 快递名称：</label>
                        <div class="o_content">${refundLog.logisticsCompany}</div>
                    </div>
                    <div class="col-xs-3">
                        <label class="label_name"> 快递单号：</label>
                        <div class="o_content">${refundLog.logisticsNum}</div>
                    </div>
                    <div class="col-xs-3">
                        <label class="label_name"> 退款金额：</label>
                        <div class="o_content">${refundLog.refundMoney}</div>
                    </div>
                    <div class="col-xs-3">
                        <label class="label_name"> 退款日期：</label>
                        <div class="o_content">${refundLog.finishTime}</div>
                    </div>
                    <div class="col-xs-3">
                        <label class="label_name"> 退款原因：</label>
                        <div class="o_content">${refundLog.reasons}</div>
                    </div>
                    <div class="col-xs-3">
                        <label class="label_name"> 状态：</label>
                        <c:if test="${refundLog.refundBigStatus == 1}">
                            <div class="o_content">申请中</div>
                        </c:if>
                        <c:if test="${refundLog.refundBigStatus == 2}">
                            <div class="o_content">已完成</div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="Receiver_style">
                <div class="title_name">退款说明</div>
                <div class="reund_content">
                    ${refundLog.msg}
                </div>
            </div>

            <!--产品信息-->
            <div class="product_style">
                <div class="title_name">产品信息</div>
                <div class="Info_style clearfix">
                    <div class="product_info clearfix">
                    <a href="#" class="img_link"><img src="${fn:split(goods.goodsPhoto, ",")[0]}" alt=""></a>
                    <span>
                        <p>${goods.goodsName}</p>
                        <p>规格：${order.goodsParameter}</p>
                        <p>数量：${order.goodsAmount}件</p>
                        <p>价格：<b class="price"><i>￥</i>${goods.goodsSupplyPrice}</b></p>
                        <c:if test="${refundLog.refundBigStatus == 1}">
                            <p class="status">申请中</p>
                        </c:if>
                        <c:if test="${refundLog.refundBigStatus == 2}">
                            <p class="status">已退款</p>
                        </c:if>
                    </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
