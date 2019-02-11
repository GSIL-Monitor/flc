<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
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
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.css"
          type="text/css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/Widget/Validform/5.3.2/Validform.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js"
            type="text/javascript"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>管理员管理--管理员列表</title>
</head>

<body>
<div class="page-content clearfix">
    <div class="administrator">
        <div class="d_Confirm_Order_style">
            <div class="search_style">
            </div>
            <!--操作-->
            <div class="border clearfix">
                <span class="l_f">
                    <a href="javascript:void(0);" id="administrator_add" class="btn btn-warning"><em
                            class="fa fa-plus"></em> 添加管理员</a>
                </span>
                <span>${msg}</span>
            </div>
            <!--管理员列表-->
            <div class="clearfix administrator_style" id="administrator">
                <div class="left_style">
                    <div id="scrollsidebar" class="left_Treeview">
                        <div class="show_btn" id="rightArrow"><span></span></div>
                        <div class="widget-box side_content">
                            <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                            <div class="side_list">
                                <div class="widget-header header-color-green2"><h4 class="lighter smaller">管理员分类列表</h4>
                                </div>
                                <div class="widget-body">
                                    <ul class="b_P_Sort_list">
                                        <li><em class="fa fa-users green"></em> <a href="#">全部管理员（${adminLength}）</a>
                                        </li>
                                        <c:forEach items="${roleVoList}" var="roleVo">
                                            <li>
                                                <em class="fa fa-users orange"></em>
                                                <a href="#">${roleVo.name}（${roleVo.adminSum}）</a> <%--  角色Id  ${roleVo.id}--%>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table_menu_list" id="testIframe">
                    <table class="table table-striped table-bordered table-hover" id="sample-table">
                        <thead>
                        <tr>
                            <th width="80px">编号</th>
                            <th width="250px">登录名</th>
                            <th width="100px">手机</th>
                            <th width="100px">真实姓名</th>
                            <th width="100px">角色</th>
                            <th width="180px">加入时间</th>
                            <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${adminVoList}" var="admin">
                            <tr>
                                <td>${admin.id}</td>
                                <td>${admin.adminNickName}</td>
                                <td>${admin.adminTel}</td>
                                <td>${admin.adminTrueName}</td>
                                <td>${admin.roleName}</td>
                                <td>${admin.adminAddtime}</td>
                                <td class="td-manage">
                                    <c:if test="${admin.id!=1}">
                                    <a title="编辑" onclick="member_edit(this,${admin.id})" href="javascript:;"
                                       class="btn btn-xs btn-info">
                                        <i class="fa fa-edit bigger-120"></i>
                                    </a>
                                    <a title="删除" href="javascript:void(0);" onclick="member_del(this,${admin.id})"
                                       class="btn btn-xs btn-warning">
                                        <i class="fa fa-trash  bigger-120"></i>
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
    </div>
    <!--添加管理员-->
    <div id="add_administrator_style" class="add_menber" style="display:none">
        <form action="${pageContext.request.contextPath }/admin/addadmin" method="post" id="form-admin-add">
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>管理员：</label>
                <div class="formControls">
                    <input type="hidden" name="modify" id="modifycode" value=""/>
                    <input type="hidden" name="id" id="adminid" value=""/>
                    <input type="text" class="input-text" value="" placeholder="" id="user-name" name="adminNickName"
                           datatype="*2-16" nullmsg="用户名不能为空" >
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>初始密码：</label>
                <div class="formControls">
                    <input type="password" placeholder="密码" name="userpassword" autocomplete="off" value=""
                           class="input-text" datatype="*6-20" nullmsg="密码不能为空" id="userpassword"  >
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>确认密码：</label>
                <div class="formControls ">
                    <input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error"
                           errormsg="您两次输入的新密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="userpassword"
                           id="newpassword2" name="adminPassword" value="">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>手机：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder="" id="user-tel" name="adminTel"
                           datatype="m" nullmsg="手机不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>真实姓名：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" placeholder="" name="adminTrueName" id="real-name"
                           datatype="*1-5" nullmsg="请输入真实姓名！">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label">角色：</label>
                <div class="formControls "> <span class="select-box" style="width:150px;">
                    <select class="select" name="adminRoleId">
                        <%--<option value="0">---请选择---</option>--%>
                        <c:forEach items="${roleList}" var="roles">
                            <option value="${roles.id}">${roles.name}</option>
                        </c:forEach>
                    </select>
				</span></div>
            </div>
            <div class="form-group">
                <label class="form-label">备注：</label>
                <div class="formControls">
                    <textarea name="adminRemark" cols="" rows="" class="textarea" placeholder="说点什么...100个字符以内" dragonfly="true" onkeyup="checkLength(this);"  id="adminRemark"></textarea>
                    <span class="wordage">剩余字数：<span id="sy" style="color:Red;">100</span>字</span>
                </div>
                <div class="col-4"></div>
            </div>
            <div>
                <input class="btn btn-primary radius" type="submit" id="Add_Administrator"
                       value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick=" return checkForm();">
            </div>
        </form>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $("#administrator").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 50,//设置隐藏时的距离
            spacingh: 270,//设置显示时间距
        });
    });

    //字数限制
    function checkLength(which) {
        var maxChars = 100; //
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
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };
    //初始化宽度、高度
    $(".widget-box").height($(window).height() - 215);
    $(".table_menu_list").width($(window).width() - 260);
    $(".table_menu_list").height($(window).height() - 215);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height() - 215);
        $(".table_menu_list").width($(window).width() - 250);
        $(".table_menu_list").height($(window).height() - 215);
    });

    /*产品-修改*/
    function member_edit(obj, id) {

        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/admin/getadminbyid",
            data: {"id": id},
            dataType: "json",
            success: function (data) {
                if (data.code == 2000) {
                    $('#modifycode').val("modify");
                   $('#adminid').val(id);
                    $('#user-name').val(data.obj.adminNickName);
                    $('#userpassword').val(data.obj.adminPassword);
                    $('#newpassword2').val(data.obj.adminPassword);
                    $('#user-name').prop("readonly","readonly");
                    $('#userpassword').prop("readonly","readonly");
                    $('#newpassword2').prop("readonly","readonly");
                    $('#user-tel').val(data.obj.adminTel);
                    $('#real-name').val(data.obj.adminTrueName);
                    $('#adminRemark').val(data.obj.adminRemark);
                    layer.open({
                        type: 1,
                        title: '修改管理员',
                        area: ['700px', ''],
                        shadeClose: false,
                        content: $('#add_administrator_style')
                    });

                } else {
                    layer.msg(data.msg, {icon: 2, offset: 't'})
                }
            }
        });




    }

    /*产品-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {

            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/admin/removeadmin",
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

    /*添加管理员*/
    $('#administrator_add').on('click', function () {
        $('#modifycode').val('');
        $('#user-name').val('');
        $('#userpassword').val('');
        $('#newpassword2').val('');
        $('#user-name').prop("readonly",false);
        $('#userpassword').prop("readonly",false);
        $('#newpassword2').prop("readonly",false);
        $('#user-tel').val('');
        $('#real-name').val('');
        $('#adminRemark').val('');



        layer.open({
            type: 1,
            title: '添加管理员',
            area: ['700px', ''],
            shadeClose: false,
            content: $('#add_administrator_style')
        });
    });
    //表单验证提交
    // $("#form-admin-add").Validform({
    //     tiptype: 2,
    //     callback: function (data) {
    //         //form[0].submit();
    //         if($('.select').children("option").val() == 0){
    //             alert("请选择角色");
    //         }else{
    //             if (data.status == 1) {
    //                 layer.msg(data.info, {icon: data.status, time: 1000}, function () {
    //                     location.reload();//刷新页面
    //                 });
    //             }
    //             else {
    //                 layer.msg(data.info, {icon: data.status, time: 3000});
    //             }
    //             var index = parent.$("#iframe").attr("src");
    //             parent.layer.close(index);
    //         }
    //
    //     }
    // });
    //
    // function checkForm(){
    //     if($("#userpassword").val() == '' && ($("#userpassword").val() == $("#newpassword2").val())){
    //         alert("密码不能为空或两次密码不一致");
    //         return false;
    //     }
    //     // if($('.select').children("option").val() == 0){
    //     //     alert("请选择角色");
    //     //     return false;
    //     // }
    // }

    // 表单验证
    function checkForm() {//循环所有的表单元素
        for (var i = 0; i < $("#form-admin-add")[0].elements.length - 1; i++) {
            // var phone = '/^1[0-9]{10}$/';
            if ($("#modifycode").val()!= 'modify'){

                if ($("#form-admin-add")[0].elements[i].type != "hidden") {
                    if ($("#form-admin-add")[0].elements[i].value == "" || $("#form-admin-add")[0].elements[i].value == null || $("#form-admin-add")[0].elements[i].value == undefined) {
                        alert("输入项不能为空");
                        $("#form-admin-add")[0].elements[i].focus();
                        return false;
                    }
                    if (($("#userpassword").val() != $("#newpassword2").val())) {
                        alert("两次密码不一致");
                        return false;
                    }
                    if ($('.select').children("option").val() == 0) {
                        alert("请选择角色");
                        return false;
                    }
                }
        }

        }
        var  re = /^1\d{10}$/    //正则表达式
        if (!re.test($("#user-tel").val())) {      //判断字符是否是11位数字
            alert("手机号格式不正确");
            return false;
        }
        return true;
    }
</script>

<script type="text/javascript">
    //分页
    $('#sample-table').dataTable({
        "aaSorting": [[5, "desc"]],//默认第几个排序
        "bProcessing": true,//是否显示进度提示
        "aLengthMenu": [5, 10, 20, 50, 100],
        "bAutoWidth": true,
        "aoColumnDefs": [
            {"orderable": false, "aTargets": [2, 6,]}// 制定列不参与排序
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