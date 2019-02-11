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
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/admin/assets/css/ace-ie.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/admin/Widget/dataTables/jquery.dataTables.min.css"
          type="text/css">
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


<form action="${pageContext.request.contextPath }/menu/addmenutwo" method="post">
    <div id="add_ads_child_style" style="display:block;">
        <div class="add_adverts">
            <ul>
                <li>
                    <label class="label_name">pid:</label>
                    <input name="pid" type="text"  readonly="readonly" value="${pid}" />
                </li>
                <li>
                    <label class="label_name">url:</label>
                    <input name="url" type="text">
                </li>
                <li>
                    <label class="label_name">name:</label>
                    <input name="name" type="text">
                </li>
                <li>
                    <span class="cont_style">
                    <input type="submit" class="col-xs-10 col-sm-5"  style="width:60px" value="提交">
                </span>
                </li>
            </ul>
        </div>
    </div>
</form>



<body>

<div class="table_menu_list" id="testIframe">
    <table class="table table-striped table-bordered table-hover" id="sample-table">
        <thead>

        <tr>
            <th width="100px">pid</th>
            <th width="200px">url</th>
            <th width="100px">name</th>
            <th width="100px">id</th>
            <th width="100px">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${menuTwoList}" var="menu">
            <tr>
                <td width="80px">${menu.pid}</td>
                <td width="80px">${menu.url}</td>
                <td width="250px">${menu.name}</td>
                <td width="80px">${menu.id}</td>
                <td class="td-manage">

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>