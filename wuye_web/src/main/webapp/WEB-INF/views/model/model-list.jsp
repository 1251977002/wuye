<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../basepath/basepath.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-e
          quiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Yoozi Inc.">
    <meta name="robots" content="noindex,nofollow">
    <meta name="csrf-token" content="17nb09nROctqttKz9hcPg4gxNB0wCU8B21t744md">
    <link rel="icon" href="">

    <title>户型列表 </title>

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
    <jsp:param name="menu" value="room" />
  </jsp:include>
        
    <div class="list-container have-subhead">

      <!--头部副标题导航-->
      <nav class="navbar navbar-fixed-top subhead">
        <div class="navbar-collapse collapse">
          <ul class="sub-list">
            <li class='bread'>
              套房管理:
            </li>
            <li>
              <a href="room-list.jsp">套房列表</a>
            </li>
            <li>
              <a href="room-add.jsp">添加套房</a>
            </li>
            <li role="separator" class="divider"></li>
            <li >
              <a href="../building/building-list.jsp">楼栋列表</a>
            </li>
            <li >
              <a href="../building/building-add.jsp">添加楼栋</a>
            </li>
            <li role="separator" class="divider"></li>
            <li>
              <a href="../unit/unit-list.jsp">单元列表</a>
            </li>
            <li>
              <a href="../unit/unit-add.jsp">添加单元</a>
            </li>
            <li role="separator" class="divider"></li>
            <li class='active'>
              <a href="../model/model-list.jsp">户型列表</a>
            </li>
            <li>
              <a href="../model/model-add.jsp">添加户型</a>
            </li>
          </ul>
        </div>
      </nav>
      <!-- #头部副标题导航-->

      <!--页面主体-->
          <div class="list-container have-subhead">

            <!--页面左侧-->
            <div class="sidebar">
              <h1>返回</h1>
              <!--查询表单-->
              <p><a href="../room/room-list.jsp">&lt; 查看套房列表</a></p>

            </div>

            <!--页面右侧-->
            <div class="main">

              <!--列表头部-->
              <div>
                <h5>户型管理</h5>
              </div>
              <!-- #列表头部-->

              <!--列表-->
              <div>
                <table class="table table-striped table-hover">
                  <thead>
                    <tr>
                      <th>户型名称</th>
                      <th>面积</th>
                      <th>备注</th>
                      <th width="150">操作</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>三房两厅</td>
                      <td>119平米</td>
                      <td></td>
                      <td>
                        <a href="#" class="btn btn-xs btn-primary">
                          <span class="glyphicon glyphicon-pencil"></span>
                          编辑
                        </a>
                        <a href="#" class="btn btn-xs btn-danger">
                          <span class="glyphicon glyphicon-remove"></span>
                          删除
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td>两房两厅</td>
                      <td>89平米</td>
                      <td></td>
                      <td>
                        <a href="#" class="btn btn-xs btn-primary">
                          <span class="glyphicon glyphicon-pencil"></span>
                          编辑
                        </a>
                        <a href="#" class="btn btn-xs btn-danger">
                          <span class="glyphicon glyphicon-remove"></span>
                          删除
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td>四房两厅</td>
                      <td>139平米</td>
                      <td></td>
                      <td>
                        <a href="#" class="btn btn-xs btn-primary">
                          <span class="glyphicon glyphicon-pencil"></span>
                          编辑
                        </a>
                        <a href="#" class="btn btn-xs btn-danger">
                          <span class="glyphicon glyphicon-remove"></span>
                          删除
                        </a>
                      </td>
                    </tr>

                  </tbody>
                </table>
              </div>
              <!-- #列表-->
              
            </div>
          </div>
    </div>
    <!-- /container -->

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