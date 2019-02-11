<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/css/style.css"/>
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.css"
          type="text/css">
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/jquery.min.js"
            type="text/javascript"></script>
    <!-- <![endif]-->
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/ace-elements.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/ace.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js"
            type="text/javascript"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.js"></script>
    <title>产品管理--分类管理</title>
</head>


<body>
<div class="Operate_btn" style="margin: 10px 10px;">
    <a onclick="classify_add(this,${classify.id})" class="btn  btn-warning"><i
            class="icon-edit align-top bigger-125"></i>新增类型</a>
</div>
<div class="table_menu_list" id="testIframe">
    <table class="table table-striped table-bordered table-hover" id="sample-table">
        <thead>
        <tr>
            <th width="150px">分类名称(二级)</th>
            <th width="150px">图片</th>
            <th width="100px">分类描述</th>
            <th width="100px">状态</th>
            <th width="200px">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${classifyList}" var="classify">
            <tr>
                <td width="80px"><a href="${pageContext.request.contextPath }/classify/getclassifybypid?parentId=${classify.id}&code=3&classifyPLevel=${classify.classifyLevel}" title="查看子分类">${classify.classifyName}</a></td>
                <td width="80px">
                    <img src="${classify.classifyLogo}" alt="" width="80px" height="80px">
                </td>
                <td width="250px">${classify.classifyDescription}</td>
                <c:if test="${classify.classifyType ==1}">
                    <td class="td-status">
                        <span class="btn btn-xs btn-success">显示</span></td>
                </c:if>
                <c:if test="${classify.classifyType ==2}">
                    <td class="td-status"><span class="btn btn-xs">隐藏</span></td>
                </c:if>
                <td class="td-manage">

                    <c:if test="${classify.classifyType ==1}">
                        <a onClick="category_stop(this,${classify.id})" href="javascript:void(0);" title="隐藏"
                           class="btn btn-xs">
                            <i class="icon-ok bigger-120"></i>
                        </a>
                    </c:if>
                    <c:if test="${classify.classifyType ==2}">
                        <a onClick="category_start(this,${classify.id})" href="javascript:void(0);" title="显示"
                           class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                    </c:if>

                    <a title="添加子分类"
                       onclick="classifyson(this,${classify.id},'${classify.classifyName}',${classify.classifyLevel})"
                       class="btn btn-xs btn-info add_child_category">
                        <i class="icon-plus bigger-120"></i>
                    </a>


                    <a title="修改" onClick="classify_modify(this,${classify.id})"
                       class="btn btn-xs btn-warning update_category">
                        <i class="icon-edit bigger-120"></i>
                    </a>
                    <a title="删除" href="javascript:void(0);" onclick="member_del(this,${classify.id})"
                       class="btn btn-xs btn-danger">
                        <i class="icon-trash  bigger-120"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<!--添加分类 修改-->
<form id="classifyForm">
    <div id="add_ads_style" style="display:none">
        <div class="add_adverts">
            <ul>
                <li>
                    <label class="label_name">分类名称:</label>
                    <span class="cont_style">
                              <%--上级分类Id  隐藏域--%>
                    <input type="hidden" value="${parentId}" name="classifyPId" id="classifyPId"/>
                    <%--上级分类等级  隐藏域--%>
                    <input type="hidden" value="${classifyPLevel}" name="classifyPLevel" id="classifyPLevel"/>
                    <input name="classifyName" type="text" placeholder="输入分类名称" class="col-xs-10 col-sm-5"
                           style="width:450px" id="classifyName">
                        <input name="id" type="hidden" id="classifyid">
                    </span>
                </li>
                <li style="height: 80px;">
                    <label class="label_name">图片:</label>
                    <span class="cont_style">
                        <%--隐藏域保存图片地址使用--%>
                        <input name="imgcode" type="hidden" value="" id="imgcode"/>

                    <input name="classifyImg" type="file" class="col-xs-10 col-sm-5" style="width:450px"
                           id="file" onchange="changepic(this)">
                    </span>

                    <div style="width: 60px;height: 60px;float: right;margin-right: 400px;">
                        <img src="" alt="" id="img3" width="60px" height="60px">
                    </div>
                </li>
                <li>
                    <label class="label_name">状&nbsp;&nbsp;态：</label>
                    <span class="cont_style">
                    <label>
                        <input name="classifytype" type="radio" checked="" class="ace" id="classifytype1"
                               value="1">
                        <span class="lbl">显示</span>
                    </label>
                    <label>
                        <input name="classifytype" type="radio" class="ace" id="classifytype2" value="2">
                        <span class="lbl">隐藏</span>
                    </label>
                </span>
                    <div class="prompt r_f"></div>
                </li>
                <li>
                    <label class="label_name">品牌描述：</label>
                    <textarea name="classifyDescription" rows="" class="textarea" placeholder="说点什么吧....."
                              onKeyUp="checkLength(this)"
                              cols="10" style="width: 345px;height: 148px;" id="classifyDescription"></textarea>
                    <span class="wordage">剩余字数：<span id="sy" style="color:Red;">100</span>字</span>
                </li>
            </ul>
        </div>
    </div>
</form>

<!--添加子分类-->

<form id="addSonClassifyForm">
    <div id="add_ads_child_style" style="display:none">
        <div class="add_adverts">
            <ul>
                <li>
                    <label class="label_name">上级分类:</label>
                    <input type="hidden" value="${parentId}" name="classifyPId" id="_classifyPId"/>
                    <%--上级分类等级  隐藏域--%>
                    <input type="hidden" value="${classifyPLevel}" name="classifyPLevel" id="_classifyPLevel" />
                    <span class="cont_style" name="classifyPName" id="_classifyPName"></span>
                </li>
                <li>
                    <label class="label_name">分类名称:</label>
                    <span class="cont_style">
                    <input name="classifyName" type="text" placeholder="输入分类名称" class="col-xs-10 col-sm-5"
                           style="width:450px" id="_classifyName">
                </span>
                </li>
                <li style="height: 80px;">
                    <label class="label_name">图片:</label>
                    <%--选择图片--%>
                    <span class="cont_style">
                    <input name="classifyImg" type="file" class="col-xs-10 col-sm-5" style="width:450px" id="files"
                           onchange="changepics(this)">
                    </span>

                    <%--图片预览--%>
                    <div style="width: 60px;height: 60px;float: right;margin-right: 400px;">
                        <img src="" alt="" id="img33" width="60px" height="60px">
                    </div>

                </li>
                <li>
                    <label class="label_name">状&nbsp;&nbsp;态：</label>
                    <span class="cont_style">
                    <label>
                        <input name="classifytype" type="radio" checked="" class="ace" id="_classifytype1" value="1">
                        <span class="lbl">显示</span>
                    </label>
                    <label>
                        <input name="classifytype" type="radio" class="ace" id="_classifytype2" value="2">
                        <span class="lbl">隐藏</span>
                    </label>
                </span>
                    <div class="prompt r_f"></div>
                </li>
                <li>
                    <label class="label_name">品牌描述：</label>
                    <textarea name="classifyDescription" rows="" class="textarea" placeholder="说点什么吧....."
                              onKeyUp="checkLength(this)"
                              cols="10" style="width: 345px;height: 148px;" id="_classifyDescription"></textarea>
                    <span class="wordage">剩余字数：<span id="sy" style="color:Red;">100</span>字</span>
                </li>
            </ul>
        </div>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    //上传图片并预览
    function changepic(obj) {
        var reads = new FileReader();
        f = document.getElementById('file').files[0];
        reads.readAsDataURL(f);
        reads.onload = function (e) {
            document.getElementById('img3').src = this.result;
            $("#img3").css("display", "block");
        };
    }

    //子分类上传图片并预览
    function changepics(obj) {
        var reads = new FileReader();
        f = document.getElementById('files').files[0];
        reads.readAsDataURL(f);
        reads.onload = function (e) {
            document.getElementById('img33').src = this.result;
            $("#img33").css("display", "block");
        };
    }

    //初始化宽度、高度
    $(".widget-box").height($(window).height());
    $(".page_right_style").width($(window).width() - 220);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height());
        $(".page_right_style").width($(window).width() - 220);
    });

    /*添加分类*/
    function classify_add(obj, id) {


        $('#classifyName').val('');
        $("#classifytype1").prop("checked", 'checked');
        $("#classifyDescription").val('');
        $('#imgcode').val('');


        layer.open({
            type: 1,
            title: '添加分类',
            maxmin: true,
            shadeClose: false, //点击遮罩关闭层
            area: ['800px', '400px'],
            content: $('#add_ads_style'),
            btn: ['提交', '取消'],
            yes: function (index, layero) {

                if ($('#classifyName').val() === "") {
                    layer.alert("类型名不能为空！", {
                        title: '提示框',
                        icon: 0,
                    });
                    return false;
                } else if ($('#file').val() === "") {
                    layer.alert("图片不能为空！", {
                        title: '提示框',
                        icon: 0,
                    });
                    return false;
                } else if ($('#classifyDescription').val() === "") {
                    layer.alert("类型简介不能为空！", {
                        title: '提示框',
                        icon: 0,
                    });
                    return false;
                } else {
                    var form = new FormData(document.getElementById("classifyForm"));
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/classify/addsonclassify",
                        data: form,
                        async: false,
                        contentType: false,
                        processData: false,
                        success: function (data) {
                            if (data.code == 2000) {
                                layer.alert('添加成功！', {
                                    title: '提示框',
                                    icon: 1,
                                });
                                layer.close(index);
                                location.reload();//刷新页面
                            } else {
                                layer.msg(data.msg, {icon: 5, time: 1000});
                            }
                        }
                    });
                }
            }
        });
    };

    /*添加子分类*/
    function classifyson(obj, pid, pname, plevel) {
        alert(pid)
        alert(pname)
        /*显示父类分类名*/
        $('#_classifyPName').html(pname);
        $('#_classifyPId').val(pid);
        $('#_classifyPLevel').val(plevel);

        $('#_classifyName').val('');
        $('#files').val('');
        $('#_classifyDescription').val(plevel);


        layer.open({
            type: 1,
            title: '添加子分类',
            maxmin: true,
            shadeClose: false, //点击遮罩关闭层
            area: ['800px', '400px'],
            content: $('#add_ads_child_style'),
            btn: ['提交', '取消'],
            yes: function (index, layero) {

                if ($('#_classifyName').val() === "") {

                    layer.alert("分类名不能为空！", {

                        title: '提示框',
                        icon: 0,
                    });
                    return false;
                } else if ($('#files').val() === "") {
                    layer.alert("图片不能为空！", {
                        title: '提示框',
                        icon: 0,
                    });
                    return false;
                } else if ($('#_classifyDescription').val() === "") {
                    layer.alert("简介不能为空！", {
                        title: '提示框',
                        icon: 0,
                    });
                    return false;
                }
                else {

                    var form = new FormData(document.getElementById("addSonClassifyForm"));
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/classify/addsonclassify",
                        data: form,
                        async: false,
                        contentType: false,
                        processData: false,
                        success: function (data) {
                            if (data.code == 2000) {
                                layer.alert('添加成功！', {
                                    title: '提示框',
                                    icon: 1,
                                });
                                layer.close(index);
                                location.reload();//刷新页面
                            } else {
                                layer.msg(data.msg, {icon: 5, time: 1000});
                            }
                        }
                    });


                    layer.alert('添加成功！', {
                        title: '提示框',
                        icon: 1,
                    });
                    layer.close(index);
                }
            }
        });
    };

    /*删除分类*/
    function member_del(obj, id) {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/classify/delecttwoclassify",
            data: {"id": id},
            dataType: "json",
            success: function (data) {
                if (data.code == 2000) {
                    layer.alert('删除成功！', {
                        title: '提示框',
                        icon: 1,
                    }, function () {
                        location.reload();//刷新页面
                    });
                } else {
                    layer.msg(data.msg, {icon: 5, time: 1000});
                }
            }
        });

    }

    /*修改分类*/
    function classify_modify(obj, id) {

        /*根据id获取分类*/
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/classify/getclassifybyid",
            data: {"id": id},
            dataType: "json",
            success: function (data) {
                if (data.code == 2000) {
                    /*Id*/
                    $('#classifyid').val(data.obj.id);
                    /*商品名*/
                    $('#classifyName').val(data.obj.classifyName);
                    /*隐藏域图片地址*/
                    $('#imgcode').val(data.obj.classifyLogo);

                    /*显示隐藏  1显示 2隐藏*/
                    if (data.obj.classifyType == 1) {
                        alert(data.obj.classifyType);
                        $("#classifytype1").prop("checked", 'checked');
                    } else if (data.obj.classifyType == 2) {
                        alert(data.obj.classifyType);
                        $("#classifytype2").prop("checked", 'checked');
                    }
                    /*简介*/
                    $("#classifyDescription").val(data.obj.classifyDescription);
                    /*显示图片*/
                    $("#img3").prop('src', data.obj.classifyLogo);
                    layer.open({
                        type: 1,
                        title: '修改分类',
                        maxmin: true,
                        shadeClose: false, //点击遮罩关闭层
                        area: ['800px', '400px'],
                        content: $('#add_ads_style'),
                        btn: ['提交', '取消'],
                        yes: function (index, layero) {
                            if ($('#classifyName').val() === "") {
                                layer.alert("类型名不能为空！", {
                                    title: '提示框',
                                    icon: 0,
                                });
                                return false;
                            } else if ($('#classifyDescription').val() === "") {
                                layer.alert("类型简介不能为空！", {
                                    title: '提示框',
                                    icon: 0,
                                });
                                return false;
                            } else {

                                var types;
                                if ($("#classifytype1").prop("checked") == 'checked') {
                                    types = 1;
                                } else if ($("#classifytype2").prop("checked") == 'checked') {
                                    types = 2;
                                }

                                /*修改分类*/
                                var form = new FormData(document.getElementById("classifyForm"));
                                $.ajax({
                                    type: "post",
                                    url: "${pageContext.request.contextPath}/classify/modifyclassify",
                                    data: form,
                                    async: false,
                                    contentType: false,
                                    processData: false,
                                    dataType: "json",
                                    success: function (data) {
                                        if (data.code == 2000) {
                                            layer.alert('提交成功！', {
                                                title: '提示框',
                                                icon: 1,
                                                time: 1000,
                                            });
                                            layer.close(index);
                                            location.reload();//刷新页面
                                        } else {
                                            layer.msg(data.msg, {icon: 5, time: 1000});
                                        }
                                    }
                                });
                            }
                        }
                    });

                } else {
                    layer.msg(data.msg, {icon: 5, time: 1000});
                }
            }
        });

    };

    /*检查长度*/
    function checkLength(which) {
        var maxChars = 100;
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
            var curr = maxChars - which.value.length; // 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    }

    function checkLength2(which) {
        var maxChars = 100;
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
            var curr = maxChars - which.value.length; // 减去 当前输入的
            document.getElementById("sy2").innerHTML = curr.toString();
            return true;
        }
    }

    /*分类--隐藏*/
    function category_stop(obj, id) {
        layer.confirm('确认要隐藏吗？', function (index) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/classify/modifyclassifytype",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {

                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="category_start(this,' + id + ')" href="javascript:void(0);" title="显示" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="btn btn-xs">已隐藏</span>');
                        $(obj).remove();
                        layer.msg('已隐藏!', {icon: 5, time: 1000});
                    } else {
                        layer.msg(data.msg, {icon: 2, offset: 't'})
                    }
                }
            });

        });
    }

    /*分类--显示*/
    function category_start(obj, id) {
        layer.confirm('确认要显示吗？', function (index) {

            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/classify/modifyclassifytype",
                data: {"id": id},
                dataType: "json",
                success: function (data) {
                    if (data.code == 2000) {

                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="category_stop(this,' + id + ')" href="javascript:void(0);" title="隐藏" class="btn btn-xs"><i class="icon-ok bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="btn btn-xs btn-success">已显示</span>');
                        $(obj).remove();
                        layer.msg('已显示!', {icon: 6, time: 1000});
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
        "aaSorting": [[0, "desc"]],//默认第几个排序
        "bProcessing": true,//是否显示进度提示
        "aLengthMenu": [5, 10, 20, 50, 100],
        "bAutoWidth": true,
        "aoColumnDefs": [
            {"orderable": false, "aTargets": [1, 2, 4,]}// 制定列不参与排序
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
