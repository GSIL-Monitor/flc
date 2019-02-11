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
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/H-ui.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/jquery.easy-pie-chart.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/numASMD.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/tools.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>交易管理--订单管理</title>
</head>

<body>
<div class="margin clearfix">
    <div class="cover_style" id="cover_style">
        <div class="top_style Order_form" id="Order_form_style">
            <div class="type_title">购物产品比例
                <div class="btn_style">
                    <a href="javascript:void(0);" class="xianshi_btn Statistic_btn">显示</a>
                    <a href="javascript:void(0);" class="yingchan_btn Statistic_btn b_n_btn">隐藏</a>
                </div>
            </div>
            <div class="hide_style clearfix">
                <%--<div class="proportion">--%>
                    <%--<div class="easy-pie-chart percentage" data-percent="30" data-color="#D15B47"><span class="percent">30</span>%</div>--%>
                    <%--<span class="name">食品类</span>--%>
                <%--</div>--%>
            </div>
        </div>
        <!--内容-->
        <div class="centent_style" id="centent_style">
            <div id="covar_list" class="order_list">
                <div id="scrollsidebar" class="left_Treeview">
                    <div class="show_btn" id="rightArrow"><span></span></div>
                    <div class="widget-box side_content">
                        <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                        <div class="side_list">
                            <div class="widget-header header-color-green2"><h4 class="lighter smaller">订单类型分类</h4></div>
                            <div class="widget-body">
                                <ul class="b_P_Sort_list">
                                    <%--<li><i class="orange  fa fa-reorder"></i><a href="#">全部订单(235)</a></li>--%>
                                    <%--<li><i class="fa fa-sticky-note pink "></i> <a href="#">食品类(235)</a></li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--左侧样式-->
                <div class="list_right_style">
                    <!--订单列表展示-->
                    <table class="table table-striped table-bordered table-hover" id="sample-table">
                        <thead>
                            <tr>
                                <th width="120px">订单编号</th>
                                <th width="250px">产品名称</th>
                                <th width="100px">总价</th>
                                <th width="100px">供货总价</th>
                                <th width="100px">用户</th>
                                <th width="100px">店铺名称</th>
                                <th width="100px">订单时间</th>
                                <th width="180px">所属类型</th>
                                <th width="80px">数量</th>
                                <th width="70px">状态</th>
                                <th width="200px">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orderList}">
                                <tr>
                                    <td>${order.orderNum}</td>
                                    <td>${order.goodsName}</td>
                                    <td>${order.goodsActualPrice}</td>
                                    <td>${order.goodsupplyPrice}</td>
                                    <td>${order.userNick}</td>
                                    <td>${order.storeName}</td>
                                    <td>${order.orderAddtime}</td>
                                    <td>${order.oneClassifyName}</td>
                                    <td>${order.goodsAmount}</td>
                                    <td class="td-status">
                                        <c:if test="${order.orderStatus == 1}">
                                            <span class="label label-success radius">
                                                待支付
                                            </span>
                                        </c:if>
                                        <c:if test="${order.orderStatus == 2}">
                                            <span class="label label-success radius">
                                                待发货
                                            </span>
                                        </c:if>
                                        <c:if test="${order.orderStatus == 3}">
                                            <span class="label label-success radius">
                                                待收货
                                            </span>
                                        </c:if>
                                        <c:if test="${order.orderStatus == 4}">
                                            <span class="label label-success radius">
                                                待评价
                                            </span>
                                        </c:if>
                                        <c:if test="${order.orderStatus == 5}">
                                            <span class="label label-success radius">
                                                交易成功
                                            </span>
                                        </c:if>
                                        <c:if test="${order.orderStatus == 6}">
                                            <span class="label label-success radius">
                                                取消订单
                                            </span>
                                        </c:if>
                                        <c:if test="${order.orderStatus == 7}">
                                            <span class="label label-danger radius">
                                                退货退款
                                            </span>
                                        </c:if>
                                        <c:if test="${order.orderStatus == 8}">
                                            <span class="label label-danger radius">
                                                退货退款
                                            </span>
                                        </c:if>
                                    </td>
                                    <td>
                                        <a title="订单详细" href="javascript:void(0);" onclick="go_order_detail('${order.orderNum}');" class="btn btn-xs btn-info order_detailed">
                                            <i class="fa fa-list bigger-120"></i>
                                        </a>
                                        <a title="删除" href="javascript:void(0);" onclick="Order_form_del(this,'${order.id}')" class="btn btn-xs btn-danger">
                                            <i class="fa fa-trash  bigger-120"></i>
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
</div>
</body>
</html>
<script type="text/javascript">
    //分页
    $('#sample-table').dataTable({
        "bProcessing" : true,//是否显示进度提示
        "aaSorting": [[ 5, "desc" ]],//默认第几个排序
        "aLengthMenu" : [8,15,20],
        "bAutoWidth" : true,
        "aoColumnDefs": [
            {"orderable":false,"aTargets":[1,2,3,4,6,7,8,9]}// 制定列不参与排序
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
    //左侧显示隐藏
    $(function () {
        $("#covar_list").fix({
            float: 'left',
            minStatue: false,
            skin: false,
            //durationTime :false,
            spacingw: 50,//设置隐藏时的距离
            spacingh: 270,//设置显示时间距
            stylewidth: '220',
            close_btn: '.close_btn',
            show_btn: '.show_btn',
            side_list: '.side_list',
            content: '.side_content',
            widgetbox: '.widget-box',
            da_height: null,
            table_menu: '.list_right_style'
        });
    });

    //初始化宽度、高度
    var heights = $(".top_style").outerHeight() + 47;
    $(".centent_style").height($(window).height() - heights);
    $(".page_right_style").width($(window).width() - 220);
    $(".left_Treeview,.list_right_style").height($(window).height() - heights - 2);
    $(".list_right_style").width($(window).width() - 250);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".centent_style").height($(window).height() - heights);
        $(".page_right_style").width($(window).width() - 220);
        $(".left_Treeview,.list_right_style").height($(window).height() - heights - 2);
        $(".list_right_style").width($(window).width() - 250);
    })
    /*获取左导航栏以及上部比例内容*/
    $.ajax({
        type : 'post',
        url : '${pageContext.request.contextPath}/admin/getOrderGroupByOneClassifyId',
        dataType : 'json',
        success : function (result) {
            // {"count":22,"orderList":[{"groupSum":18,"oneClassifyName":"家电电","oneClassifyid":1},{"groupSum":4,"oneClassifyName":"食品品","oneClassifyid":2}]}
            var order = result.orderList;
            if(result != null){
                var str = "";var str2 = "";
                str += "<li><i class='orange fa fa-reorder'></i><a href='javascript:void(0);'>全部订单("+result.count+")</a></li>";
                for (var i = 0; i < order.length; i++){
                    str += "<li><i class='fa fa-sticky-note pink'></i> <a href='#'>"+order[i].oneClassifyName+"("+order[i].groupSum+")</a></li>";

                    str2 += "<div class='proportion'>";
                        str2 += "<div class='easy-pie-chart percentage' data-percent='"+numMulti(numDiv(order[i].groupSum,result.count),100).toFixed(2)+"' data-color='"+color16()+"'><span class='percent'>"+numMulti(numDiv(order[i].groupSum,result.count),100).toFixed(2)+"</span>%</div>";
                        str2 += "<span class='name'>"+order[i].oneClassifyName+"</span>";
                    str2 += "</div>";
                }
            }
            $(".b_P_Sort_list").html(str);
            $(".hide_style").html(str2);

            var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
            $('.easy-pie-chart.percentage').each(function () {
                $(this).easyPieChart({
                    barColor: $(this).data('color'),
                    trackColor: '#EEEEEE',
                    scaleColor: false,
                    lineCap: 'butt',
                    lineWidth: 10,
                    animate: oldie ? false : 1000,
                    size: 103
                }).css('color', $(this).data('color'));
            });
            $('[data-rel=tooltip]').tooltip();
            $('[data-rel=popover]').popover({html: true});
            $("#cover_style").fix({
                float: 'top',
                minStatue: false,
                skin: 'green',
                durationTime: false,
                window_height: 30,//设置浏览器与div的高度值差
                spacingw: 0,//
                spacingh: 0,//
                close_btn: '.yingchan_btn',
                show_btn: '.xianshi_btn',
                side_list: '.hide_style',
                widgetbox: '.top_style',
                close_btn_width: 60,
                da_height: '#centent_style,.left_Treeview,.list_right_style',
                side_title: '.b_n_btn',
                content: null,
                left_css: '.left_Treeview,.list_right_style'
            });
        },
        error : function () {
            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
        }
    });

    /**
     * 跳转到订单详情页
     */
    function go_order_detail(orderNum) {
        window.location.href = "${pageContext.request.contextPath}/admin/go_order_detail?orderNum="+orderNum;
    }

    /*订单-删除*/
    function Order_form_del(obj, id) {
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
                    }else {
                        layer.msg('删除订单失败，请稍后再试!', {icon: 2, time: 1000});
                    }
                },
                error : function () {
                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    }
</script>