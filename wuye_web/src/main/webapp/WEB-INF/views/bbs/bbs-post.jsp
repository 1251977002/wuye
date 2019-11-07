<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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

    <title>社区论坛</title>

    <!-- Bootstrap core CSS -->
    <link href="${basePath}assets/vendors/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="${basePath}assets/vendors/distpicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet">
    <link href="${basePath}assets/vendors/chosen/chosen.min.css" rel="stylesheet">
    <link href="${basePath}assets/page.css" rel="stylesheet">
    <link rel="stylesheet" href="${basePath}assets/vendors/AdminLTE.min.css" />
    <link rel="stylesheet" href="${basePath}assets/vendors/font-awesome.min.css" />
  </head>
  <body class="">

  <jsp:include page="../head.jsp">
      <jsp:param name="menu" value="bbs" />
  </jsp:include>
      
        <!--头部副标题导航-->
        <nav class="navbar navbar-fixed-top subhead">
          <div class="navbar-collapse collapse">
            <ul class="sub-list">
              <li class='bread'>
                               论坛管理:
              </li>
              <li>
                <a href="/bbs/bbslist">帖子列表</a>
              </li>
               <li class='active' >
                <a href="#">我要发贴</a>
              </li>
            </ul>
            
          </div>
        </nav>
        <!-- #头部副标题导航-->  
        <!--页面主体-->
        <div  class="list-container have-subhead">
          <!--页面左侧-->
          <div class="sidebar">
            <h1>我要发贴</h1>
            <p><a href="#">&lt; 去发贴</a></p>
          </div>

          <!--页面右侧-->
          <div  class="main"> 
				    <!-- Main content -->
				    <section class="content">			
				     <div class="row">			        
				        <!-- /.col -->
				        <div class="col-md-12">		
								  <div class="box box-primary" >
									<!-- /.box-header -->
				            <div class="box-header with-border">
							  			<li class = "fa fa-share-alt-square" style = "color:#00a65a"></li>
				              <h1 class="box-title">发布帖子</h1>
				            </div>
				            <!-- /.box-header -->
				            <div class="box-body">
										<form class="form-horizontal" method="post" action="/bbs/saveBBS">
										  <div class="form-group">
												<label class="control-label col-sm-2">标题</label>
												<div class="col-sm-10">
												  <input type="text" class="form-control" name="title" id="title">
                                                    <input type="hidden" name="loginname"  value="<shiro:principal/>">
												</div>
										  </div>
										  
										  <div class="form-group">
												<label class="control-label col-sm-2"  >内容</label>
												<div class="col-sm-10">
													<textarea class="form-control" name="content" id="content" rows="10"></textarea>
												</div>
										  </div>
										 
										  <div class="form-group">
												<div class="col-sm-offset-2 col-sm-10">
												  <button type="submit" class="btn btn-success btn-flat">
													<li class = "fa fa-share"></li>&nbsp;发布
												  </button>
												  <a href = "#" class="btn btn-danger btn-flat pull-right docancel">
													<li class = "fa fa-remove"></li>&nbsp;取消
												  </a>
												</div>
										  </div>
										</form>
				           </div>            
				          </div>
				          <!-- /. box --> 
				        </div>
				      </div>
				    </section>
			    <!-- /.content -->
          </div>
    </div>
    <!-- /container -->
   <!--  <script type="text/javascript">
         function ulrHtml(num){
                     var toUrl = "room-edit.html?"+num;   
             window.open(toUrl);         
        }
</script> -->

    <script src="${basePath}assets/vendors/jquery-1.11.1.min.js"></script>
    <script src="${basePath}assets/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="${basePath}assets/vendors/distpicker/bootstrap-datepicker.min.js"></script>
    <script src="${basePath}assets/vendors/distpicker/bootstrap-datepicker.zh-CN.min.js"></script>
    <script src="${basePath}assets/vendors/chosen/chosen.jquery.min.js"></script>
    <script src="${basePath}assets/vendors/lodash.min.js"></script>
    <script src="${basePath}assets/vendors/jquery.confirm.min.js"></script>
    <script src="${basePath}assets/yoozi.js"></script>
   <%-- <script src="${basePath}assets/common.js"></script>--%>

  <script type="text/javascript">
      $(document).ready(function(){

        //日期选择
          yoozi.datapicker('.datepicker');

      });
      $(function () {
      $(".docancel").click(function(){
          $("#title").val("");
          $("#content").val("");
      });
      })
    </script>
  </body>
</html>