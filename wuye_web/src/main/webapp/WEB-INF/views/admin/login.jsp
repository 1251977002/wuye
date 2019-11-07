<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../basepath/basepath.jsp" %>
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
<div class="container">

    <form action="/admin/login" class="form-signin" method="post">

        <h2 class="form-signin-heading">物业管理系统</h2>


        <input type="text" id="name" class="form-control" name="username" placeholder="用户名" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>

        <input type="password" id="inputPassword" class="form-control" name="password" placeholder="密码" required>

        <%--<div>
        <input type="text" id="tel" class="form-control" name="tel" placeholder="输入手机号获取验证码" required>
          <button class="telcode" href="" style="padding-left: 10px;text-decoration-line: none">获取短信验证码</button>
        </div>
        <input type="text" id="code" class="form-control" name="code" placeholder="验证码" required>--%>
        <c:if test="${msg eq '用户名或密码错误'}">
            <div class="alert alert-info" role="alert" id="alert"> ${msg}</div>
            <br>
        </c:if>
        <input type="text" id="tel" class="form-control" name="tel" placeholder="输入手机号获取验证码" required>

        <div class="telcode">
        <button type="button" class="alert-info" style="padding-left: 10px;text-decoration-line: none">获取短信验证码</button>
        </div>

        <input type="text" id="code" class="form-control" name="code" placeholder="验证码" required>
        <div class="success alert alert-success" style="display: none">
            验证码正确！请点击登录！😊
        </div>

        <button class="btn btn-lg btn-primary btn-block login" type="submit">登录</button>


        <br>
        <br>
    </form>


</div>
<!-- /container -->

<script>
    $(function () {
        $(".telcode").click(function () {

            var tel = $("#tel").val();
            var count = 60;
            $.ajax({
                type: "post",
                url: "/admin/code",
                data: {
                    tel: tel
                },
            });
            $(".telcode").attr("disabled",true);
            $(".telcode").html("<div class=\"alert alert-info\"><span style='font-size: 14px'>"+ count + "秒,后可重新发送</span></div>");


            var time = setInterval(function () {
                count--;
                $(".telcode").html("<div class=\"alert alert-info\"><span style='font-size: 14px'>"+ count + " 秒,后可重新发送</span></div>");
                if (count == 0){
                    clearInterval(time);//清空间隔
                    $(".telcode").attr("disabled",false);
                    $(".telcode").html("重新发送验证码");
                }
            },1000);
        });
        $("#code").blur(function () {
            var codejsp = $("#code").val();
            console.log(codejsp);
            if (4567 != codejsp) {
                alert("验证码不正确，请重新获取")
                $(".login").attr("disabled",true);
            }else{
                $(".success").show();
                $(".success").fadeOut(2000);


            }
        })
        $("#code").focus(function () {
            $(".login").attr("disabled",false);
        })

    })

</script>

</body>
</html>