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

    <title>物业费缴纳记录列表</title>

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
  <body class="">
  <jsp:include page="../head.jsp">
    <jsp:param name="menu" value="cost" />
  </jsp:include>
        
    <!-- <div class="list-container have-subhead"> -->
      
        <!--头部副标题导航-->
        <nav class="navbar navbar-fixed-top subhead">
          <div class="navbar-collapse collapse">
            <ul class="sub-list">
              <li class='bread'>
                收费管理:
              </li>
              <li class='active'>
                <a href="/cost/list">物业费账单</a>
              </li>
              <li >
                <a href="/cost/add">收取物业费</a>
              </li>
               
            </ul>
            
          </div>
        </nav>
        <!-- #头部副标题导航-->  
        <!--页面主体-->
          <div  class="list-container have-subhead">
            <!--页面左侧-->
            <div class="sidebar">
               <h1>返回</h1>
               <!--查询表单-->
               <p><a href="/cost/list">&lt; 查看物业费账单列表</a></p>
            </div>
            <div class="main">
              <!--列表头部-->
              <div>
                <h5>
                  <!--列表的标题-->
                  物业费缴费记录
                </h5>
              </div>
              <!-- #列表头部-->

              <!--列表-->
              <div>
                <table class="table table-striped table-hover">
                  <thead>
                    <tr>
                      <th>缴费日期</th>
                      <th>收款人</th>
                      <th>付款方式</th>
                      <th>物业费期限</th>
                      <th>打印收据</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="propert" items="${propertList}">
                    <tr>
                      <td>${propert.paytime}</td>
                      <td>${propert.adminname}</td>
                      <td>${propert.payway}</td>
                      <td>${propert.begintime} 至 ${propert.endtime}</td>
                      <td>
                        <a target="_blank" href="/cost/shouju?propertid=${propert.id}" class="btn btn-xs btn-primary">
                            <span class="glyphicon glyphicon-pencil"></span> 打印收据
                        </a>
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- #列表-->
            </div>
          </div>
    </div>

    <script src="${basePath}assets/vendors/jquery-1.11.1.min.js"></script>
    <script src="${basePath}assets/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="${basePath}assets/vendors/distpicker/bootstrap-datepicker.min.js"></script>
    <script src="${basePath}assets/vendors/distpicker/bootstrap-datepicker.zh-CN.min.js"></script>
    <script src="${basePath}assets/vendors/chosen/chosen.jquery.min.js"></script>
    <script src="${basePath}assets/vendors/lodash.min.js"></script>
    <script src="${basePath}assets/vendors/jquery.confirm.min.js"></script>
    <script src="${basePath}assets/yoozi.js"></script>
    <script src="${basePath}assets/common.js"></script>

    <script type="text/javascript">
      $(document).ready(function(){

        //日期选择
        yoozi.datapicker('.datepicker');

      });
    </script>
  </body>
</html>