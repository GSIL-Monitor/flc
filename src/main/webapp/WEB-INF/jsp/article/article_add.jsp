<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/admin/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/admin/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/admin/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/admin/js/H-ui.js" type="text/javascript"></script>
    <title>文章管理--添加文章</title>
</head>

<body>
<div class="margin clearfix">
    <div class="article_style">
        <div class="add_content" id="form-article-add">
            <ul>
                <li class="clearfix Mandatory">
                    <label class="label_name"><i>*</i>文章标题</label>
                    <span class="formControls col-10"><input name="文章标题" type="text" id="articleTitle" class="col-xs-10 col-sm-5 "></span>
                </li>
                <li class="clearfix">
                    <label class="label_name"><i>*</i>显示状态</label>
                    <span class="formControls col-10">
                        <span class="add_date l_f">
                            <label><input name="radio" type="radio" class="ace" checked value="1"><span class="lbl">显示</span></label>&nbsp;
                            <label><input name="radio" type="radio" class="ace" value="2"><span class="lbl">不显示</span></label>
                        </span>
                    </span>
                </li>
                <li class="clearfix">
                    <label class="label_name"><i>*</i>文章内容</label><br>
                    <textarea name="content1" id="product" style="width:90%;height:500px;margin:0 auto;" placeholder="请输入内容..."></textarea>
                </li>
            </ul>
            <div class="Button_operation">
                <button onclick="article_save_submit();" class="btn btn-primary radius" type="submit">保存并提交</button>
                <button onclick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript">
    KindEditor.ready(function(K) {
        var options = {
            items : [
                'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
                'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent',
                'quickformat', 'selectall', '|', 'fullscreen', '/',
                'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
                'insertfile', 'table', 'hr', 'emoticons', 'pagebreak',
                'anchor', 'link', 'unlink', '|', 'about'
            ],
            filterMode : true,
            allowFileManager: true,
            uploadJson: '${pageContext.request.contextPath }/admin/articleUpload',
            afterCreate : function() {
                this.sync();
            },
            afterBlur:function(){
                this.sync();
            }
        };
        window.editor = K.create('#product', options);
    });
    /**提交操作**/
    function article_save_submit() {
        var articleTitle = $("#articleTitle").val();
        if (!!articleTitle) {
            var articleType = document.getElementsByName("radio");
            for (var i = 0; i < articleType.length; i++){
                if (articleType[i].checked == true){
                    var editorValue = window.editor.html();
                    window.editor.sync();
                    if (!!editorValue){
                        $.ajax({
                            type : 'post',
                            url : '${pageContext.request.contextPath}/admin/add_article',
                            data : {
                                articleTitle : articleTitle,
                                articleType : articleType[i].value,
                                articleContent : editorValue
                            },
                            dataType : 'json',
                            success : function (result) {
                                if (result){
                                    layer.msg('添加成功！', {icon: 1, offset: 't'},function () {
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
                    }else{
                        layer.msg('请输入文章内容！', {icon: 7, offset: 't'});
                    }
                }
            }
        }else{
            layer.msg('请输入文章标题！', {icon: 7, offset: 't'});
        }
    }
</script>