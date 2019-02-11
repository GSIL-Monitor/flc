<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="<%=basePath%>static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/css/style.css"/>
    <link href="${pageContext.request.contextPath}/static/admin/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]><![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/dist/echarts.js"></script>
    <title>合伙人管理--合伙人角色管理</title>
    <style>
        .widget-box1
        {
            padding: 0;
            width:220px;
            -webkit-box-shadow: none;
            box-shadow: none;
            border-right: 1px solid #CCC;
            height:100%;
            overflow: auto;
        }
    </style>
</head>

<body>
<div class="grading_style">
    <div id="category">
        <div id="scrollsidebar" class="left_Treeview">
            <div class="show_btn" id="rightArrow"><span></span></div>
            <div class="widget-box1 side_content">
                <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                <div class="side_list">
                    <div class="widget-header header-color-green2">
                        <h4 class="lighter smaller">合伙人角色</h4>
                    </div>
                    <div class="widget-body">
                        <ul class="b_P_Sort_list">
                            <li><i class="orange  fa fa-user-secret"></i><a href="#">全部(${userListSize})</a></li>
                            <li><i class="fa fa-diamond pink "></i> <a href="#">消费者(${user1})</a></li>
                            <li><i class="fa fa-diamond pink "></i> <a href="#">事业合伙人(${user2})</a></li>
                            <li><i class="fa fa-diamond pink "></i> <a href="#">高级合伙人(${user3})</a></li>
                            <li><i class="fa fa-diamond pink "></i> <a href="#">创始合伙人(${user4})</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--右侧样式-->
        <div class="page_right_style right_grading">
            <div class="Statistics_style" id="Statistic_pie">
                <div class="type_title">合伙人角色统计
                    <span class="top_show_btn Statistic_btn">显示</span>
                    <span class="Statistic_title Statistic_btn"><a title="隐藏" class="top_close_btn">隐藏</a></span>
                </div>
                <div id="Statistics" class="Statistics"></div>
            </div>
            <!--列表样式-->
            <div class="grading_list">
                <div class="type_title">全部合伙人角色列表</div>
                <div class="table_menu_list">
                    <table class="table table-striped table-bordered table-hover" id="sample-table">
                        <thead>
                        <tr>
                            <th width="150">用户名</th>
                            <th width="150">手机</th>
                            <th width="150">考核积分</th>
                            <th width="200">加入时间</th>
                            <th width="180">合伙人角色</th>
                            <th width="250">状态</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.userNick}</td>
                                    <td>${user.userTel}</td>
                                    <td>${user.userPersonalIntegral + user.userDistributionIntegral}</td>
                                    <td>${user.userAddtime}</td>
                                    <td>
                                        <c:if test="${user.userRole == 1}">消费者</c:if>
                                        <c:if test="${user.userRole == 2}">事业合伙人</c:if>
                                        <c:if test="${user.userRole == 3}">高级合伙人</c:if>
                                        <c:if test="${user.userRole == 4}">创始合伙人</c:if>
                                    </td>
                                    <td class="td-status">
                                        <c:if test="${user.userStatus == 1}">
                                            <span class="label label-success radius">已启用</span>
                                        </c:if>
                                        <c:if test="${user.userStatus == 2}">
                                            <span class="label label-defaunt radius">已停用</span>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    //初始化宽度、高度
    $(".widget-box").height($(window).height());
    $(".page_right_style").width($(window).width() - 220);
    //$(".table_menu_list").width($(window).width()-240);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height());
        $(".page_right_style").width($(window).width() - 220);
        //$(".table_menu_list").width($(window).width()-240);
    })
    //分页
    $('#sample-table').dataTable({
        "bProcessing" : true,//是否显示进度提示
        "aaSorting": [[ 3, "desc" ]],//默认第几个排序
        "aLengthMenu" : [5,10,20,50,100],
        "bAutoWidth" : true,
        "aoColumnDefs": [
            {"orderable":false,"aTargets":[0,1,2,4,5]}// 制定列不参与排序
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
    $(function () {
        $("#category").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 20,
            // spacingh: 240,
            set_scrollsidebar: '.right_grading',
        });
        $("#Statistic_pie").fix({
            float: 'top',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 0,
            spacingh: 0,
            close_btn: '.top_close_btn',
            show_btn: '.top_show_btn',
            side_list: '.Statistics',
            close_btn_width: 80,
            side_title: '.Statistic_title',
        });

    });
    /******图标配置********/
    require.config({
        paths: {
            echarts: '${pageContext.request.contextPath}/static/admin/assets/dist'
        }
    });
    require(
        [
            'echarts',
            'echarts/theme/macarons',
            'echarts/chart/pie',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
            'echarts/chart/funnel'
        ],
        function (ec, theme) {
            var myChart = ec.init(document.getElementById('Statistics'), theme);
            option = {
                title: {
                    text: '用户各合伙人角色人数统计',
                    subtext: '实时更新最新合伙人角色',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    x: 'center',
                    y: 'bottom',
                    data: ['消费者', '事业合伙人', '高级合伙人', '创始合伙人']
                },
                toolbox: {
                    show: false,
                    feature: {
                        mark: {show: false},
                        dataView: {show: false, readOnly: true},
                        magicType: {
                            show: true,
                            type: ['pie', 'funnel'],
                            option: {
                                funnel: {
                                    x: '25%',
                                    width: '50%',
                                    funnelAlign: 'left',
                                    max: 6200
                                }
                            }
                        },
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                series: [
                    {
                        name: '人数统计',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: [
                            {value: ${user1}, name: '消费者'},
                            {value: ${user2}, name: '事业合伙人'},
                            {value: ${user3}, name: '高级合伙人'},
                            {value: ${user4}, name: '创始合伙人'}
                        ]
                    }
                ]
            };
            myChart.setOption(option);
        }
    );
</script>