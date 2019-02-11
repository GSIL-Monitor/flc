<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/css/style.css"/>
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.css"
          type="text/css">

    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js"
            type="text/javascript"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>管理员管理--角色管理</title>
</head>

<body>
<div class="page-content clearfix">
    <div class="sort_style">
        <div class="border clearfix">
           <span class="l_f">
                <a onclick="sort_add()" id="sort_add" class="btn btn-warning"><em
                        class="fa fa-plus"></em> 添加角色</a>
           </span>
        </div>
        <div class="sort_list">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                <tr>
                    <th width="100px">角色名称</th>
                    <th width="350px">描述</th>
                    <th width="180px">加入时间</th>
                    <th width="250px">操作</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${roleAllList}" var="role">
                    <tr>
                        <td>${role.name}</td>
                        <td>${role.tips}</td>
                        <td>${role.addtime}</td>
                        <td class="td-manage">

                            <c:if test="${role.id !=1}">
                            <a title="编辑" onclick="sort_edit(${role.id});"
                               href="javascript:void(0);" class="btn btn-xs btn-info">
                                <em class="fa fa-edit bigger-120"></em>
                            </a>
                            <a title="删除" href="javascript:void(0);" onclick="member_del(this,${role.id})"
                               class="btn btn-xs btn-warning">
                                <em class="fa fa-trash  bigger-120"></em>
                            </a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>
<!--添加角色-->
<div class="sort_style_add margin" id="sort_style_add" style="display:none">
    <div class="">
        <ul>
            <li>
                <label class="label_name">角色名称</label>
                <div class="col-sm-9">
                    <input type="hidden" id="roleId"/>
                    <input name="roleName" type="text" placeholder="输入角色名称" class="col-xs-10 col-sm-5"
                           id="roleName">
                </div>
            </li>
            <li>
                <label class="label_name">角色说明</label>
                <div class="col-sm-9">
                    <textarea name="roleTips" class="form-control" placeholder="输入点角色说明吧..."
                              onkeyup="checkLength(this);" cols="" rows="" id="roleTips"></textarea>
                    <span class="wordage">剩余字数：
                        <span id="sy" style="color:Red;">200</span>字
                    </span>
                </div>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    // 添加角色
    function sort_add() {
        layer.open({
            type: 1,
            title: '添加角色',
            maxmin: true,
            shadeClose: false, //点击遮罩关闭层
            area: ['750px', ''],
            content: $('#sort_style_add'),
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                if ($('#roleName').val() == '') {
                    layer.alert("对不起,角色名不能为空!", {
                        title: '提示框',
                        icon: 0,
                    });
                    return false;
                }
                if ($('#roleTips').val() == '') {
                    layer.alert("对不起,角色简介不能为空!", {
                        title: '提示框',
                        icon: 0,
                    });
                    return false;
                }
                else {
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/role/addrole",
                        data: {"name": $('#roleName').val(), "tips": $('#roleTips').val()},
                        dataType: "json",
                        success: function (data) {
                            if (data.code == 2000) {
                                layer.alert('添加成功！', {
                                    title: '提示框',
                                    icon: 1,
                                });
                                location.reload();//刷新页面
                            } else {
                                layer.msg(data.msg, {icon: 2, offset: 't'})
                            }
                        }
                    });
                }
            }
        });
    };

    // 修改角色
    function sort_edit(id) {


        /*根据id获取角色信息*/

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/role/getrolebyid",
            data: {"id": id},
            dataType: "json",
            success: function (data) {
                if (data.code == 2000) {
                    // 对修改框赋值
                    $('#roleId').val(data.obj.id);
                    $('#roleName').val(data.obj.name);
                    $('#roleTips').val(data.obj.tips);

                    layer.open({
                        type: 1,
                        title: '修改角色',
                        maxmin: true,
                        shadeClose: false, //点击遮罩关闭层
                        area: ['750px', ''],
                        content: $('#sort_style_add'),
                        btn: ['提交', '取消'],
                        yes: function (index, layero) {
                            if ($('#roleName').val() == '') {
                                layer.alert("对不起,角色名不能为空!", {
                                    title: '提示框',
                                    icon: 0,
                                });
                                return false;
                            }
                            if ($('#roleTips').val() == '') {
                                layer.alert("对不起,角色简介不能为空!", {
                                    title: '提示框',
                                    icon: 0,
                                });
                                return false;
                            }
                            else {
                                $.ajax({
                                    type: "post",
                                    url: "${pageContext.request.contextPath}/role/modifyrole",
                                    data: {"id": $('#roleId').val(),"name": $('#roleName').val(), "tips": $('#roleTips').val()},
                                    dataType: "json",
                                    success: function (data) {
                                        if (data.code == 2000) {
                                            layer.alert('添加成功！', {
                                                title: '提示框',
                                                icon: 1,
                                            });
                                            location.reload();//刷新页面
                                        } else {
                                            layer.msg(data.msg, {icon: 2, offset: 't'})
                                        }
                                    }
                                });
                            }
                        }
                    });


                } else {
                    layer.msg(data.msg, {icon: 2, offset: 't'})
                }
            }
        });


    };

    //检查字数
    function checkLength(which) {
        var maxChars = 200; //
        if (which.value.length > maxChars) {
            layer.open({
                icon: 2,
                title: '提示框',
                content: '您出入的字数超多限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };


    /*广告图片-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', {icon: 0,}, function (index) {

            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/role/removerole",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        layer.msg(data.msg, {icon: 2, offset: 't'})
                    }
                }
            });
        });
    }
</script>


<script type="text/javascript">
    //分页
    $('#sample-table').dataTable({
        "aaSorting": [[2, "asc"]],//默认第几个排序
        "bProcessing": true,//是否显示进度提示
        "aLengthMenu": [5, 10, 20, 50, 100],
        "bAutoWidth": true,
        "aoColumnDefs": [
            {"orderable": false, "aTargets": [1, 3,]}// 制定列不参与排序
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