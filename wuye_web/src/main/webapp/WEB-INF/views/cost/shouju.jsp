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

    <title>物业费缴纳</title>

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
  <body>
    <div class="list">
      <div class="con">
        <input type="hidden" name="propertid" class="propertid" value="${param.propertid}">
          <div class="header">
            <div class="logo">
              <img src="${basePath}assets/images/logo.jpg">
            
            <div class="title" >
              <h2>仙桃世纪花城物业服务有限公司</h2>
              <span class="icon">收款收据</span>
              <span class="number">编号：${propert.propertno}</span>
            </div>
           </div>
          </div>
      <table class="table" id="tab" >
        <tr >
          <td colspan="2" style="text-align: left; border-style: none;">客户姓名：${propert.username}</td>
          <td style="text-align: left; padding-left:40px;border-style: none;">房间名称：${propert.housenum}</td>
          <td colspan=2 style="border-style: none; text-align: right;"><span style="padding-right: 20px">${year}年</span> <span style="padding-right: 20px">${month}月</span>  <span>${day}日</span></td>
        </tr>
          <tr >
            <td>项目</td>
            <td>周期</td>
            <td>缴费日期</td>
            <td>到期日期</td>
            <td>订单收入</td>
          </tr>

          <tr>
            <td>物业费</td>
            <td>${propert.payid}</td>
            <td>${propert.begintime}</td>
            <td>${propert.endtime}</td>
            <td>${propert.money}</td>
          </tr>
          <tr>
            <td colspan=5 style="text-align: left;border-bottom: 1px solid #ddd;">实际收款（大写）：${propert.money}</td>
          </tr>

          <tr>
            <td colspan="5" style="text-align: left;border-style: none;">付款说明：${propert.title}</td>
          </tr>

            <tr style="border-style: none;">
              <td colspan=2 style="text-align: left; border-style: none;border-bottom:1px solid #fff;padding-top:15px;">付款方式：${propert.payway}</td>
              <td style="text-align: left;border-style: none;border-bottom:1px solid #fff;padding-top:15px;">开票人：</td>
              <td colspan=2 style="border-style: none; text-align:center;border-bottom:1px solid #fff;padding-top:15px;">客户确认（签名）：</td>
            </tr>
     </table>
     
      </div>
  </div>
  </body>
</html>