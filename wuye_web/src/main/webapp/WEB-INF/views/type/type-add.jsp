<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../basepath/basepath.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Yoozi Inc.">
    <meta name="robots" content="noindex,nofollow">
    <meta name="csrf-token" content="17nb09nROctqttKz9hcPg4gxNB0wCU8B21t744md">
    <link rel="icon" href="">

    <title>添加户型 </title>

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

    <!-- #头部主标题导航--> 
    <div class="list-container have-subhead">
          
        <!--头部副标题导航-->
        <nav class="navbar navbar-fixed-top subhead">
          <div class="navbar-collapse collapse">
            <ul class="sub-list">
              <li class='bread'>
                套房管理:
              </li>
              <li>
                <a href="../room/room-list.jsp">套房列表</a>
              </li>
              <li>
                <a href="../room/room-add.jsp">添加套房</a>
              </li>
              <li role="separator" class="divider"></li>
               <li >
                <a href="../house/house-list.jsp">楼栋列表</a>
              </li>
              <li >
                <a href="../house/house-add.jsp">添加楼栋</a>
              </li>
               <li role="separator" class="divider"></li>
              <li>
                <a href="../building/building-list.jsp">单元列表</a>
              </li>
              <li>
                <a href="../building/building-add.jsp">添加单元</a>
              </li>
              <li role="separator" class="divider"></li>
              <li>
                <a href="type-list.jsp">户型列表</a>
              </li>
              <li class='active'>
                <a href="type-add.jsp">添加户型</a>
              </li>
              <li role="separator" class="divider"></li>
              <li>
                <a href="../fee/fee-list.jsp">物业费标准列表</a>
              </li>
              <li>
                <a href="../fee/fee-add.jsp">物业费标准管理</a>
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

            <form class="form-horizontal" enctype="multipart/form-data"  action="#/backend/admin/product" method="post">
              <input type="hidden" name="_token" value="17nb09nROctqttKz9hcPg4gxNB0wCU8B21t744md">
              <input type="hidden" name="id" value="0"/>

              <div>
                <h5>
                  户型信息
                  <span class="pagination-total pull-right">
                    带 <span class="text-danger">*</span> 为必填项
                  </span>
                </h5>
              </div>

              
              <div>
                <table class="form-table">
                  <tbody>
                    <tr>
                      <td class="form-title">
                        <span class="text-danger">*</span>户型名称
                      </td>
                      <td>
                        <input type="text" class="form-control" name="title" value="" placeholder="">
                      </td>
                    </tr>
                    <tr>
                      <td class="form-title">
                        <span class="text-danger">*</span>面积（平米）
                      </td>
                      <td>
                        <input type="text" class="form-control" name="title" value="" placeholder="">
                      </td>
                    </tr>

                    <tr>
                      <td class="form-title">
                        备注
                      </td>
                      <td>
                        <textarea class="form-control" name="title"></textarea>
                      </td>
                    </tr>

                  </tbody>
                </table>
              </div>

              <!--保存按钮-->
              <div>
                <table class="table form-table">
                  <tbody>
                    <tr>
                      <td class="form-title"></td>
                      <td>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">保存</button>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

            </form>
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
        //下拉列表添加 chosen
        yoozi.chosen('.chosen');

      });
    </script>
  </body>
</html>