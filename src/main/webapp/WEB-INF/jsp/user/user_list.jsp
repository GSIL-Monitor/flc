<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/css/style.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/codemirror.css">
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/admin/Widget/dataTables/jquery.dataTables.min.css"/>
    <!--[if lte IE 8]><![endif]-->
    <link rel="stylesheet" href="<%=basePath%>static/admin/assets/css/ace-ie.min.css"/>
    <script src="<%=basePath%>static/admin/js/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>static/admin/assets/js/typeahead-bs2.min.js"></script>
    <script src="<%=basePath%>static/admin/js/lrtk.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=basePath%>static/admin/js/H-ui.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/admin/js/H-ui.admin.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/admin/js/regular.js"></script>
    <script type="text/javascript" src="<%=basePath%>static/admin/js/tools.js"></script>
    <script src="<%=basePath%>static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>合伙人管理--合伙人列表</title>
    <style>
        .shop_reason{ padding:15px;}
        .shop_reason .content{ border:1px solid #dddddd; margin-bottom:15px; padding:10px; display:block}
        .shop_reason .form-control{ width:568px; height:200px; resize:none; margin-left:0px}
    </style>
</head>
<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <div class="border clearfix">
               <span class="l_f">
                    <a href="javascript:void(0);" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加用户</a>
               </span>
            </div>
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                        <tr>
                            <th width="180">分享ID</th>
                            <th width="150">用户名</th>
							<th width="150">真实姓名</th>
                            <th width="150">手机</th>
                            <th width="150">分红</th>
                            <th width="150">考核积分</th>
                            <th width="150">分润账户</th>
                            <th width="200">加入时间</th>
                            <th width="180">合伙人角色</th>
                            <th width="180">推荐店铺</th>
                            <th width="250">状态</th>
                            <th width="350">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.userShareid}</td>
                                <td>
                                    <u style="cursor:pointer" class="text-primary"
                                       onclick="member_show('查看用户信息','${pageContext.request.contextPath}/admin/go_member_show',${user.id},'500','400')">${user.userNick}
									</u>
                                </td>
								<td>
									
									   <c:if test="${ not empty user.userTruename }">
											${user.userTruename}
										</c:if>
										<c:if test="${ empty user.userTruename }">
											未认证
										</c:if>
								</td>
                                <td>${user.userTel}</td>
                                <td>
                                    <u style="cursor:pointer" class="text-primary"
                                       onclick="balance_show('分红来源记录','${pageContext.request.contextPath}/admin/go_withdrawal_logs',${user.id},'1200','500')">
                                        ${user.userProfitAccount}
                                    </u>
                                </td>
                                <td>
                                    <u style="cursor:pointer" class="text-primary"
                                       onclick="integral_show('考核积分记录','${pageContext.request.contextPath}/admin/go_integral_logs',${user.id},'1000','500')">
                                        ${user.userCheckIntegral}
                                    </u>
                                </td>
                                <td>${user.userSharprofitCount}</td>
                                <td>${user.userAddtime}</td>
                                <td>
                                    <c:if test="${user.userRole == 1}"><span>消费者</span></c:if>
                                    <c:if test="${user.userRole == 2}"><span>事业合伙人</span></c:if>
                                    <c:if test="${user.userRole == 3}"><span>高级合伙人</span></c:if>
                                    <c:if test="${user.userRole == 4}"><span>创始合伙人</span></c:if>
                                </td>
                                <td>
                                    <c:if test="${empty user.store.id }"><span>无</span></c:if>
                                    <c:if test="${not empty user.store.storeName }"><span style="color: red">${user.store.storeName}</span></c:if>
                                </td>
                                <td class="td-status">
                                    <c:if test="${user.userStatus == 1}">
                                        <span class="label label-success radius">已启用</span>
                                    </c:if>
                                    <c:if test="${user.userStatus == 2}">
                                        <span class="label label-defaunt radius">已停用</span>
                                    </c:if>
                                </td>
                                <td class="td-manage">
                                    <c:if test="${user.userStatus == 1}">
                                        <a onClick="member_stop(this,${user.id})" href="javascript:void(0);" title="停用" class="btn btn-xs">
                                            <em class="icon-remove bigger-120"></em>
                                        </a>
                                    </c:if>
                                    <c:if test="${user.userStatus == 2}">
                                        <a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_start(this,${user.id})" href="javascript:;" title="启用">
                                            <i class="icon-ok bigger-120"></i>
                                        </a>
                                    </c:if>
                                    <a title="编辑" onclick="member_edit(${user.id})" href="javascript:void(0);" class="btn btn-xs btn-info">
                                        <em class="icon-edit bigger-120"></em>
                                    </a>
                                    <a title="删除" href="javascript:void(0);" onclick="member_del(this,${user.id})" class="btn btn-xs btn-danger">
                                        <em class="icon-trash  bigger-120"></em>
                                    </a>
                                    <a onclick="top_up(${user.id});" title="充值积分" href="javascript:void(0);" class="btn btn-xs btn-warning">
                                        <em class="icon-money  bigger-120"></em>
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
<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">
    <ul class=" page-content">
        <li>
            <label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label>
            <span class="add_name"><input value="" name="用户名" type="text" class="userNick"/></span>
            <div class="prompt r_f"></div>
        </li>
        <li>
            <label class="label_name">手机：</label>
            <span class="add_name"><input name="手机" type="text" class="userTel"/></span>
            <div class="prompt r_f"></div>
        </li>
        <li>
            <label class="label_name">密码：</label>
            <span class="add_name"><input name="密码" type="text" class="userPassword" value="初始密码为手机号" disabled/></span>
            <div class="prompt r_f"></div>
        </li>
        <li>
            <label class="label_name">等&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
            <span class="add_name">
                <label><input name="userRole" type="radio" class="ace" checked value="1"><span class="lbl">消费者</span></label>&nbsp;&nbsp;&nbsp;
                <label><input name="userRole" type="radio" class="ace" value="2"><span class="lbl">事业合伙人</span></label>&nbsp;&nbsp;&nbsp;
                <label><input name="userRole" type="radio" class="ace" value="3"><span class="lbl">高级合伙人</span></label>
                <label><input name="userRole" type="radio" class="ace" value="4"><span class="lbl">创始合伙人</span></label>
            </span>
            <div class="prompt r_f"></div>
        </li>
    </ul>
</div>
<!--修改用户图层-->
<div class="update_menber" id="update_menber_style" style="display:none">
    <ul class="page-content">
        <li>
            <label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label>
            <span class="update_name"><input name="用户名" type="text" class="_userNick" readonly/></span>
            <div class="prompt r_f"></div>
        </li>
        <li>
            <label class="label_name">手机：</label>
            <span class="update_name"><input name="手机" type="text" class="_userTel" readonly/></span>
            <div class="prompt r_f"></div>
        </li>
        <li>
            <label class="label_name">分红：</label>
            <span class="update_name"><input name="分红" type="text" class="userProfitAccount"/></span>
            <div class="prompt r_f"></div>
        </li>
        <li>
            <label class="label_name">考核积分：</label>
            <span class="update_name"><input name="考核积分" type="text" class="userCheckIntegral"/></span>
            <div class="prompt r_f"></div>
        </li>
        <li>
            <label class="label_name">等&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
            <span class="update_name">
                <label><input name="form-field-radio" type="radio" class="ace r1" value="1"><span class="lbl">消费者</span></label>&nbsp;&nbsp;&nbsp;
                <label><input name="form-field-radio" type="radio" class="ace r2" value="2"><span class="lbl">事业合伙人</span></label>&nbsp;&nbsp;&nbsp;
                <label><input name="form-field-radio" type="radio" class="ace r3" value="3"><span class="lbl">高级合伙人</span></label>
                <label><input name="form-field-radio" type="radio" class="ace r4" value="4"><span class="lbl">创始合伙人</span></label>
            </span>
            <div class="prompt r_f"></div>
        </li>
    </ul>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        //分页
        $('#sample-table').dataTable({
            "bProcessing" : true,//是否显示进度提示
            "aaSorting": [[ 5, "desc" ]],//默认第几个排序
            "aLengthMenu" : [12,20,50,100],
            "bAutoWidth" : true,
            "aoColumnDefs": [
                {"orderable":false,"aTargets":[1,2,6,7,8,]}// 制定列不参与排序
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

        /*用户-添加*/
        $('#member_add').on('click', function () {
            layer.open({
                type: 1,
                title: '添加用户',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area: ['900px', '280px'],
                content: $('#add_menber_style'),
                btn: ['提交', '取消'],
                yes: function (index, layero) {
                    var num = 0;
                    var str = "";
                    $(".add_menber input[type$='text']").each(function (n) {
                        if ($(this).val() == "") {
                            layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
                                title: '提示框',
                                icon: 0,
                            });
                            num++;
                            return false;
                        }
                    });
                    if (num > 0) {
                        return false;
                    } else {
                        if(isTel($(".userTel").val())){
                            //根据电话获取用户信息，判断用户是否注册
                            $.ajax({
                                type : 'post',
                                url : '${pageContext.request.contextPath}/admin/getUserMSGByUserTel',
                                data : {
                                    userTel : $(".userTel").val(),
                                },
                                dataType : 'json',
                                success : function (result) {
                                    if (!result) {
                                        var _userRole = document.getElementsByName("userRole");
                                        for (var i = 0; i < _userRole.length; i++) {
                                            if (_userRole[i].checked==true) {
                                                $.ajax({
                                                    type : 'post',
                                                    url : '${pageContext.request.contextPath}/admin/add_user',
                                                    data : {
                                                        userNick : $(".userNick").val(),
                                                        userTel : $(".userTel").val(),
                                                        userRole : _userRole[i].value
                                                    },
                                                    dataType : 'json',
                                                    success : function (result) {
                                                        if (result) {
                                                            layer.msg('添加成功！', {icon: 1, offset: 't',time: 1000},function(){
                                                                window.location.reload();
                                                            });
                                                        }else{
                                                            layer.msg('添加失败，请稍后再试！', {icon: 7, offset: 't'});
                                                        }
                                                    },
                                                    error : function () {
                                                        layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                                                    }
                                                });
                                            }
                                        }
                                    }else{
                                        layer.msg('该电话号码已注册！', {icon: 7, offset: 't'});
                                    }
                                },
                                error : function () {
                                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                                }
                            });
                        }else {
                            layer.msg('电话号码格式不正确！', {icon: 3, offset: 't'});
                        }
                    }
                }
            });
        });
    });

    /*用户-查看*/
    function member_show(title, url, id, w, h) {
        layer_show(title, url + '?id=' + id, w, h);
    }

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/update_user',
                data : {
                    userStatus : 2,
                    id : id
                },
                dataType : 'json',
                success : function (result) {
                    if (result) {
                        $(obj).parents("tr").find(".td-manage")
                            .prepend("<a style='text-decoration:none' class='btn btn-xs btn-success' " +
                                "onClick='member_start(this,"+id+")' href='javascript:void(0);' title='启用'><i class='icon-ok bigger-120'></i></a>");
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
                        $(obj).remove();
                        layer.msg('已停用!', {icon: 5, time: 1000});
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

    /*用户-启用*/
    function member_start(obj, id) {
        layer.confirm('确认要启用吗？', function (index) {
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/update_user',
                data : {
                    userStatus : 1,
                    id : id
                },
                dataType : 'json',
                success : function (result) {
                    if (result) {
                        $(obj).parents("tr").find(".td-manage")
                            .prepend("<a style='text-decoration:none' class='btn btn-xs' onClick='member_stop(this,"+id+")' href='javascript:void(0);' title='停用'>" +
                                "<i class='icon-remove  bigger-120'></i></a>");
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                        $(obj).remove();
                        layer.msg('已启用!', {icon: 6, time: 1000});
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

    /*用户-编辑*/
    function member_edit(id) {
        $.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/admin/getUserMSGByUserId',
            data : {
                id : id
            },
            dataType : 'json',
            success : function (result) {
                if (!isEmpty(result)) {
                    $("._userNick").val(result.userNick);
                    $("._userTel").val(result.userTel);
                    $(".userProfitAccount").val(result.userProfitAccount);
                    $(".userCheckIntegral").val(result.userCheckIntegral);
                    if (result.userRole == 1){
                        $(".r1").prop("checked","checked");
                    }
                    if (result.userRole == 2){
                        $(".r2").prop("checked","checked");
                    }
                    if (result.userRole == 3){
                        $(".r3").prop("checked","checked");
                    }
                    if (result.userRole == 4){
                        $(".r4").prop("checked","checked");
                    }
                    layer.open({
                        type: 1,
                        title: '修改用户信息',
                        maxmin: true,
                        shadeClose: false, //点击遮罩关闭层
                        area: ['800px', '300px'],
                        content: $('#update_menber_style'),
                        btn: ['提交', '取消'],
                        yes: function (index, layero) {
                            var num = 0;
                            var str = "";
                            $(".update_menber input[type$='text']").each(function (n) {
                                if ($(this).val() == "") {
                                    layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
                                        title: '提示框',
                                        icon: 0
                                    });
                                    num++;
                                    return false;
                                }
                            });
                            if (num > 0) {
                                return false;
                            }else {
                                // if(isTel($("._userTel").val())){
                                    //根据电话获取用户信息，判断用户是否注册
                                    <%--$.ajax({--%>
                                        <%--type : 'post',--%>
                                        <%--url : '${pageContext.request.contextPath}/admin/getUserMSGByUserTel',--%>
                                        <%--data : {--%>
                                            <%--userTel : $("._userTel").val(),--%>
                                        <%--},--%>
                                        <%--dataType : 'json',--%>
                                        <%--success : function (result) {--%>
                                            <%--if (!result) {--%>
                                                //判断分红（大于等于0且小数点后不能大于两位）
                                                if($(".userProfitAccount").val() >= 0 && isDecimalsContainTwo($(".userProfitAccount").val())){
                                                    //判断考核积分大于0且为整数
                                                    if ($(".userCheckIntegral").val() >= 0 && isPositiveInteger($(".userCheckIntegral").val())) {
                                                        var _userRole = document.getElementsByName("form-field-radio");
                                                        for (var i = 0; i < _userRole.length; i++) {
                                                            if (_userRole[i].checked==true) {
                                                                $.ajax({
                                                                    type : 'post',
                                                                    url : '${pageContext.request.contextPath}/admin/update_user',
                                                                    data : {
                                                                        // userNick : $("._userNick").val(),
                                                                        // userTel : $("._userTel").val(),
                                                                        userProfitAccount : $(".userProfitAccount").val(),
                                                                        userCheckIntegral : $(".userCheckIntegral").val(),
                                                                        userRole : _userRole[i].value,
                                                                        id : id
                                                                    },
                                                                    dataType : 'json',
                                                                    success : function (result) {
                                                                        if (result) {
                                                                            layer.msg('修改成功！', {icon: 1, offset: 't',time: 1000},function(){
                                                                                window.location.reload();
                                                                            });
                                                                        }else{
                                                                            layer.msg('修改失败，请稍后再试！', {icon: 2, offset: 't'});
                                                                        }
                                                                    },
                                                                    error : function () {
                                                                        layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                                                                    }
                                                                });
                                                            }
                                                        }
                                                    }else{
                                                        layer.msg('考核积分格式不正确，请输入大于0的整数！', {icon: 2, offset: 't'});
                                                    }
                                                }else{
                                                    layer.msg('分红格式不正确，请输入大于0且小数点后最多保留两位的数字！', {icon: 2, offset: 't'});
                                                }
                                //             }else{
                                //                 layer.msg('该电话号码已注册！', {icon: 2, offset: 't'});
                                //             }
                                //         },
                                //         error : function () {
                                //             layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                                //         }
                                //     });
                                // }else {
                                //     layer.msg('电话号码格式不正确！', {icon: 7, offset: 't'});
                                // }
                            }
                        }
                    });
                }else{
                    layer.msg('修改失败，请稍后再试！', {icon: 2, offset: 't'});
                }
            },
            error : function () {
                layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    }
    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                type : 'post',
                url : '${pageContext.request.contextPath}/admin/delete_user',
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

    // 分红来源记录
    function balance_show(title, url, id, w, h) {
        layer_show(title, url + '?id=' + id, w, h);
    }

    //考核积分来源记录
    function integral_show(title, url, id, w, h) {
        layer_show(title, url + '?id=' + id, w, h);
    }

    //充值积分/分红
    function top_up(id) {
        // '<input type="radio" class="t_rad" name="radio" value="1" checked>&nbsp;&nbsp;积分&nbsp;&nbsp;' +
        // '<input type="radio" class="t_rad" name="radio" value="2">&nbsp;&nbsp;金额&nbsp;&nbsp;' +
        var index = layer.open({
            type: 1,
            title: '充值分红',
            maxmin: true,
            shadeClose: false,
            area: ['600px', ''],
            content: ('' +
                '<div class="shop_reason">' +
                    '<input type="text" name="integral" id="recharge" placeholder="输入要充值的金额">&nbsp;&nbsp;<br/>' +
                '</div>' +
                ''),
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                if ($('#recharge').val() == "") {
                    layer.alert('请输入要充值金额！', {
                        title: '提示框',
                        icon: 0,
                    })
                } else {
                    // var type = document.getElementsByName("radio");
                    // for (var i = 0; i < type.length; i++) {
                    //     if (type[i].checked == true) {
                            <%--if (type[i].value == 1){--%>
                                <%--$.ajax({--%>
                                    <%--type : 'post',--%>
                                    <%--url : '${pageContext.request.contextPath}/admin/update_user',--%>
                                    <%--data : {--%>
                                        <%--type : 1,--%>
                                        <%--userPersonalIntegral : $("#recharge").val(),--%>
                                        <%--id : id--%>
                                    <%--},--%>
                                    <%--dataType : 'json',--%>
                                    <%--success : function (result) {--%>
                                        <%--if (result) {--%>
                                            <%--layer.msg('充值成功!', {icon: 1, time: 1000},function () {--%>
                                                <%--window.location.reload();--%>
                                            <%--});--%>
                                        <%--}else {--%>
                                            <%--layer.msg('充值出错，请稍后再试！', {icon: 5, offset: 't'});--%>
                                        <%--}--%>
                                    <%--},--%>
                                    <%--error : function () {--%>
                                        <%--layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});--%>
                                    <%--}--%>
                                <%--});--%>
                            <%--}--%>
                            // if (type[i].value == 2){
                            if($("#recharge").val() > 0 && isDecimalsContainTwo($("#recharge").val())){
                                $.ajax({
                                    type : 'post',
                                    url : '${pageContext.request.contextPath}/admin/update_user',
                                    data : {
                                        type : 2,
                                        _userProfitAccount : $("#recharge").val(),
                                        id : id
                                    },
                                    dataType : 'json',
                                    success : function (result) {
                                        if (result) {
                                            layer.msg('充值成功!', {icon: 1, time: 1000},function () {
                                                window.location.reload();
                                            });
                                        }else {
                                            layer.msg('充值出错，请稍后再试！', {icon: 5, offset: 't'});
                                        }
                                    },
                                    error : function () {
                                        layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                                    }
                                });
                            }else{
                                layer.msg('分红格式不正确，请输入大于0且小数点后最多保留两位的数字！', {icon: 2, offset: 't'});
                            }
                            // }
                    //     }
                    // }
                }
            }
        })
    }
</script>