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
    <script src="${pageContext.request.contextPath}/static/admin/assets/dist/echarts.js" type="text/javascript"></script>
    <title>交易管理--交易金额</title>
</head>

<body>
<div class="margin clearfix">
    <div class="amounts_style">
        <div class="transaction_Money clearfix">
            <div class="Money">
                <span>成交总额：${sum}元</span>
                <p>统计时间:${newTime}</p>
            </div>
            <div class="Money">
                <span><em>￥</em>${todaySum}元</span>
                <p>当天成交额</p>
            </div>
            <div class="l_f Statistics_btn">
                <a href="javascript:void(0);" title="当月统计" onclick="Statistics_btn()" class="btn  btn-info btn-sm no-radius">
                    <i class="bigger fa fa-bar-chart "></i>
                    <h5 class="margin-top">当月统计</h5>
                </a>
            </div>
        </div>
        <div class="border clearfix">
            <span class="l_f">
                <a href="javascript:void(0);" class="btn btn-info" onclick="go_amounts()">全部订单</a>
                <a href="javascript:void(0);" onclick="getTodayOrder();" class="btn btn-danger">当天订单</a>
                <a href="javascript:void(0);" onclick="getMonthOrder();" class="btn btn-danger">当月订单</a>
            </span>
        </div>
        <div class="Record_list">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                    <tr>
                        <th width="200px">订单编号</th>
                        <th width="180px">成交时间</th>
                        <th width="120px">成交金额(元)</th>
                        <th width="180px">状态</th>
                    </tr>
                </thead>
                <tbody class="order">
                    <c:if test="${orderList == null}">
                        <tr style='text-align: center;color:#333333;'><td>对不起，没有查询到相关数据！</td></tr>
                    </c:if>
                    <c:if test="${orderList != null}">
                        <c:forEach items="${orderList}" var="order">
                            <tr>
                                <td>${order.orderNum}</td>
                                <td>${order.orderEvaluateTime}</td>
                                <td>${order.goodsActualPrice}</td>
                                <c:if test="${order.orderStatus == 1}">
                                    <td>待支付</td>
                                </c:if>
                                <c:if test="${order.orderStatus == 2}">
                                    <td>待发货</td>
                                </c:if>
                                <c:if test="${order.orderStatus == 3}">
                                    <td>待收货</td>
                                </c:if>
                                <c:if test="${order.orderStatus == 4}">
                                    <td>待评价</td>
                                </c:if>
                                <c:if test="${order.orderStatus == 5}">
                                    <td>交易成功</td>
                                </c:if>
                                <c:if test="${order.orderStatus == 6}">
                                    <td>取消订单</td>
                                </c:if>
                                <c:if test="${order.orderStatus == 7}">
                                    <td>退货退款</td>
                                </c:if>
                                <c:if test="${order.orderStatus == 8}">
                                    <td>退款成功</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div id="Statistics" style="display:none">
    <div id="main" style="height:400px; overflow:hidden; width:1000px; overflow:auto"></div>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $('#sample-table').dataTable({
            "bProcessing" : true,//是否显示进度提示
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "aLengthMenu" : [5,10,20,50,100],
            "bAutoWidth" : true,
            "aoColumnDefs": [
                {"orderable":false,"aTargets":[0,2,3]}// 制定列不参与排序
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

        //统计
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
                    tooltip: {
                        trigger: 'axis'
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
                    legend: {
                        data: ['成交订单', '失败订单', '成交金额']
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            name: '订单',
                            axisLabel: {
                                formatter: '{value} 单'
                            }
                        },
                        {
                            type: 'value',
                            name: '金额',
                            axisLabel: {
                                formatter: '{value} 元'
                            }
                        }
                    ],
                    series: [
                        {
                            name: '成交订单',
                            type: 'bar',
                            data: ${finishedOrderArray}
                        },
                        {
                            name: '失败订单',
                            type: 'bar',
                            data: ${refundOrderArray}
                        },
                        {
                            name: '成交金额',
                            type: 'line',
                            yAxisIndex: 1,
                            data: ${finishedOrderSUMArray}
                        }
                    ]
                };
                myChart.setOption(option);
            }
        )
    });


    //全部订单
    function go_amounts() {
        layer.load(2);
        window.location.href = "${pageContext.request.contextPath}/admin/go_amounts";
    }
    //当天订单
    function getTodayOrder() {
        layer.load(2);
        window.location.href = "${pageContext.request.contextPath}/admin/getTodayOrder";
    }
    //当月订单
    function getMonthOrder() {
        layer.load(2);
        window.location.href = "${pageContext.request.contextPath}/admin/getMonthOrder";
    }
    
    //当月统计
    function Statistics_btn() {
        var index = layer.open({
            type: 1,
            title: '当月销售统计',
            maxmin: true,
            shadeClose: false,
            area: ['1000px', ''],
            content: $('#Statistics'),
            btn: ['确定', '取消'],
        })
    }

</script>
