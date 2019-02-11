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
    <script src="${pageContext.request.contextPath}/static/admin/js/displayPart.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/H-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/H-ui.admin.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>消息管理--举报管理</title>
</head>

<body>
<div class="margin clearfix">
    <div class="stystems_style">
        <div class="tabbable">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a data-toggle="tab" href="#keyword">&nbsp;举报商品</a></li>
                <li class=""><a data-toggle="tab" data-toggle="dropdown" class="dropdown-toggle" href="#other">举报店铺</a></li>
            </ul>
            <div class="tab-content">
                <!--举报商品-->
                <div id="keyword" class="tab-pane active">
                    <div class="margin clearfix">
                        <div class="Feedback_style">
                            <div class="feedback">
                                <table class="table table-striped table-bordered table-hover" id="table1">
                                    <thead>
                                        <tr>
                                            <th width="100px">用户名</th>
                                            <th width="160px">举报商品</th>
                                            <th width="200px">举报描述</th>
                                            <th width="180px">举报时间</th>
                                            <th width="180px">操作备注</th>
                                            <th width="180px">操作时间</th>
                                            <th width="180px">操作者</th>
                                            <th width="180px">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody class="goodsReport">
                                        <%--<tr>--%>
                                            <%--<td>1</td>--%>
                                            <%--<td>张小泉</td>--%>
                                            <%--<td>抄袭</td>--%>
                                            <%--<td>女士长裙</td>--%>
                                            <%--<td>详情页图片涉嫌抄袭</td>--%>
                                            <%--<td>2018-08-11</td>--%>
                                            <%--<td>已强制下架</td>--%>
                                            <%--<td>2018-08-12</td>--%>
                                            <%--<td>admin</td>--%>
                                            <%--<td class="td-status"><span class="label label-success radius">已处理</span></td>--%>
                                            <%--<td class="td-manage">--%>
                                                <%--<a onclick="cancel_save();" href="javascript:void(0);" class="btn btn-xs btn-warning">--%>
                                                    <%--<i class="fa fa-check bigger-120"></i>--%>
                                                <%--</a>--%>
                                                <%--<a onclick="" href="javascript:void(0);" class="btn btn-xs btn-danger">--%>
                                                    <%--<i class="fa fa-trash bigger-120"></i>--%>
                                                <%--</a>--%>
                                            <%--</td>--%>
                                        <%--</tr>--%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!--举报店铺-->
                <div id="other" class="tab-pane">
                    <div class="form-group">
                        <div class="margin clearfix">
                            <div class="Feedback_style">
                                <div class="feedback">
                                    <table class="table table-striped table-bordered table-hover" id="table2">
                                        <thead>
                                            <tr>
                                                <th width="100px">用户名</th>
                                                <th width="160px">举报商铺</th>
                                                <th width="200px">举报描述</th>
                                                <th width="180px">举报时间</th>
                                                <th width="180px">操作备注</th>
                                                <th width="180px">操作时间</th>
                                                <th width="180px">操作者</th>
                                                <th width="180px">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody class="storeReport">
                                            <%--<tr>--%>
                                                <%--<td>1</td>--%>
                                                <%--<td>张小泉</td>--%>
                                                <%--<td>抄袭</td>--%>
                                                <%--<td>女士长裙</td>--%>
                                                <%--<td>详情页图片涉嫌抄袭</td>--%>
                                                <%--<td>2018-08-11</td>--%>
                                                <%--<td>已强制下架</td>--%>
                                                <%--<td>2018-08-12</td>--%>
                                                <%--<td>admin</td>--%>
                                                <%--<td class="td-status"><span class="label label-success radius">已处理</span>--%>
                                                <%--</td>--%>
                                                <%--<td class="td-manage">--%>
                                                    <%--<a onclick="" href="javascript:void(0);" class="btn btn-xs btn-warning">--%>
                                                        <%--<i class="fa fa-check bigger-120"></i>--%>
                                                    <%--</a>--%>
                                                    <%--<a onclick="cancel_save();" href="javascript:void(0);" class="btn btn-xs btn-danger">--%>
                                                        <%--<i class="fa fa-trash bigger-120"></i>--%>
                                                    <%--</a>--%>
                                                <%--</td>--%>
                                            <%--</tr>--%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $().ready(function () {
        /*获取举报商品列表*/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getGoodsReports',
            dataType : 'json',
            success : function (result) {
                if (result != null){
                    var str = "";
                    for (var i = 0; i < result.length; i++){
                        str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        str += "<td>"+result[i].goodsName+"</td>";
                        str += "<td>"+result[i].reportDescribe+"</td>";
                        str += "<td>"+result[i].reportAddtime+"</td>";
                        if (result[i].operationNote == undefined){
                            str += "<td></td>";
                        }else{
                            str += "<td>"+result[i].operationNote+"</td>";
                        }
                        str += "<td>"+result[i].operationTime+"</td>";
                        str += "<td>"+result[i].operationHandler+"</td>";
                        str += "<td class='td-manage'>";
                        if (result[i].operationNote == null){
                            str += "<a title='状态' href='javascript:void(0);' class='btn btn-xs btn-warning' onclick='reply("+result[i].id+");'>";
                            str += "<em class='fa fa-check bigger-120'></em></a>";
                        }
                        str += "<a href='javascript:void(0);' onclick='report_del("+result[i].id+");' title='删除'' class='btn btn-xs btn-danger'>";
                        str += "<i class='fa fa-trash  bigger-120'></i></a>";
                        str += "</td>";
                        str += "</tr>";
                    }
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='7'>对不起，没有查询到相关数据！</td></tr>";
                }
                $(".goodsReport").html(str);

                //分页
                $('#table1').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 3, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [5,10,20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,4,6,7]}// 制定列不参与排序
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
            },
            error : function () {
                layer.msg('获取举报商品列表出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });

        /*获取举报商铺列表*/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getReportsStore',
            dataType : 'json',
            success : function (result) {
                if (result != null){
                    var str = "";
                    for (var i = 0; i < result.length; i++){
                        str += "<tr>";
                        str += "<td>"+result[i].userNick+"</td>";
                        str += "<td>"+result[i].goodsName+"</td>";
                        str += "<td>"+result[i].reportDescribe+"</td>";
                        str += "<td>"+result[i].reportAddtime+"</td>";
                        if (result[i].operationNote == undefined){
                            str += "<td></td>";
                        }else{
                            str += "<td>"+result[i].operationNote+"</td>";
                        }
                        str += "<td>"+result[i].operationTime+"</td>";
                        str += "<td>"+result[i].operationHandler+"</td>";
                        str += "<td class='td-manage'>";
                        if (result[i].operationNote == null){
                            str += "<a title='状态' href='javascript:void(0);' class='btn btn-xs btn-warning' onclick='reply("+result[i].id+");'>";
                            str += "<em class='fa fa-check bigger-120'></em></a>";
                        }
                        str += "<a href='javascript:void(0);' onclick='report_del("+result[i].id+");' title='删除'' class='btn btn-xs btn-danger'>";
                        str += "<i class='fa fa-trash  bigger-120'></i></a>";
                        str += "</td>";
                        str += "</tr>";
                    }
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='7'>对不起，没有查询到相关数据！</td></tr>";
                }
                $(".storeReport").html(str);

                //分页
                $('#table2').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 3, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [5,10,20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,4,6,7]}// 制定列不参与排序
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
            },
            error : function () {
                layer.msg('获取举报商铺列表出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    });

    function reply(id) {
        var index = layer.open({
            type: 1,
            title: '内容',
            maxmin: true,
            shadeClose: false,
            area: ['600px', ''],
            content: ('<div class="shop_reason"><textarea name="请填写拒绝理由" class="form-control" id="form_textarea" placeholder="请填写拒绝理由" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span>字</span></div>'),
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                if ($('.form-control').val() == "") {
                    layer.alert('回复内容不能为空！', {
                        title: '提示框',
                        icon: 0,
                    })
                } else {
                    $.ajax({
                        type : 'post',
                        url : '${pageContext.request.contextPath}/admin/reportReply',
                        dataType : 'json',
                        data : {
                            operationNote : $('.form-control').val(),
                            id : id
                        },
                        success : function (result) {
                            if (result) {
                                layer.msg('操作成功！', {icon: 6, offset: 't',time: 1000},function(){
                                    window.location.reload();
                                });
                                layer.close(index);
                            }else{
                                layer.msg('操作失败，请稍后再试！', {icon: 7, offset: 't'});
                            }
                        },
                        error : function () {
                            layer.msg('操作失败，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                }
            }
        })

    }


    /*举报-删除*/
    function report_del(id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/deleteReport',
                dataType : 'json',
                data : {
                    id : id
                },
                success : function (result) {
                    if (result) {
                        layer.msg('已删除!', {icon: 1, time: 1000},function () {
                            window.location.reload();
                        });
                    }else{
                        layer.msg('删除失败，请稍后再试！', {icon: 7, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('删除出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    }

    /*字数限制*/
    function checkLength(which) {
        var maxChars = 50; //
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

</html>