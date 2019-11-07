
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="../basepath/basepath.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>403</title>
    <style>
        html, body {
            padding: 0;
            margin: 0;
            height: 100%;
        }
        .box {
            width: 100%;
            height: 100%;
            background-color: cornflowerblue;
            text-align: center;  /*文本水平居中*/
            line-height: 600px;  /*文本垂直居中*/
        }
    </style>
</head>
<body>

<div class="box">
    <h1 style="display: inline">对不起，您没有权限访问此链接！请您不要伤心~~~嘤嘤嘤 </h1>
    <h1 style="display: inline"><a href="/admin/login" style="text-decoration-line: none">请您点击我，为您跳转到登录页面！☺</a></h1>
</div>

</body>
</html>

