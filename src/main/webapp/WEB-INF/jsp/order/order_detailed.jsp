<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/H-ui.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/jquery.easy-pie-chart.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/lrtk.js" type="text/javascript"></script>
    <title>交易管理--订单管理--订单详细</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Order_Details_style">
        <div class="Numbering">订单编号:<b>${order.orderNum}</b></div>
    </div>
    <div class="detailed_style">
        <!--收件人信息-->
        <div class="Receiver_style">
            <div class="title_name">收件人信息</div>
            <div class="Info_style clearfix">
                <div class="col-xs-3">
                    <label class="label_name"> 收件人姓名： </label>
                    <div class="o_content">${order.receiverName}</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name"> 收件人电话： </label>
                    <div class="o_content">${order.receiverTel}</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name"> 收件地邮编： </label>
                    <div class="o_content">${order.receiverPostcode}</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name"> 收件地址： </label>
                    <div class="o_content">${order.receiverAddress}</div>
                </div>
            </div>
        </div>
        <!--订单信息-->
        <div class="product_style">
            <div class="title_name">产品信息</div>
            <div class="Info_style clearfix">
                <div class="product_info clearfix">
                    <a href="#" class="img_link"><img src="${fn:split(goods.goodsPhoto, ",")[0]}"/></a>
                    <span>
                        <a href="#" class="name_link">${goods.goodsName}</a><br>
                        <p>规格：${order.goodsParameter}</p>
                        <p>数量：${order.goodsAmount}</p>
                        <p>价格：<b class="price"><i>￥</i>${order.goodsPrice}</b></p>
                        <p>状态：<i class="label label-success radius" title="${order.goodsInventory}">
                            <c:if test="${order.goodsInventory > 0}">
                                有货
                            </c:if>
                            <c:if test="${order.goodsInventory <= 0}">
                                紧缺
                            </c:if>
                        </i></p>
                    </span>
                </div>
            </div>
        </div>
        <!--总价-->
        <div class="Total_style">
            <div class="Info_style clearfix">
                <div class="col-xs-3">
                    <label class="label_name"> 订单状态： </label>
                    <div class="o_content">
                        <c:if test="${order.orderStatus == 1}">待支付</c:if>
                        <c:if test="${order.orderStatus == 2}">待发货</c:if>
                        <c:if test="${order.orderStatus == 3}">待收货</c:if>
                        <c:if test="${order.orderStatus == 4}">待评价</c:if>
                        <c:if test="${order.orderStatus == 5}">交易成功</c:if>
                        <c:if test="${order.orderStatus == 6}">取消订单</c:if>
                        <c:if test="${order.orderStatus == 7}">退货退款</c:if>
                        <c:if test="${order.orderStatus == 8}">退款成功</c:if>
                    </div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name"> 支付方式： </label>
                    <div class="o_content">
                        <c:if test="${order.orederPayType == 1}">
                            微信
                        </c:if>
                        <c:if test="${order.orederPayType == 2}">
                            支付宝
                        </c:if>
                        <c:if test="${order.orederPayType == 3}">
                            银联
                        </c:if>
                        <c:if test="${order.orederPayType == 4}">
                            分红
                        </c:if>
                    </div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name"> 订单生成日期： </label>
                    <div class="o_content">${order.orderAddtime}</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name"> 快递名称： </label>

                    <div class="o_content company"></div>

                </div>
                <div class="col-xs-3">
                    <label class="label_name"> 发货日期： </label>
                    <div class="o_content">${order.orderTakegoodsTime}</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name"> 运费： </label>
                    <div class="o_content">${order.goodsFreight}</div>
                </div>
            </div>
            <div class="Total_m_style">
                <span class="Total">总数：<b>${order.goodsAmount}</b></span>
                <span class="Total_price">总价：<b>${order.goodsActualPrice}</b>元</span>
            </div>
        </div>
        <!--物流信息-->
        <div class="Logistics_style clearfix">
            <div class="title_name">物流信息</div>
            <div data-mohe-type="kuaidi_new" class="g-mohe " id="mohe-kuaidi_new">
                <div id="mohe-kuaidi_new_nucom">
                    <div class="mohe-wrap mh-wrap">
                        <div class="mh-cont mh-list-wrap mh-unfold">
                            <div class="mh-list">
                                <ul class="logistics">
                                    <%--物流信息--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="Button_operation">
            <button onclick="go_back();" class="btn btn-primary radius" type="submit">
                <i class="icon-save "></i>返回上一步
            </button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //判断需要获取物流信息的订单状态
    if (${order.orderStatus  >= 3 }){
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getLogistics',
            dataType : 'json',
            data : {
                logisticsNum : '${order.logisticsNum}',
                logisticsCompany : '${order.logisticsCompany}'
            },
            success : function (result) {
                var str = "";
                if (result!=null){
                    //判断获取是否出错
                    if(result.error_code == 0){
                        $(".company").html(result.result.company);
                        var list = result.result.list;
                        for (var i = list.length - 1; i >= 0; i-- ){
                            if (i == list.length-1) {
                                str  += "<li class='first'>";
                                    str  += "<p>"+list[i].datetime+"</p>";
                                    str  += "<p>"+list[i].remark+"</p>";
                                str  += "<span class='before'></span>";
                                str  += "<span class='after'></span>";
                                str  += "<i class='mh-icon mh-icon-new'></i>";
                                str  += "</li>";
                            }else {
                                str  += "<li>";
                                    str  += "<p>"+list[i].datetime+"</p>";
                                    str  += "<p>"+list[i].remark+"</p>";
                                    str  += "<span class='before'></span><span class='after'></span>";
                                str  += "</li>";
                            }
                        }
                    }else{
                        str += "发生错误！错误代码："+result.error_code+",错误原因："+result.reason+"。";
                    }
                    $(".logistics").html(str);
                }else {
                    $(".g-mohe").html("<div class='prompt'><img src='${pageContext.request.contextPath}/static/admin/images/meiyou.png'/><p>暂无物流信息！</p></div>");
                }
            },
            error : function () {
                layer.msg('获取物流信息出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    }else {
        $(".g-mohe").html("<div class='prompt'><img src='${pageContext.request.contextPath}/static/admin/images/meiyou.png'/><p>暂无物流信息！</p></div>");
    }

    //返回上一页
    function go_back() {
        window.history.go(-1);
    }
</script>
</html>
