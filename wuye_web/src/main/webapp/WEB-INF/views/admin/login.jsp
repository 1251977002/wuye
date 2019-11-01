<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../basepath/basepath.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Yoozi Inc.">
    <meta name="robots" content="noindex,nofollow">
    <meta name="csrf-token" content="17nb09nROctqttKz9hcPg4gxNB0wCU8B21t744md">
    <link rel="icon" href="">

    <title> 后台登录 </title>

    <!-- Bootstrap core CSS -->
    <link href="${basePath}assets/vendors/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="${basePath}assets/vendors/distpicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet">
    <link href="${basePath}assets/vendors/chosen/chosen.min.css" rel="stylesheet">
    <link href="${basePath}assets/page.css" rel="stylesheet">

    
    <!-- Custom styles for this template -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="sign-page">
  <script src="${basePath}assets/vendors/jquery-1.11.1.min.js"></script>


    <!--[if lt IE 10]>
    <div id="browser-warning" class="contextual bg-danger center navbar-fixed-top">
      <div class="container">
        <i class="glyphicon glyphicon-warning-sign"></i> 目前 物业管理系统不支持 IE 10 以下浏览器使用，请升级浏览器或更换浏览器。推荐使用 Chrome 浏览器。
      </div>
    </div>
    <![endif]-->
    <div class="container">
      
      <form action="/admin/login" class="form-signin" method="post">
        <input type="hidden" name="_token" value="17nb09nROctqttKz9hcPg4gxNB0wCU8B21t744md"/>

        <h2 class="form-signin-heading">物业管理系统</h2>



        <label for="name" class="sr-only">Email</label>

        <input type="text" id="name" class="form-control" name="username" placeholder="用户名" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>

        <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Password" required>
        <c:if test="${msg eq '用户名或密码错误'}">
        <div class="alert alert-info" role="alert" id="alert"> ${msg}</div><br>
        </c:if>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        <br>
      </form>






    </div> <!-- /container -->
    <script>
      /*$(function () {
        $('#forget').onclick(function () {
          alert("请您携带身份证，前往物业中心，验证身份并找回密码！")
        })
      })*/

    </script>

  </body>
</html>