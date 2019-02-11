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
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <%--<script src="${pageContext.request.contextPath}/static/admin/js/H-ui.js" type="text/javascript"></script>--%>
    <script src="${pageContext.request.contextPath}/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>文章管理--文章列表</title>
</head>

<body>
<div class="page-content clearfix" style="padding: 15px 15px;">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <div class="border clearfix">
                <span class="l_f">
                    <a href="${pageContext.request.contextPath}/admin/go_article_add" title="添加文章" id="add_page" class="btn btn-warning">
                        <em class="fa fa-plus"></em> 添加文章
                    </a>
                </span>
            </div>
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                        <tr>
                            <th width="220px">标题</th>
                            <%--<th width="300px">内容</th>--%>
                            <th width="150px">添加时间</th>
                            <th width="150px">作者</th>
                            <th width="80px">状态</th>
                            <th width="180px">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="article" items="${articles}">
                            <tr>
                                <td>${article.articleTitle}</td>
                                <%--<td>${article.articleContent}</td>--%>
                                <td>${article.articleAddtime}</td>
                                <td>${article.articleAuthor}</td>
                                <c:if test="${article.articleType == 1}">
                                    <td class="td-status"><span class="label label-success radius">显示</span></td>
                                </c:if>
                                <c:if test="${article.articleType == 2}">
                                    <td class="td-status"><span class="label radius">隐藏</span></td>
                                </c:if>
                                <td class="td-manage">
                                    <c:if test="${article.articleType == 1}">
                                        <a title="隐藏" onClick="article_stop(this,${article.id})" href="javascript:void(0);" class="btn btn-xs">
                                            <em class="fa fa-remove bigger-120"></em>
                                        </a>
                                    </c:if>
                                    <c:if test="${article.articleType == 2}">
                                        <a title="显示" onClick="article_start(this,${article.id})" href="javascript:void(0);" class="btn btn-xs btn-success">
                                            <em class="fa fa-check bigger-120"></em>
                                        </a>
                                    </c:if>
                                    <a title="详情" onclick="go_articleDetail(${article.id});" href="javascript:void(0);" class="btn btn-xs btn-info" >
                                        <em class="fa fa-file-text bigger-120"></em>
                                    </a>
                                    <a title="编辑" onclick="go_articleUpdate(${article.id})" href="javascript:void(0);" class="btn btn-xs btn-warning" >
                                        <em class="fa fa-edit bigger-120"></em>
                                    </a>
                                    <a title="删除" href="javascript:void(0);"  onclick="article_del(${article.id})" class="btn btn-xs btn-danger" >
                                        <em class="fa fa-trash  bigger-120"></em>
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
</body>
</html>
<script type="text/javascript">
    //分页
    $('#sample-table').dataTable({
        "bProcessing" : true,//是否显示进度提示
        "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        "aLengthMenu" : [5,10,20,50,100],
        "bAutoWidth" : true,
        "aoColumnDefs": [
            {"orderable":false,"aTargets":[0,2,3,4]}// 制定列不参与排序
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
    //返回父窗口
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Order_form ,#Competence_add').on('click', function () {
        var cname = $(this).attr("title");
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe span').html(cname);
        parent.$('#parentIframe').css("display", "inline-block");
        parent.$('.Current_page').attr("name", herf).css({"color": "#4c8fbd", "cursor": "pointer"});
        parent.layer.close(index);
    });
    //初始化宽度、高度
    $(".widget-box").height($(window).height());
    $(".Ads_list").width($(window).width() - 220);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height());
        $(".Ads_list").width($(window).width() - 220);
    });
    /*文章-不显示*/
    function article_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/update_articleType',
                data : {
                    articleType : 2,
                    id : id
                },
                dataType : 'json',
                success : function (result) {
                    if(result){
                        $(obj).parents("tr").find(".td-manage").prepend("<a style='text-decoration:none' class='btn btn-xs  btn-success' onClick='article_start(this,"+id+")'                                                                                   href='javascript:void(0);' title='显示'><i class='fa fa-check bigger-120'></i></a>");
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">隐藏</span>');
                        $(obj).remove();
                        layer.msg('隐藏!', {icon: 5, time: 1000});
                    }else{
                        layer.msg('修改失败，请稍后再试！', {icon: 2, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    }

    /*文章-显示*/
    function article_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/update_articleType',
                data : {
                    articleType : 1,
                    id : id
                },
                dataType : 'json',
                success : function (result) {
                    if(result){
                        $(obj).parents("tr").find(".td-manage").prepend("<a style='text-decoration:none' class='btn btn-xs' onClick='article_stop(this,"+id+")' href='javascript:void(0);'                                                                         title='隐藏'><i class='fa fa-close  bigger-120'></i></a>");
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">显示</span>');
                        $(obj).remove();
                        layer.msg('已显示!', {icon: 6, time: 1000});
                    }else{
                        layer.msg('修改失败，请稍后再试！', {icon: 2, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });

        });
    }

    /*文章-删除*/
    function article_del(id) {
        layer.confirm('确认要删除吗？', {icon: 0,}, function (index) {
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/delete_article',
                data : {
                    id : id
                },
                dataType : 'json',
                success : function (result) {
                    if (result) {
                        layer.msg('已删除!', {icon: 1, time: 1000},function () {
                            window.location.reload();
                        });
                    }else {
                        layer.msg('删除数据出错，请稍后再试！', {icon: 5, offset: 't'});
                    }
                },
                error : function () {
                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    }

    /*跳转文章详情页*/
    function go_articleDetail(id) {
        window.location.href = "${pageContext.request.contextPath}/admin/go_articleDetail?id="+ id;
    }
    
    function go_articleUpdate(id) {
        window.location.href = "${pageContext.request.contextPath}/admin/go_articleUpdate?id="+ id;
    }
</script>