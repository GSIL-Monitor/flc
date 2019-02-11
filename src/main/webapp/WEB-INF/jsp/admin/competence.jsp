<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/laydate/laydate.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/dragDivResize.js" type="text/javascript"></script>
    <title>添加权限</title>
    <style>
        .Competence_add_style .Assign_style {
            width: 933px;
            height: 944px;
            position: absolute;
            left: 0;
        }
         .anniu {
            border: none;
            outline: 0;
            padding: 8px 18px;
            margin-top: 15px;
            margin-bottom: 10px;
            vertical-align: middle;
            overflow: hidden;
            text-decoration: none;
            color: #fff;
            background-color: #e9686b;
            text-align: center;
            transition: .2s ease-out;
            cursor: pointer;
            white-space: nowrap;
            box-shadow: 0px 2px 6px rgba(0,0,0,0.12), 0px 1px 2px rgba(0,0,0,0.24);
            font-family: '微软雅黑';
            border-radius: 2px;
             margin-left: 20%;
        }
    </style>
</head>
<body>

<button type="button" class="anniu" onclick="cherkds(this,'${roleId}')" >点击显示已拥有权限</button>
<form action="${pageContext.request.contextPath }/role/addroleismenu" method="post">
    <div class="Competence_add_style clearfix">
        <!--权限分配-->
        <div class="Assign_style">
            <div class="title_name"><span>权限分配</span></div>
            <div class="Select_Competence">
                <input type="hidden" value="${roleId}" name="roleId"/>
                <%--第一层--%>
                <c:forEach items="${menuVoList}" var="menuVo0">
                    <dl class="permission-list">
                        <dt>
                            <label class="middle">
                                <input name="menuId" class="ace" type="checkbox" value="${menuVo0.id}" >
                                <span class="lbl">${menuVo0.name}</span>
                            </label>
                        </dt>
                        <dd>
                                <%--第二层--%>
                            <c:forEach items="${menuVo0.menuVoList}" var="menuVo1">
                                <dl class="cl permission-list2">
                                    <dt>
                                        <label class="middle">
                                            <input name="menuId" class="ace" type="checkbox" value="${menuVo1.id}" >
                                            <span class="lbl">${menuVo1.name}</span>
                                        </label>
                                    </dt>
                                    <dd>
                                            <%--第三层--%>
                                        <c:forEach items="${menuVo1.menuVoList}" var="menuVo2">
                                            <label class="middle">
                                                <input name="menuId" class="ace" type="checkbox" value="${menuVo2.id}" >
                                                <span class="lbl">${menuVo2.name}</span>
                                            </label>
                                        </c:forEach>
                                    </dd>
                                </dl>
                            </c:forEach>
                        </dd>
                    </dl>
                </c:forEach>


                <div class="Button_operation">
                    <button class="btn btn-primary radius" type="submit">
                        <i class="fa fa-save "></i> 保存并提交
                    </button>
                    <button onclick="layer_close();" class="btn btn-default radius" type="button">
                        &nbsp;&nbsp;取消&nbsp;&nbsp;
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    //初始化宽度、高度
    $(".left_Competence_add,.Competence_add_style").height($(window).height()).val();
    ;
    $(".Assign_style").width($(window).width() - 500).height($(window).height()).val();
    $(".Select_Competence").width($(window).width() - 500).height($(window).height() - 40).val();
    //当文档窗口发生改变时 触发
    $(window).resize(function () {

        $(".Assign_style").width($(window).width() - 500).height($(window).height()).val();
        $(".Select_Competence").width($(window).width() - 500).height($(window).height() - 40).val();
        $(".left_Competence_add,.Competence_add_style").height($(window).height()).val();
        ;
    });

    /*字数限制*/
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
    /*按钮选择*/
    $(function () {
        $(".permission-list dt input:checkbox").click(function () {
            $(this).closest("dl").find("dd input:checkbox").prop("checked", $(this).prop("checked"));
        });
        $(".permission-list2 dd input:checkbox").click(function () {
            var l = $(this).parent().parent().find("input:checked").length;
            var l2 = $(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
            if ($(this).prop("checked")) {
                $(this).closest("dl").find("dt input:checkbox").prop("checked", true);
                $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked", true);
            }
            else {
                if (l == 0) {
                    $(this).closest("dl").find("dt input:checkbox").prop("checked", false);
                }
                if (l2 == 0) {
                    $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked", false);
                }
            }

        });
    });

    // 获取当前管理员拥有的菜单
    function cherkds(obj,id) {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/menu/getmenubyroleid",
            data: {"roleId": id},
            dataType: "json",
            success: function (data) {
                if (data.code == 2000) {


                    //获取到所有的勾选框的对象
                    var menuIdList =  document.getElementsByName("menuId");

                    var menuId;

                    for(i = 0; i < data.obj.length; i++) {

                        for (j = 0; j < menuIdList.length; j++) {
                            if (data.obj[i].id==menuIdList[j].value) {
                                menuIdList[j].checked=true;
                            }
                        }
                    }
                } else {
                    layer.msg(data.msg, {icon: 2, offset: 't'})
                }
            }
        });
    }
</script>
