<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${pageContext.request.contextPath}/static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/font-awesome.min.css"/>
    <link href="${pageContext.request.contextPath}/static/admin/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/ace-extra.min.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <!-- <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/assets/dist/echarts.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <title>交易管理--交易信息</title>
</head>

<body>
<div class=" page-content clearfix">
    <div class="transaction_style">
        <ul class="state-overview clearfix">
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>交易金额</h4><p class="Quantity color_red">${sumMoney}</p></span>
            </li>
            <li class="Info">
                <span class="symbol  blue"><i class="fa fa-shopping-cart"></i></span>
                <span class="value"><h4>订单数量</h4><p class="Quantity color_red">${count}</p></span>
            </li>
            <li class="Info">
                <span class="symbol terques"><i class="fa fa-shopping-cart"></i></span>
                <span class="value"><h4>交易成功</h4><p class="Quantity color_red">${successOrder}</p></span>
            </li>
            <li class="Info">
                <span class="symbol yellow"><i class="fa fa-shopping-cart"></i></span>
                <span class="value"><h4>交易失败</h4><p class="Quantity color_red">${failedOrder}</p></span>
            </li>
            <li class="Info">
                <span class="symbol darkblue"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>退款金额</h4><p class="Quantity color_red">${refundMoney}</p></span>
            </li>
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>供货价</h4><p class="Quantity color_red">${supplyPrice}</p></span>
            </li>
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>毛利润</h4><p class="Quantity color_red">${grossProfit}</p></span>
            </li>
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>净利润</h4><p class="Quantity color_red">${commission}</p></span>
            </li>
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>分红购买金额</h4><p class="Quantity color_red">${SUMShareProfit}</p></span>
            </li>
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>现金金额</h4><p class="Quantity color_red">${chuSUMShareProfit}</p></span>
            </li>
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>运营成本</h4><p class="Quantity color_red">${cost}</p></span>
            </li>
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>微信总金额</h4><p class="Quantity color_red">${SUMWeiXinPay}</p></span>
            </li>
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>支付宝总金额</h4><p class="Quantity color_red">${SUMZhiFuBaoPay}</p></span>
            </li>
        </ul>
    </div>
    <div class="t_Record">
        <div id="main" style="height:400px; overflow:hidden; width:100%; overflow:auto"></div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $(".t_Record").width($(window).width() - 60);
        //当文档窗口发生改变时 触发  
        $(window).resize(function () {
            $(".t_Record").width($(window).width() - 60);
        });
    });

    require.config({
        paths: {
            echarts: '${pageContext.request.contextPath}/static/admin/assets/dist'
        }
    });
    require(
        [
            'echarts',
            'echarts/theme/macarons',
            'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
            'echarts/chart/bar'
        ],
        function (ec, theme) {
            var myChart = ec.init(document.getElementById('main'), theme);
            option = {
                title: {
                    text: '月购买订单交易记录',
                    subtext: '实时获取用户订单购买记录'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['所有订单', '待付款', '待发货', '待收货', '待评价']
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line', 'bar']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '所有订单',
                        type: 'bar',
                        data: ${allCountArray},
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
                    },{
                        name: '待付款',
                        type: 'bar',
                        data: ${unPayCountArray},
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
                    },{
                        name: '待发货',
                        type: 'bar',
                        data: ${unDeliverCountArray},
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
                    },{
                        name: '待收货',
                        type: 'bar',
                        data: ${unReciveCountArray},
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
                    },{
                        name: '待评价',
                        type: 'bar',
                        data: ${unEvaluteCountArray},
                        markPoint: {
                            data: [
                                {type: 'max', name: '最大值'},
                                {type: 'min', name: '最小值'}
                            ]
                        }
                    }
                ]
            };
            myChart.setOption(option);
        }
    );
</script> 