<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link href="/assets/vendors/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="/assets/vendors/distpicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet">
    <link href="/assets/vendors/chosen/chosen.min.css" rel="stylesheet">
    <link href="/assets/page.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/vendors/AdminLTE.min.css" />
    <link rel="stylesheet" href="/assets/vendors/font-awesome.min.css" />
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
			      <li class='active'>
				     <a href="bbs-list.jsp">帖子列表</a>
			      </li>
			      <li >
				     <a href="bbs-post.jsp">发布贴子</a>
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
            	<p><a href="bbs-post.jsp">&lt; 去发贴</a></p>
          	</div>

            <!--页面右侧-->
            <div  class="main">

              <!--列表头部-->
              <div class="row">
	              <div class="panel-heading panel">
		              <div class=" panel-default" >
		                <h4>	                 
		                                    帖子列表
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
					              <h4 style="color: #5092BD;"><strong><a href = "bbs_show.html" target = "_blank">资料标题</a></strong></h4>					
					              <p>婆婆的养老跟媳妇无关，这是本版共识吧---------这百分百赞同，同理岳父母哈，我一向男女平等不双标。</p>
					              <span class="glyphicon glyphicon-user" style="font-size: 12px;">
					              	Tom
					              </span>	
					              <a href="#" title="删除">
					              	<span class="pull-right text-muted glyphicon glyphicon-trash"></span>
					              </a>
					            </div>
					            <!-- /.box-body -->					           
					          </div>					          
					        </div>
					        
					        <!-- /.col -->
					        <div class="col-md-12">									
							 			<div class="box box-widget">
					            <div class="box-body">
					              <!-- post text -->
					              <h4 style="color: #5092BD;"><strong><a href = "bbs_show.html" target = "_blank">帖子标题</a></strong></h4>					
					              <p>婆婆的养老跟媳妇无关，这是本版共识吧---------这百分百赞同，同理岳父母哈，我一向男女平等不双标。</p>
					              <span class="glyphicon glyphicon-user" style="font-size: 12px;">
					              	Tom
					              </span>		
					              <a href="#" title="删除">
					              	<span class="pull-right text-muted glyphicon glyphicon-trash"></span>
					              </a>
					            </div>
					            <!-- /.box-body -->					           
					         </div>					          
					        </div>
					        
					        <!-- /.col -->
					        <div class="col-md-12">									
							 			<div class="box box-widget">
					            <div class="box-body">
					              <!-- post text -->
					              <h4 style="color: #5092BD;"><strong><a href = "bbs_show.html" target = "_blank">天涯论坛</a></strong></h4>					
					              <p>婆婆的养老跟媳妇无关，这是本版共识吧---------这百分百赞同，同理岳父母哈，我一向男女平等不双标。</p>
					              <span class="glyphicon glyphicon-user" style="font-size: 12px;">
					              	Tom
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

    <script src="/assets/vendors/jquery-1.11.1.min.js"></script>
    <script src="/assets/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="/assets/vendors/distpicker/bootstrap-datepicker.min.js"></script>
    <script src="/assets/vendors/distpicker/bootstrap-datepicker.zh-CN.min.js"></script>
    <script src="/assets/vendors/chosen/chosen.jquery.min.js"></script>
    <script src="/assets/vendors/lodash.min.js"></script>
    <script src="/assets/vendors/jquery.confirm.min.js"></script>
    <script src="/assets/yoozi.js"></script>
    <script src="/assets/common.js"></script>

    <script type="text/javascript">
      $(document).ready(function(){

        //日期选择
        yoozi.datapicker('.datepicker');

      });
    </script>
  </body>
</html>