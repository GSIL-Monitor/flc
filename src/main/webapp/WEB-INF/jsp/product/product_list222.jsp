<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
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
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/H-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/admin/js/H-ui.admin.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>产品管理--产品列表</title>
</head>
<body>
<div class="clearfix">
    <div class="article_style" id="products_style">


        <!--产品列表展示-->
        <%--<div class="h_products_list clearfix" id="products_list">--%>
            <div id="scrollsidebar" class="left_Treeview">
                <div class="show_btn" id="rightArrow"><span></span></div>
                <div class="widget-box side_content">
                    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                    <div class="side_list">
                        <div class="widget-header header-color-green2">
                            <h4 class="lighter smaller">产品分类</h4>
                        </div>
                        <div class="widget-body">
                            <ul class="b_P_Sort_list">

                                <li><i class="orange  fa fa-list "></i>
                                    <a href="#">全部(${goodsVoListSize})</a></li>

                                <c:forEach items="${isClassiyOneGoodsCount}" var="goodsClassiy">

                                    <li><i class="fa fa-shopping-bag pink "></i> <a
                                            href="#">${goodsClassiy.oneClassifyName}(${goodsClassiy.isClassiyOneGoodsCount})</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


            <div class="article_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="80px">产品编号</th>
                        <th width="250px">产品名称</th>
                        <th width="50px">供货价</th>
                        <th width="50px">零售价</th>
                        <th width="50px">库存量</th>
                        <th width="100px">发货地</th>
                        <th width="100px">所属商家</th>
                        <th width="150px">添加时间</th>
                        <th width="120px">热销(平台)</th>
                        <th width="120px">新品(平台)</th>
                        <th width="80px">审核状态</th>
                        <th width="250px">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${goodsVoList}" var="goodsVo">
                        <tr>
                            <td width="80px">${goodsVo.id}</td>
                            <td width="250px">${goodsVo.goodsName}</td>
                            <td width="50px">${goodsVo.goodsSupplyPrice}</td>
                            <td width="50px">${goodsVo.goodsRetailPrice}</td>
                            <td width="50px">${goodsVo.goodsInventory}</td>
                            <td width="100px">${goodsVo.goodsDispatchPlace}</td>
                            <td width="100px"><u style="cursor:pointer" class="text-primary"
                                                 onclick="store_show('查看商铺信息','${pageContext.request.contextPath}/store/getstorebyid',${goodsVo.storeId},'1500','700')">${goodsVo.storeName}</u>
                            </td>


                            <td width="150px">${goodsVo.goodsAddtime}</td>
                                <%--热销--%>
                            <td class="td-select">
                                <c:if test="${goodsVo.plateIsbelongHotFlag ==1}">
                                    <a onClick="plate_isbelong_hot_flag(this,${goodsVo.id},1)" href="javascript:void(0);"
                                       title="是" class="btn btn-xs btn-success">
                                        <i class="icon-ok bigger-120"></i>
                                    </a>
                                </c:if>
                                <c:if test="${goodsVo.plateIsbelongHotFlag ==2}">
                                    <a onClick="plate_isbelong_hot_flag(this,${goodsVo.id},2)" href="javascript:void(0);"
                                       title="否" class="btn btn-xs">
                                        <i class="icon-ok bigger-120"></i>
                                    </a>
                                </c:if>
                            </td>

                                <%--新品--%>
                            <td class="td-select">
                                <c:if test="${goodsVo.plateIsbelongNewFlag ==1}">
                                    <a onClick="plate_isbelong_new_flag(this,${goodsVo.id},1)" href="javascript:void(0);"
                                       title="是" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                                </c:if>
                                <c:if test="${goodsVo.plateIsbelongNewFlag ==2}">
                                    <a onClick="plate_isbelong_new_flag(this,${goodsVo.id},2)" href="javascript:void(0);"
                                       title="否" class="btn btn-xs"> <i class="icon-ok bigger-120"></i> </a>
                                </c:if>
                            </td>
                            <td class="td-status">
                                <c:if test="${goodsVo.goodsStatus == 2}">
                                    <span class="label label-success radius">营销中</span>
                                </c:if>
                                <c:if test="${goodsVo.goodsStatus == 3}">
                                    <span class="label label-success radius">已下架</span>
                                </c:if>
                                <c:if test="${goodsVo.goodsStatus == 4}">
                                    <span class="label label-success radius">违规下架</span>
                                </c:if>
                            </td>
                            <td class="td-manage">

                                <c:if test="${goodsVo.goodsStatus != 3}">
                                    <a onClick="product_stop(this,${goodsVo.id})" href="javascript:void(0);" title="下架"
                                       class="btn btn-xs">下架 </a>
                                </c:if>


                                <a title="产品详情"
                                   href="${pageContext.request.contextPath}/goods/getgoodsbyid?id=${goodsVo.id}"
                                   class="btn btn-xs btn-warning">
                                    <i class="icon-list-alt bigger-120"></i>
                                </a>
                                <a title="删除" href="javascript:void(0);" onclick="member_del(this,${goodsVo.id})"
                                   class="btn btn-xs btn-danger">
                                    <i class="icon-trash  bigger-120"></i>
                                </a>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%--</div>--%>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $("#products_style").fix({
            float: 'left',
            height : '780px',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 30,//设置隐藏时的距离
            spacingh: 260,//设置显示时间距
        });
    });
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

    /*热销状态变更*/
    function plate_isbelong_hot_flag(obj, id, icode) {
        var str;
        var icodes = icode;
        if (icode == 1) {
            str = '确定将商品取消热销状态吗';
        }

        if (icode == 2) {
            str = '确定将商品变更为热销状态吗';
        }
        layer.confirm(str, function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/goods/modifyhot",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {
                        console.log(icodes)
                        layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                            /*刷新页面*/
                            location.reload();
                        });
                    } else {
                        layer.msg(data.msg, {icon: 2, offset: 't'})
                    }
                }
            });
        });
    }

    /*新品状态变更*/
    function plate_isbelong_new_flag(obj, id, icode) {
        var icodes = icode;
        var str;
        if (icodes == 1) {
            str = '确定将商品取消新品状态吗';
        }

        if (icodes == 2) {
            str = '确定将商品变更为新品状态吗';
        }
        layer.confirm(str, function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/goods/modifynew",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {
                        layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                            /*刷新页面*/
                            location.reload();
                        });
                    } else {
                        layer.msg(data.msg, {icon: 2, offset: 't'})
                    }
                }
            });
        });
    }


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


    //下架
    function product_stop(obj, id) {
        var id = id;
        var index = layer.open({
            type: 1,
            maxmin: true,
            shadeClose: false,
            area: ['600px', ''],
            content: ('<div class="shop_reason"><span class="content">请说明下架该商品的理由，以便在商家再次申请上架时做好准备。</span><textarea name="请填写下架理由" class="form-control" id="form_textarea" placeholder="请填写下架理由" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">500</span>字</span></div>'),
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                if ($('.form-control').val() == "") {
                    layer.alert('回复内容不能为空！', {
                        title: '提示框',
                        icon: 0,
                    })
                } else {
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/goods/goodssoldout",
                        data: {"id": id, "reason": $('.form-control').val()},
                        dataType: "json",
                        success: function (data) {
                            if (data.code == 2000) {
                                console.log(12300000000000000000000000000000)
                                layer.msg('下架成功!', {icon: 1, time: 1000});
                                location.reload();
                            } else {
                                layer.msg(data.msg, {icon: 5, time: 1000});
                            }
                        }
                    });


                }
            }
        })
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

