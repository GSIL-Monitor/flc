<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.css"
          type="text/css">
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/displayPart.js" type="text/javascript"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>交易金额</title>
</head>

<body>
<c:if test="${msg!=null}">
    <h3 style="color:red">${msg}</h3>
</c:if>
<div class="margin clearfix">
    <div class="Shops_Audit">
        <div class="prompt">当前共有<b>${storeAuditListLength}</b>家店铺申请入住</div>
        <!--申请列表-->
        <div class="audit_list">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                <tr>
                    <th width="200px">店铺名称</th>
                    <th width="150px">所属分类</th>
                    <th width="120px">联系人</th>
                    <th width="120px">联系方式</th>
                    <th width="180px">统一社会信用代码</th>
                    <th width="120px">成立日期</th>
                    <th width="">地址</th>
                    <th width="150px">添加时间</th>
                    <th width="250px">操作</th>
                </tr>
                </thead>
                <tbody>
<c:forEach items="${storeAuditList}" var="store"  >
                <tr>
                    <td>${store.storeName}</td>
                    <td>${store.classifyName}</td>
                    <td>${store.storeContactPeople}</td>
                    <td>${store.storeContactPeopleTel}</td>
                    <td>${store.socialCreditCode}</td>
                    <td>${store.companyEstablishmentDate}</td>
                    <td>${store.companyRegisteredAddress}</td>
                    <td>${store.storeAddtime}</td>
                    <td class="td-manage">
                        <a title="店铺详细"
                           href="${pageContext.request.contextPath}/store/getstorebyid?audit=audit&id=${store.id}"
                           class="btn btn-xs btn-info Refund_detailed">详细</a>
                        <a title="删除" href="javascript:;"
                           onclick="member_del(this,${store.id})"
                           class="btn btn-xs btn-danger">删除</a>
                    </td>
                </tr>
</c:forEach>
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
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/store/removerstore",
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
</script>
<script type="text/javascript">
    //分页
    $('#sample-table').dataTable({
        "aaSorting": [[7, "asc"]],//默认第几个排序
        "bProcessing": true,//是否显示进度提示
        "aLengthMenu": [5, 10, 20, 50, 100],
        "bAutoWidth": true,
        "aoColumnDefs": [
            {"orderable": false, "aTargets": [1, 2, 3, 4, 5, 6,0,]}// 制定列不参与排序
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
</script>
