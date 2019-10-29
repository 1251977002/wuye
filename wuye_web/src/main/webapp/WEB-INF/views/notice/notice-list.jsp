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

    <title>公告板</title>

    <!-- Bootstrap core CSS -->
    <link href="${basePath}assets/vendors/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="${basePath}assets/vendors/distpicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet">
    <link href="${basePath}assets/vendors/chosen/chosen.min.css" rel="stylesheet">
    <link href="${basePath}assets/page.css" rel="stylesheet">
     <link rel="stylesheet" href="${basePath}assets/vendors/AdminLTE.min.css" />
    <link rel="stylesheet" href="${basePath}assets/vendors/font-awesome.min.css" />

    
    <!-- Custom styles for this template -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <body class="">
  <jsp:include page="../head.jsp">
      <jsp:param name="menu" value="notice" />
  </jsp:include>
        
    <!-- <div class="list-container have-subhead"> -->
      
        <!--头部副标题导航-->
        <nav class="navbar navbar-fixed-top subhead">
          <div class="navbar-collapse collapse">
            <ul class="sub-list">
              <li class='bread'>
                       	公告板管理:
              </li>
              <li class='active'>
                <a href="notice-list.jsp">公告板列表</a>
              </li>
               <li >
                <a href="notice-post.jsp">发布公告</a>
              </li>
            </ul>           
          </div>
        </nav>
        <!-- #头部副标题导航-->  
        <!--页面主体-->
          <div  class="list-container have-subhead">

            <!--页面左侧-->
            <div class="sidebar">
	            <h1>发布公告</h1>
	            <!--查询表单-->
	            <p><a href="notice-post.jsp">&lt; 去发布公告</a></p>
	          </div>

            <!--页面右侧-->
            <div  class="main">
            	<!--列表头部-->
              <div class="row">
	              <div class="panel-heading panel">
		              <div class=" panel-default" >
		                <h4>	                 
		                                    公告列表
		                </h4>
		              </div>
	              </div>
	            </div>
              <!-- #列表头部-->

              <!--列表-->
              <div>                      
      					<div class="row">  
      						<!-- /.col -->
					        <div class="col-md-12">									
							 			<div class="box box-widget">
					            <div class="box-body">
					              <!-- post text -->
					              <h4 style="color: #5092BD;" align="center"><strong>资料标题</strong></h4>					
					              <p>婆婆的养老跟媳妇无关，这是本版共识吧---------这百分百赞同，同理岳父母哈，我一向男女平等不双标。</p>
					              <span class="glyphicon glyphicon-user" style="font-size: 12px;">
					              	Tom 发布于2019-10-12
					              </span>	
					              <a href="#" title="删除">
					              	<span class="pull-right text-muted glyphicon glyphicon-trash"></span>
					              </a>
					            </div>
					            <!-- /.box-body -->					           
					          </div>					          
					        </div>
					        
	              </div>
	              <!-- #列表-->
	                <!--页码-->
	              <nav class="pull-right">
	                <ul class="pagination pagination-sm">
	                  <ul class="pagination">
	                    <li class="disabled"><span>&laquo;</span></li>
	                    <li class="active"><span>1</span></li>
	                    <li><a href="#">2</a></li>
	                    <li><a href="#">3</a></li>
	                    <li><a href="#">4</a></li>
	                    
	                    <li class="disabled"><span>...</span></li>
	                    <li><a href="#">65</a></li>
	                    <li><a href="#">66</a></li>
	                    <li><a href="#" rel="next">&raquo;</a></li>
	                  </ul>
	                </ul>
	              </nav>
	              <!-- #页码--> 
            </div>
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
    <script src="${basePath}assets/common.js"></script>

    <script type="text/javascript">
      $(document).ready(function(){

        //日期选择
        yoozi.datapicker('.datepicker');

      });
    </script>
  </body>
</html>