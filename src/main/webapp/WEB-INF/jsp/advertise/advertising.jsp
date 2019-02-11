<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/codemirror.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/H-ui.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/H-ui.admin.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/tools.js"></script>
    <title>广告管理--广告管理</title>
</head>

<body id="multiUploadForm">
<div class="clearfix" id="advertising">
    <div style="margin-left:0;width:100%;padding: 15px;float: right;position: absolute;overflow: auto;">
        <div class="border clearfix">
        <span class="l_f">
            <a href="javascript:void(0);" id="ads_add" class="btn btn-warning"><em class="fa fa-plus"></em> 添加广告</a>
        </span>
        </div>
        <div class="Ads_lists">
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                <tr>
                    <th width="100">分类</th>
                    <th width="250px">图片</th>
                    <th width="300px">链接地址</th>
                    <th width="180px">加入时间</th>
                    <th width="100px">所属端</th>
                    <th width="70px">状态</th>
                    <th width="250px">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="advertise" items="${advertiseList}">
                    <tr>
                        <td>
                            <c:if test="${advertise.adverLocation == 1}">
                                幻灯片
                            </c:if>
                        </td>
                        <td><span class="ad_img">
                            <img src="${advertise.adverImageurl}" width="180px" height="80px" alt=""/></span>
                        </td>
                        <td><a href="javascript:void (0);">${advertise.adverContenturl}</a></td>
                        <td>${advertise.adverAddtime}</td>
                        <td>
                            <c:if test="${advertise.adverPlatform == 1}">
                                电脑端
                            </c:if>
                            <c:if test="${advertise.adverPlatform == 2}">
                                移动端
                            </c:if>
                        </td>
                        <td class="td-status">
                            <c:if test="${advertise.adverType == 1}">
                                <span class="label label-success radius">显示</span>
                            </c:if>
                            <c:if test="${advertise.adverType == 2}">
                                <span class="label radius">隐藏</span>
                            </c:if>
                        </td>
                        <td class="td-manage">
                            <c:if test="${advertise.adverType == 1}">
                                <a onClick="advertise_stop(this,${advertise.id})" href="javascript:void(0);" title="隐藏"
                                   class="btn btn-xs">
                                    <em class="fa fa-remove  bigger-120"></em>
                                </a>
                            </c:if>
                            <c:if test="${advertise.adverType == 2}">
                                <a style="text-decoration:none" class="btn btn-xs btn-success"
                                   onClick="advertise_start(this,${advertise.id})" href="javascript:void(0);"
                                   title="显示">
                                    <i class="fa fa-check  bigger-120"></i>
                                </a>
                            </c:if>
                            <a title="编辑" onclick="advertise_edit(${advertise.id})" href="javascript:void(0);"
                               class="btn btn-xs btn-info">
                                <em class="fa fa-edit bigger-120"></em>
                            </a>
                            <a title="删除" href="javascript:void(0);" onclick="advertise_del(this,${advertise.id})"
                               class="btn btn-xs btn-danger">
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
<!--添加广告样式-->
<div id="add_ads_style" style="display:none">
    <div class="add_adverts">
        <form id="form">
            <ul>
                <li>
                    <label class="label_name">所属端：</label>
                    <span class="cont_style">
                    <label>
                        <input name="adverPlatform" type="radio" checked="checked" class="ace" value="1">
                        <span class="lbl">电脑端</span>
                    </label>
                    <label>
                        <input name="adverPlatform" type="radio" class="ace" value="2">
                        <span class="lbl">移动端</span>
                    </label>
                </span>
                    <div class="prompt r_f"></div>
                </li>
                <li>
                    <label class="label_name" for="form-field-select-1">所属分类</label>
                    <span class="cont_style">
                <select class="form-control adverLocation" id="form-field-select-1" name="adverLocation">
                    <option value="0">选择分类</option>
                    <option value="1">首页幻灯片</option>
                </select>
            </span>
                </li>
                <li>
                    <label class="label_name">链接内容：</label>
                    <span class="cont_style">
                <label>
                    <input name="adverContent" type="radio" checked="checked" class="ace" value="1">
                    <span class="lbl">商品</span>
                </label>
                <label>
                    <input name="adverContent" type="radio" class="ace" value="2">
                    <span class="lbl">商铺</span>
                </label>
                <label>
                    <input name="adverContent" type="radio" class="ace" value="3">
                    <span class="lbl">其他</span>
                </label>
            </span>
                    <div class="prompt r_f"></div>
                </li>
                <li>
                    <label class="label_name">链接地址:</label>
                    <span class="cont_style">
                <input name="adverContenturl" type="text" placeholder="输入商品编号/商铺编号/http地址"
                       class="col-xs-10 col-sm-5 adverContenturl" style="width:450px">
            </span>
                </li>
                <li>
                    <label class="label_name">状&nbsp;&nbsp;态：</label>
                    <span class="cont_style">
                <label>
                    <input name="adverType" type="radio" checked="checked" class="ace" value="1">
                    <span class="lbl">显示</span>
                </label>
                <label>
                    <input name="adverType" type="radio" class="ace" value="2">
                    <span class="lbl">隐藏</span>
                </label>
            </span>
                    <div class="prompt r_f"></div>
                </li>
                <li>
                    <label class="label_name">图片:</label>
                    <span class="cont_style">
                <div class="demo">
                    <div class="logobox">
                        <div class="resizebox">
                            <img id="pic" src="${pageContext.request.contextPath}/static/admin/images/image.png" alt="图片上传"
                                 style="width: 150px;height: 110px;margin:0px auto;cursor: pointer;"/>
                            <input id="upload" class="adverImageurl" name="adverImageurl" accept="image/*" type="file"
                                   style="display: none" onchange="validate_img(this);"/>
                        </div>
                    </div>
                </div>
            </span>
                </li>
            </ul>
        </form>
    </div>
</div>

<!--修改广告样式-->
<div id="add_ads_style" class="update_ads_style" style="display:none">
    <div class="add_adverts">
        <form id="update_form">
            <input type="hidden" value="" name="id" class="id"/>
            <ul>
                <li>
                    <label class="label_name">所属端：</label>
                    <span class="cont_style">
                    <label>
                        <input name="_adverPlatform" type="radio" class="ace adverPlatform1" value="1">
                        <span class="lbl">电脑端</span>
                    </label>
                    <label>
                        <input name="_adverPlatform" type="radio" class="ace adverPlatform2" value="2">
                        <span class="lbl">移动端</span>
                    </label>
                </span>
                    <div class="prompt r_f"></div>
                </li>
                <li>
                    <label class="label_name" for="form-field-select-1">所属分类</label>
                    <span class="cont_style">
                        <select class="form-control _adverLocation" id="form-field-select-1" name="_adverLocation">
                            <option value="">选择分类</option>
                            <option value="1">首页大幻灯片</option>
                        </select>
                    </span>
                </li>
                <li>
                    <label class="label_name">链接内容：</label>
                    <span class="cont_style">
                        <label>
                            <input name="_adverContent" type="radio" class="ace adverContent1" value="1">
                            <span class="lbl">商品</span>
                        </label>
                        <label>
                            <input name="_adverContent" type="radio" class="ace adverContent2" value="2">
                            <span class="lbl">商铺</span>
                        </label>
                        <label>
                            <input name="_adverContent" type="radio" class="ace adverContent3" value="3">
                            <span class="lbl">其他</span>
                        </label>
                    </span>
                    <div class="prompt r_f"></div>
                </li>
                <li>
                    <label class="label_name">链接地址:</label>
                    <span class="cont_style">
                <input name="_adverContenturl" type="text" class="col-xs-10 col-sm-5 _adverContenturl"
                       style="width:450px">
            </span>
                </li>
                <li>
                    <label class="label_name">状&nbsp;&nbsp;态：</label>
                    <span class="cont_style">
                    <label>
                        <input name="_adverType" type="radio" class="ace adverType1" value="1">
                        <span class="lbl">显示</span>
                    </label>
                    <label>
                        <input name="_adverType" type="radio" class="ace adverType2" value="2">
                        <span class="lbl">隐藏</span>
                    </label>
                </span>
                    <div class="prompt r_f"></div>
                </li>
                <li>
                    <label class="label_name">图片:</label>
                    <span class="cont_style">
                <div class="demo">
                    <div class="logobox">
                        <div class="resizebox">
                            <img id="pic1" src="" alt="图片上传"
                                 style="width: 150px;height: 110px;margin:0px auto;cursor: pointer;"/>
                            <input id="upload1" name="_adverImageurl" class="_adverImageurl" accept="image/*"
                                   type="file" style="display: none" onchange="validate_img(this);"/>
                        </div>
                    </div>
                </div>
            </span>
                </li>
            </ul>
        </form>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        //分页
        $('#sample-table').dataTable({
            "bProcessing": true,//是否显示进度提示
            "aaSorting": [[3, "desc"]],//默认第几个排序
            "aLengthMenu": [5, 10, 20, 50, 100],
            "bAutoWidth": true,
            "aoColumnDefs": [
                {"orderable": false, "aTargets": [0, 1, 2, 4, 5, 6]}// 制定列不参与排序
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

        //初始化宽度、高度
        $(".widget-box").height($(window).height());
        $(".Ads_list").width($(window).width() - 220);
        //当文档窗口发生改变时 触发
        $(window).resize(function () {
            $(".widget-box").height($(window).height());
            $(".Ads_list").width($(window).width() - 220);
        });
        /*上传图片预览*/
        $("#pic").click(function () {
            $("#upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
            $("#upload").on("change", function () {
                var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $("#pic").attr("src", objUrl); //将图片路径存入src中，显示出图片
                }
            });
        });
        $("#pic1").click(function () {
            $("#upload1").click(); //隐藏了input:file样式后，点击头像就可以本地上传
            $("#upload1").on("change", function () {
                var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $("#pic1").attr("src", objUrl); //将图片路径存入src中，显示出图片
                }
            });
        });
        /*******添加广告*********/
        $('#ads_add').on('click', function () {
            //获取所属端
            var adverPlatform;
            //获取所属分类
            var adverLocation;
            //获取链接内容
            var adverContent;
            //获取链接地址
            var adverContenturl;
            //获取状态
            var adverType;
            //获取图片
            var adverImageurl;
            layer.open({
                type: 1,
                title: '添加广告',
                maxmin: true,
                shadeClose: false, //点击遮罩关闭层
                area: ['800px', ''],
                content: $('#add_ads_style'),
                btn: ['提交', '取消'],
                yes: function (index, layero) {
                    var adverPlatforms = document.getElementsByName("adverPlatform");
                    for (var i = 0; i < adverPlatforms.length; i++) {
                        if (adverPlatforms[i].checked == true) {
                            adverPlatform = adverPlatforms[i].value;
                        }
                    }
                    adverLocation = $(".adverLocation option:selected").val();
                    var adverContents = document.getElementsByName("adverContent");
                    for (var i = 0; i < adverContents.length; i++) {
                        if (adverContents[i].checked == true) {
                            adverContent = adverContents[i].value;
                        }
                    }
                    adverContenturl = $(".adverContenturl").val();
                    var adverTypes = document.getElementsByName("adverType");
                    for (var i = 0; i < adverTypes.length; i++) {
                        if (adverTypes[i].checked == true) {
                            adverType = adverTypes[i].value;
                        }
                    }
                    adverImageurl = $(".adverImageurl").val();

                    //判断分类
                    if (adverLocation != 0) {
                        if (!!adverContenturl) {
                            if (!!adverImageurl) {
                                var form = new FormData(document.getElementById("form"));
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/admin/addAdvertise",
                                    type: "post",
                                    data: form,
                                    processData: false,
                                    contentType: false,
                                    beforeSend : function(){
                                        layer.load(2);
                                    },
                                    success: function (data) {
                                        if (data) {
                                            layer.msg('添加成功！', {icon: 1, offset: 't', time: 1000}, function () {
                                                window.location.reload();
                                            });
                                        }
                                    },
                                    complete: function(){
                                        layer.closeAll();
                                    },
                                    error: function () {
                                        layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                                    }
                                });
                            } else {
                                layer.msg("请上传广告图片", {icon: 7, time: 1000});
                            }
                        } else {
                            layer.msg("请输入链接地址", {icon: 7, time: 1000});
                        }
                    } else {
                        layer.msg("请选择分类", {icon: 7, time: 1000});
                    }
                }
            });
        });
    });

    /*广告图片-停用*/
    function advertise_stop(obj, id) {
        layer.confirm('确认要关闭吗？', {icon: 0,}, function (index) {
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/admin/update_advertise',
                dataType: 'json',
                data: {
                    adverType: 2,
                    id: id
                },
                success: function (result) {
                    if (result) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="advertise_start(this,'+id+')" href="javascript:void(0);"    title="显示"><i class="fa fa-check bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">隐藏</span>');
                        $(obj).remove();
                        layer.msg('已隐藏！', {icon: 1, offset: 't', time: 1000});
                    }
                },
                error: function () {
                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    }

    /*广告图片-启用*/
    function advertise_start(obj, id) {
        layer.confirm('确认要显示吗？', {icon: 0,}, function (index) {
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/admin/update_advertise',
                dataType: 'json',
                data: {
                    adverType: 1,
                    id: id
                },
                success: function (result) {
                    if (result) {
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs" onClick="advertise_stop(this,'+id+')" href="javascript:void(0);" title="隐藏"><i class="fa fa-close bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">显示</span>');
                        $(obj).remove();
                        layer.msg('已显示！', {icon: 1, offset: 't', time: 1000});
                    }
                },
                error: function () {
                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    }
    //修改广告
    function advertise_edit(id) {
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/admin/getAdvertiseById',
            dataType: 'json',
            data: {
                id: id
            },
            success: function (result) {
                $(".id").val(result.id);
                //判断所属端
                if (result.adverPlatform == 1) {
                    $(".adverPlatform1").prop("checked", "checked");
                }
                if (result.adverPlatform == 2) {
                    $(".adverPlatform2").prop("checked", "checked");
                }
                //判断所属分类
                $("._adverLocation option[value='" + result.adverLocation + "']").attr("selected", "selected");
                //判断链接内容
                if (result.adverContent == 1) {
                    $(".adverContent1").prop("checked", "checked");
                }
                if (result.adverContent == 2) {
                    $(".adverContent2").prop("checked", "checked");
                }
                if (result.adverContent == 3) {
                    $(".adverContent3").prop("checked", "checked");
                }
                //获取链接地址
                $("._adverContenturl").val(result.adverContenturl);
                //获取状态
                if (result.adverType == 1) {
                    $(".adverType1").prop("checked", "checked");
                }
                if (result.adverType == 2) {
                    $(".adverType2").prop("checked", "checked");
                }
                //获取图片
                $("#pic1").attr("src", result.adverImageurl);
                layer.open({
                    type: 1,
                    title: '修改广告',
                    maxmin: true,
                    shadeClose: false, //点击遮罩关闭层
                    area: ['800px', ''],
                    content: $('.update_ads_style'),
                    btn: ['提交', '取消'],
                    yes: function (index, layero) {
                        //获取所属端
                        var adverPlatform;
                        //获取所属分类
                        var adverLocation;
                        //获取链接内容
                        var adverContent;
                        //获取链接地址
                        var adverContenturl;
                        //获取状态
                        var adverType;
                        var adverPlatforms = document.getElementsByName("_adverPlatform");
                        for (var i = 0; i < adverPlatforms.length; i++) {
                            if (adverPlatforms[i].checked == true) {
                                adverPlatform = adverPlatforms[i].value;
                            }
                        }
                        adverLocation = $("._adverLocation option:selected").val();
                        var adverContents = document.getElementsByName("_adverContent");
                        for (var i = 0; i < adverContents.length; i++) {
                            if (adverContents[i].checked == true) {
                                adverContent = adverContents[i].value;
                            }
                        }
                        adverContenturl = $("._adverContenturl").val();
                        var adverTypes = document.getElementsByName("_adverType");
                        for (var i = 0; i < adverTypes.length; i++) {
                            if (adverTypes[i].checked == true) {
                                adverType = adverTypes[i].value;
                            }
                        }
                        //判断分类
                        if (adverLocation != 0) {
                            if (!!adverContenturl) {
                                // if (!!adverImageurl){
                                var update_form = new FormData(document.getElementById("update_form"));
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/admin/edit_advertise",
                                    type: "post",
                                    data: update_form,
                                    processData: false,
                                    contentType: false,
                                    success: function (data) {
                                        if (data) {
                                            layer.msg('修改成功！', {icon: 1, offset: 't', time: 1000}, function () {
                                                window.location.reload();
                                            });
                                        }
                                    },
                                    error: function () {
                                        layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                                    }
                                });
                                // }else {
                                //     layer.msg("请上传广告图片", {icon: 7, time: 1000});
                                // }
                            } else {
                                layer.msg("请输入链接地址", {icon: 7, time: 1000});
                            }
                        } else {
                            layer.msg("请选择分类", {icon: 7, time: 1000});
                        }
                    }
                });
            },
            error: function () {
                layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
            }
        });
    }

    /*广告图片-删除*/
    function advertise_del(obj, id) {
        layer.confirm('确认要删除吗？', {icon: 0,}, function (index) {
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/admin/deleteAdvertise',
                dataType: 'json',
                data: {
                    id: id
                },
                success: function (result) {
                    if (result.code == "2000") {
                        layer.msg('删除成功！', {icon: 1, offset: 't', time: 1000}, function () {
                            window.location.reload();
                        });
                    }
                    if (result.code == "7001") {
                        layer.msg('七牛云文件不存在，删除七牛云文件出错！', {icon: 1, offset: 't', time: 1000});
                    }
                    if (result.code == "7002") {
                        layer.msg('获取广告出错！', {icon: 1, offset: 't', time: 1000});
                    }
                    if (result.code == "5000") {
                        layer.msg('删除广告出错！', {icon: 1, offset: 't', time: 1000});
                    }
                },
                error: function () {
                    layer.msg('服务器出错，请稍后再试！', {icon: 2, offset: 't'});
                }
            });
        });
    }

    /*上传图片预览*/
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null;
        if (file != null && file != ""){
            if (window.createObjectURL != undefined) { // basic
                url = window.createObjectURL(file);
            } else if (window.URL != undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file);
            } else if (window.webkitURL != undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file);
            }
        }
        return url;
    }

    //限制上传文件的类型和大小
    function validate_img(ele) {
        // 返回 KB，保留小数点后两位
        var file = ele.value;
        if (file != null && file != ""){
            if (!/.(jpg|jpeg|png|JPG|bmp)$/.test(file)) {
                layer.msg('图片类型必须是jpeg,jpg,png,bmp中的一种!', {icon: 7, time: 1000});
                return false;
            } else if (((ele.files[0].size).toFixed(2)) >= (3 * 1024 * 1024)) {
                //返回Byte(B),保留小数点后两位
                layer.msg('请上传小于3M的图片!', {icon: 7, time: 1000});
                return false;
            }
        }
    }
</script>