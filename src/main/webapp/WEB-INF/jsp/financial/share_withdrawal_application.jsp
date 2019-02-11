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
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/displayPart.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>财务管理--提现申请</title>
</head>

<body>
<div class="margin clearfix">
    <div class="stystems_style">
        <div class="tabbable">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a data-toggle="tab" href="#keyword">个人分红提现</a></li>
                <li class=""><a data-toggle="tab" data-toggle="dropdown" class="dropdown-toggle" href="#other">商铺账户提现</a></li>
            </ul>
            <div class="tab-content">
                <!--关键词设置-->
                <div id="keyword" class="tab-pane active">
                    <div class="margin clearfix">
                        <div class="Feedback_style">
                            <div class="prompt">当前共有<strong style="color: #F63;" class="userSize">0</strong>位用户申请提现</div>
                            <div class="audit_list">
                                <table class="table table-striped table-bordered table-hover" id="table1">
                                    <thead>
                                        <tr>
                                            <th width="150">用户名</th>
                                            <th width="150">手机</th>
                                            <th width="150">提现金额</th>
                                            <th width="150">提现方式</th>
                                            <th width="150">提现账号</th>
                                            <th width="150">申请时间</th>
                                            <th width="250">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody class="user">
                                        <%--<tr>--%>
                                            <%--<td>李五</td>--%>
                                            <%--<td>16000000000</td>--%>
                                            <%--<td>100</td>--%>
                                            <%--<td>支付宝</td>--%>
                                            <%--<td>15000000350</td>--%>
                                            <%--<td>2008-7-23 10:10:10</td>--%>
                                            <%--<td class="td-manage">--%>
                                                <%--<a onclick="" href="javascript:void(0);" class="btn btn-xs btn-success">--%>
                                                    <%--<em class="fa bigger-120">同意</em>--%>
                                                <%--</a>--%>
                                                <%--<a onclick="cancel_save();" href="javascript:void(0);" class="btn btn-xs ">--%>
                                                    <%--<em class="fa bigger-120">驳回</em>--%>
                                                <%--</a>--%>
                                            <%--</td>--%>
                                        <%--</tr>--%>
                                    </tbody>
                                </table>
                                <div style="color: #cccccc;">* 请先线下进行打款，再在平台进行同意操作</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--其他设置-->
                <div id="other" class="tab-pane">
                    <div class="form-group">
                        <div class="margin clearfix">
                            <div class="Feedback_style">
                                <div class="prompt">当前共有<strong style="color: #F63;" class="storeSize">0</strong>位用户申请提现</div>
                                <div class="audit_list">
                                    <table class="table table-striped table-bordered table-hover" id="table2">
                                        <thead>
                                            <tr>
                                                <th width="150">用户名</th>
                                                <th width="150">手机</th>
                                                <th width="150">提现金额</th>
                                                <th width="150">提现方式</th>
                                                <th width="150">提现账号</th>
                                                <th width="150">申请时间</th>
                                                <th width="250">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody class="store">
                                            <%--<tr>--%>
                                                <%--<td>李五</td>--%>
                                                <%--<td>16000000000</td>--%>
                                                <%--<td>100</td>--%>
                                                <%--<td>支付宝</td>--%>
                                                <%--<td>15000000350</td>--%>
                                                <%--<td>2008-7-23 10:10:10</td>--%>
                                                <%--<td class="td-manage">--%>
                                                    <%--<a onclick="" href="javascript:void(0);" class="btn btn-xs btn-success">--%>
                                                        <%--<em class="fa bigger-120">同意</em>--%>
                                                    <%--</a>--%>
                                                    <%--<a onclick="cancel_save();" href="javascript:void(0);" class="btn btn-xs ">--%>
                                                        <%--<em class="fa bigger-120">驳回</em>--%>
                                                    <%--</a>--%>
                                                <%--</td>--%>
                                            <%--</tr>--%>
                                        </tbody>
                                    </table>
                                    <div style="color: #cccccc;">* 请先线下进行打款，再在平台进行同意操作</div>
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
    $(document).ready(function () {
        /******************获取用户分红提现**********************/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getUserProfitWithdrawLogs',
            dataType : 'json',
            success : function (result) {
                if (result != null && result.length > 0) {
                    var str = "";
                    for (var i = 0; i < result.length; i++ ){
                        str += "<tr>";
                            str += "<td>"+result[i].userNick+"</td>";
                            str += "<td>"+result[i].userTel+"</td>";
                            str += "<td>"+result[i].withdrawMoney+"</td>";
                            str += "<td>"+result[i].withdrawType+"</td>";
                            str += "<td>"+result[i].withdrawAccount+"</td>";
                            str += "<td>"+result[i].applicationTime+"</td>";
                            str += "<td class='td-manage'>";
                                str += "<a onclick='approve("+result[i].id+");' href='javascript:void(0);' class='btn btn-xs btn-success'>";
                                str += "<em class='fa bigger-120'>同意</em></a>";
                                str += "<a onclick='cancel_save("+result[i].id+","+result[i].userId+","+result[i].withdrawMoney+","+result[i].userRole+");' href='javascript:void(0);' class='btn btn-xs'>";
                                str += "<em class='fa bigger-120'>驳回</em></a>";
                            str += "</td>";
                        str += "</tr>";
                    }
                    $(".userSize").html(result.length);
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='7'>对不起，没有查询到相关数据！</td></tr>";
                    $(".userSize").html(0);
                }
                $(".user").html(str);
                //分页
                $('#table1').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 5, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [5,10,20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,3,4,6]}// 制定列不参与排序
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
                layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });

        /******************获取商铺分红提现**********************/
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getStoreProfitWithdrawLogs',
            dataType : 'json',
            success : function (result) {
                if (result != null && result.length > 0) {
                    var str = "";
                    for (var i = 0; i < result.length; i++ ){
                        str += "<tr>";
                            str += "<td>"+result[i].userNick+"</td>";
                            str += "<td>"+result[i].userTel+"</td>";
                            str += "<td>"+result[i].withdrawMoney+"</td>";
                            str += "<td>"+result[i].withdrawType+"</td>";
                            str += "<td>"+result[i].withdrawAccount+"</td>";
                            str += "<td>"+result[i].applicationTime+"</td>";
                            str += "<td class='td-manage'>";
                                str += "<a onclick='approve("+result[i].id+");' href='javascript:void(0);' class='btn btn-xs btn-success'>";
                                str += "<em class='fa bigger-120'>同意</em></a>";
                                str += "<a onclick='cancel_save("+result[i].id+","+result[i].userId+","+result[i].withdrawMoney+","+result[i].userRole+");' href='javascript:void(0);' class='btn btn-xs'>";
                                str += "<em class='fa bigger-120'>驳回</em></a>";
                            str += "</td>";
                        str += "</tr>";
                    }
                    $(".storeSize").html(result.length);
                }else{
                    str += "<tr style='text-align: center;color:#333333;'><td colspan='7'>对不起，没有查询到相关数据！</td></tr>";
                    $(".storeSize").html(0);
                }
                $(".store").html(str);
                //分页
                $('#table2').dataTable({
                    "bProcessing" : true,//是否显示进度提示
                    "aaSorting": [[ 5, "desc" ]],//默认第几个排序
                    "aLengthMenu" : [5,10,20,50,100],
                    "bAutoWidth" : true,
                    "aoColumnDefs": [
                        {"orderable":false,"aTargets":[0,1,2,3,4,6]}// 制定列不参与排序
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
                layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    })

    /************************同意**************************/
    function approve(id) {
        layer.confirm('确认要同意吗？', function (index) {
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/update_ProfitWithdrawLogStatus',
                dataType : 'json',
                data : {
                    id : id
                },
                success : function (result) {
                    if (result){
                        layer.msg('已同意!', {icon: 1, time: 1000},function () {
                            window.location.reload();
                        });
                    }else{
                        layer.msg('修改失败，请稍后再试！', {icon: 7, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    }

    /*********************************拒绝********************************/
    function cancel_save(id,userId,withdrawMoney,userRole) {
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
                        url : '${pageContext.request.contextPath}/admin/reject_ProfitWithdrawLog',
                        dataType : 'json',
                        data : {
                            withdrawMoney : withdrawMoney,
                            userId :userId,
                            withdrawRejectReason : $("#form_textarea").val(),
                            userRole:userRole,
                            id : id
                        },
                        success : function (result) {
                            if (result){
                                layer.msg('操作成功!', {icon: 1, time: 1000},function () {
                                    window.location.reload();
                                });
                            }else{
                                layer.msg('操作失败，请稍后再试！', {icon: 7, offset: 't'});
                            }
                            layer.close(index);
                        },
                        error : function () {
                            layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                        }
                    });
                }
            }
        })
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