<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>产品管理--品牌管理--修改品牌</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="${pageContext.request.contextPath }/static/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/font-awesome.min.css"/>
    <link href="${pageContext.request.contextPath }/static/admin/Widget/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath }/static/admin/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/static/admin/assets/layer/layer.js" type="text/javascript"></script>
</head>

<body>
<form action="${pageContext.request.contextPath }/brand/modifybrand" method="post" enctype="multipart/form-data">
    <div id="add_brand" class="clearfix">
        <div class="left_add" style="margin-left: 30%;border-left: 1px solid #ddd;">
            <div class="title_name">修改品牌信息</div>
            <ul class="add_conent">
                <li class=" clearfix">
                    <label class="label_name"><i>*</i>品牌名称：</label>
                    <input name="id" type="hidden" class="add_text" value="${brand.id}"/>
                    <input name="brandName" type="text" class="add_text" value="${brand.brandName}"/>
                </li>
                <li class=" clearfix"><label class="label_name">品牌图片：</label>
                    <div class="demo l_f">
                        <div class="logobox">
                            <div class="resizebox" style="width: 240px;height: 160px;">
                                <img id="pic" src="${brand.brandLogo}" style="width: 150px;height: 150px;margin:0px auto;cursor: pointer;" alt=""/>
                                <input name="brandLogo" type="hidden" value="${brand.brandLogo}"/>
                                <input id="upload" name="adverPic" accept="image/*" type="file" style="display: none" onchange="Javascript:validate_img(this);"/>
                            </div>
                        </div>
                    </div>
                    <div class="prompt"><p>图片大小<b>120px*60px</b>图片大小小于5MB,</p>
                        <p>支持.jpg;.gif;.png;.jpeg格式的图片</p></div>
                </li>
                <li class=" clearfix">
                    <label class="label_name">品牌描述：</label>
                    <textarea name="brandDescription" cols="" rows="" class="textarea" onkeyup="checkLength(this);">${brand.brandDescription}</textarea>
                    <span class="wordage">剩余字数：<span id="sy" style="color:Red;">500</span>字</span>
                </li>
                <li class=" clearfix">
                    <label class="label_name"><i>*</i>显示状态：</label>
                    <c:if test="${brand.brandType == 1}">
                        <label><input name="brandType" type="radio" class="ace" checked="checked" value="1"><span class="lbl">显示</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label><input name="brandType" type="radio" class="ace"  value="2"><span class="lbl">不显示</span></label>
                    </c:if>
                    <c:if test="${brand.brandType == 2}">
                        <label><input name="brandType" type="radio" class="ace"  value="1"><span class="lbl">显示</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label><input name="brandType" type="radio" class="ace"  checked="checked" value="2"><span class="lbl">不显示</span></label>
                    </c:if>
                </li>
            </ul>
        </div>
    </div>
    <div class="button_brand">
        <input name="" type="submit" class="btn btn-warning" value="提交"/>
        <%--<input name="" type="reset" value="重置" class="btn btn-warning"/>--%>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $(".left_add").height($(window).height() - 60);
        $(".right_add").width($(window).width() - 600);
        $(".right_add").height($(window).height() - 60);
        $(".select").height($(window).height() - 195);
        $("#select_style").height($(window).height() - 220);
        //当文档窗口发生改变时 触发
        $(window).resize(function () {
            $(".right_add").width($(window).width() - 600);
            $(".left_add").height($(window).height() - 60);
            $(".right_add").height($(window).height() - 60);
            $(".select").height($(window).height() - 195);
            $("#select_style").height($(window).height() - 220);
        });
        /*上传图片预览*/
        $("#pic").click(function () {
            $("#upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
            $("#upload").on("change",function(){
                var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
                if (objUrl) {
                    $("#pic").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
                }
            });
        });
    });

    function checkLength(which) {
        var maxChars = 500;
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
    /*上传图片预览*/
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }

    //限制上传文件的类型和大小
    function validate_img(ele){
        // 返回 KB，保留小数点后两位
        var file = ele.value;
        if(!/.(jpg|jpeg|png|JPG|bmp)$/.test(file)){
            $('body').dialog({type:'warning',showBoxShadow:true,buttons:[{name: '确定',className: 'defalut'}],discription:'图片类型必须是jpeg,jpg,png,bmp中的一种!',animateIn:'rotateInUpLeft-hastrans',animateOut:'rotateOutUpLeft-hastrans'});
            return false;
        }else if(((ele.files[0].size).toFixed(2))>=(3*1024*1024)){
            //返回Byte(B),保留小数点后两位
            $('body').dialog({type:'warning',showBoxShadow:true,buttons:[{name: '确定',className: 'defalut'}],discription:'请上传小于3M的图片!',animateIn:'rotateInUpLeft-hastrans',animateOut:'rotateOutUpLeft-hastrans'});
            return false;
        }
    }
</script>