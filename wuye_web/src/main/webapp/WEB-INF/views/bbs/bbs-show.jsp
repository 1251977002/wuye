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
    <link href="./assets/vendors/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="./assets/vendors/distpicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet">
    <link href="./assets/vendors/chosen/chosen.min.css" rel="stylesheet">
    <link href="./assets/page.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/vendors/AdminLTE.min.css" />
    
    <link rel="stylesheet" href="./assets/vendors/font-awesome.min.css" />
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
                <a href="bbs-post.jsp">我要发贴</a>
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
            	
    
    <!-- Main content -->
    <section class="content">

     <div class="row">
        
        <!-- /.col -->
        <div class="col-md-12">

		  <div class="box box-widget">
            <div class="box-header with-border">
              <div>                
                <span class="username">
                	楼主：<a href="#">Jonathan Burke Jr.</a>
                </span>
                <span class="description">发布于23分钟之前</span>
              </div>
              <!-- /.user-block -->
              <div class="box-tools">
                
                <a href = "bbs-list.jsp">返回帖子列表</a>
                
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- post text -->
              <h4 style="color: #5092BD;"><strong>资料标题</strong></h4>

              <p>没有the coast of the Semantics, a large language ocean.
                A small river named Duden flows by their place and supplies
                it with the necessary regelialia. It is a paradisematic
                country, in which roasted parts of sentences fly into
                your mouththe coast of the Semantics, a large language ocean.
                A small river named Duden flows by their place and supplies
                it with the necessary regelialia. It is a paradisematic
                country, in which roasted parts of sentences fly into
                your mouththe coast of the Semantics, a large language ocean.
                A small river named Duden flows by their place and supplies
                it with the necessary regelialia. It is a paradisematic
                country, in which roasted parts of sentences fly into
                your mouth</p>

              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> Like</button>
              <button type = "button" class="btn btn-default btn-xs" id = "comt"><i class="fa fa-comments-o"></i> Comments</button>
              
            </div>
            <!-- /.box-body -->
            <div class="box-footer box-comments">
							<div class="box-comment">               
                <div>
                      <span class="username" style="color: #6292CE;">
                        Nora Havisham：
                        <span class="text-muted pull-right">2019-12-8 14:36:26</span>
                      </span><!-- /.username -->
                  The point of using Lorem Ipsum is that it has a more-or-less
                  normal distribution of letters, as opposed to using
                  'Content here, content here', making it look like readable English.
                </div>
                <!-- /.comment-text -->
              </div>
              <!-- /.box-comment -->
							<div class = "pull-right"><a href = "#">查看更多→</a></div>
            </div>
            <!-- /.box-footer -->
            <div class="box-footer">
							<form action="xxx" method="post" >					
								<div class="img-push">
								  <input type="text" id = "incomt" class="form-control input-sm" placeholder="请输入评论内容">
								</div>
							 </form>	
            </div>
            <!-- /.box-footer -->
          </div>
          
        </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
 
  <!-- /.content-wrapper -->

              
    				</div>
    <!-- /container -->
   <!--  <script type="text/javascript">
         function ulrHtml(num){
                     var toUrl = "room-edit.html?"+num;   
             window.open(toUrl);         
        }
</script> -->

    <script src="./assets/vendors/jquery-1.11.1.min.js"></script>
    <script src="./assets/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="./assets/vendors/distpicker/bootstrap-datepicker.min.js"></script>
    <script src="./assets/vendors/distpicker/bootstrap-datepicker.zh-CN.min.js"></script>
    <script src="./assets/vendors/chosen/chosen.jquery.min.js"></script>
    <script src="./assets/vendors/lodash.min.js"></script>
    <script src="./assets/vendors/jquery.confirm.min.js"></script>
    <script src="./assets/yoozi.js"></script>
    <script src="./assets/common.js"></script>

    <script type="text/javascript">
      $(document).ready(function(){

        //日期选择
        yoozi.datapicker('.datepicker');

      });
    </script>
  </body>
</html>