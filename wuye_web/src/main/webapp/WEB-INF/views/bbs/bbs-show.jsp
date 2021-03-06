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
              <li class='active'>
                <a href="/bbs/bbslist">帖子列表</a>
              </li>
               <li >
                <a href="/bbs/bbspost">我要发贴</a>
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
            	<p><a href="/bbs/bbspost">&lt; 去发贴</a></p>
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
                	楼主：<a href="#">${bbs.loginname}</a>
                </span>
                <span class="description">${bbs.createtime}</span>
              </div>
              <!-- /.user-block -->
              <div class="box-tools">
                
                <a href = "/bbs/bbslist">返回帖子列表</a>
                
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- post text -->
              <h4 style="color: #5092BD;"><strong>${bbs.title}</strong></h4>

              <p>${bbs.content}</p>

              <button type = "button" class="btn btn-default btn-xs" id = "comt"><i class="fa fa-comments-o"></i> Comments</button>
              
            </div>
            <!-- /.box-body -->
            <div class="box-footer box-comments">

                <div id="comments">

                <!-- /.comment-text -->
              </div>
              <!-- /.box-comment -->
                <div class = "pull-right more" ><a href = "#" ref = "" >查看更多→</a></div>
            </div>
            <!-- /.box-footer -->
              <div class="box-footer">
                  <form action="/bbs/saveBBSComment" method="post">
                      <input type="text"  class="form-control input-sm" id="incomt" placeholder="请输入评论内容"
                             name="content">
                      <input type="hidden" name="bbsid" value="${bbs.id}">
                      <input type="hidden" name="loginname"  value="<shiro:principal/>">
                      <button type="submit" class="btn btn-default btn-xs send"
                              style="float: right;margin-top: 10px"> 提交
                      </button> </form>
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
              <script src="${basePath}assets/vendors/jquery-1.11.1.min.js"></script>
              <script src="${basePath}assets/vendors/bootstrap/bootstrap.min.js"></script>
              <script src="${basePath}assets/vendors/distpicker/bootstrap-datepicker.min.js"></script>
              <script src="${basePath}assets/vendors/distpicker/bootstrap-datepicker.zh-CN.min.js"></script>
              <script src="${basePath}assets/vendors/chosen/chosen.jquery.min.js"></script>
              <script src="${basePath}assets/vendors/lodash.min.js"></script>
              <script src="${basePath}assets/vendors/jquery.confirm.min.js"></script>
              <script src="${basePath}assets/yoozi.js"></script>
              <script src="${basePath}assets/common.js"></script>
             <%-- <script src="${basePath}assets/bootstrap-paginator.min.js"></script>--%>
              <script src="${basePath}assets/mustache.js"></script>
              <script id="template" type="x-tmpl-mustache">
                 <div class="box-comment">
                      <span class="username" style="color: #6292CE;">
                        {{loginname}}：
                        <span class="text-muted pull-right">{{createtime}}</span>
                      </span><!-- /.username -->
                  {{content}}
                </div>
            </script>

    <script type="text/javascript">
      $(document).ready(function(){

        //日期选择
        yoozi.datapicker('.datepicker');
          $("#comt").click(function(){
              $("#incomt").focus();

          });
          $(function () {
              pageStart();//开始分页

              function pageStart() {//分页函数

                  $.ajax({ //去后台查询第一页数据
                          type: "GET",
                          url: "/bbs/findPageBBSComment",
                          dataType: "json",
                          data: {id:${bbs.id},pageNum: 1},	//参数：当前页为1
                          success: function (data) {
                              console.log(data);
                              $("#comments").html("");
                              var template = $('#template').html();
                              Mustache.parse(template);
                              if(data.isLastPage){
                                  $(data.list).each(function () {
                                      var rendered = Mustache.render(template, this);
                                      $("#comments").append(rendered);
                                  });
                                  $(".more").hide();
                              }else {
                                  $(data.list).each(function () {
                                      var rendered = Mustache.render(template, this);
                                      $("#comments").append(rendered);
                                  });
                              }
                              var pageNum =1;
                        $(".more").click( function () {
                            pageNum=pageNum+1;
                            $.get("/bbs/findPageBBSComment", {id:${bbs.id},pageNum:pageNum}, function (json) {
                                console.log(json);
                                pageNum = json.nextPage;

                                var template = $('#template').html();
                                Mustache.parse(template);
                                if(json.isLastPage){
                                    $(json.list).each(function () {
                                        var rendered = Mustache.render(template, this);
                                        $("#comments").append(rendered);

                                    });
                                    $(".more").hide();
                                }else {
                                    $(json.list).each(function () {
                                        var rendered = Mustache.render(template, this);
                                        $("#comments").append(rendered);

                                    });
                                }

                      });
                  });
                  }

          })

      }
          })
      })
    </script>

          </div>
  </body>
</html>