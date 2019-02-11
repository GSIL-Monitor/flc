<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8">
	<title>404</title>
</head>
<body>
	<div style="position: relative;">
		<h5 style="color: red">${msg}</h5>
		<img src="${pageContext.request.contextPath }/static/admin/images/timg.jpg" alt="" style="position: absolute;left: 35%;top: 150px;">
	</div>	
</body>
</html>