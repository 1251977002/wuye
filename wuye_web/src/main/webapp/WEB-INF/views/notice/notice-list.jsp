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
                <a href="#">公告板列表</a>
              </li>
               <li >
                <a href="/notice/noticePost">发布公告</a>
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
	            <p><a href="/notice/noticePost">去发布公告</a></p>
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
      					<div class="row aa" id="main">
      						<!-- /.col -->

					        
	              </div>
	              <!-- #列表-->
	                <!--页码-->
                  <nav aria-label="Page navigation" style="padding-left: 15px">
                      <ul id="mypage"></ul>
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
  <script src="${basePath}assets/bootstrap-paginator.min.js"></script>
  <script src="${basePath}assets/mustache.js"></script>
  <script id="template1" type="x-tmpl-mustache">

       <div class="col-md-12">
			<div class="box box-widget">
				<div class="box-body">
					  <!-- post text -->
					<h4 style="color: #5092BD;" align="center"><strong>{{title}}</strong></h4>
					<p style="text-indent: 2em;">{{content}}</p>
					<span class="glyphicon glyphicon-user" style="font-size: 12px;">
					   {{loginname}} 发布于{{createtime}}
					       </span>
					      <a class = "del" href="javascript:;" οnclick="js_method()" rel = "{{id}}" title="删除">
					           <span class="pull-right text-muted glyphicon glyphicon-trash"></span>
					             </a>
				</div>
					          <!-- /.box-body -->
			</div>
		</div>

	  </script>

  <script type="text/javascript">
      $(function () {
          $(".aa").on("click",".del", function(){
              console.log(1323)
              if (confirm("确定要删除吗？")) {
                  var noticeid = $(this).attr("rel");
                  window.location.href = "/notice/noticeDel?noticeid=" + noticeid;
              }
          });
      })

      $(document).ready(function(){

          //日期选择
          yoozi.datapicker('.datepicker');

      });
      $(function () {
          pageStart();//开始分页

          function pageStart() {//分页函数
              $.ajax({ //去后台查询第一页数据
                  type: "GET",
                  url: "/notice/findPageNotice",
                  dataType: "json",
                  data: {pageNum: 1},	//参数：当前页为1
                  success: function (data) {
                      console.log(data);
                      $("#main").html("");
                      var template = $('#template1').html();
                      Mustache.parse(template);
                      $(data.list).each(function () {
                          var rendered = Mustache.render(template, this);
                          $("#main").append(rendered);
                      });


                      var options = {//根据后台返回的分页相关信息，设置插件参数
                          bootstrapMajorVersion: 3, //如果是bootstrap3版本需要加此标识，并且设置包含分页内容的DOM元素为UL,如果是bootstrap2版本，则DOM包含元素是DIV
                          currentPage: data.pageNum, //当前页数
                          totalPages: data.pages, //总页数
                          numberOfPages: data.pageSize,//每页记录数
                          itemTexts: function (type, page, current) {//设置分页按钮显示字体样式

                              switch (type) {
                                  case "first":
                                      return "首页";
                                  case "prev":
                                      return "上一页";
                                  case "next":
                                      return "下一页";
                                  case "last":
                                      return "末页";
                                  case "page":
                                      return page;
                              }
                          },
                          onPageClicked: function (event, originalEvent, type, page) {//分页按钮点击事件
                              console.log(data.pageNum);
                              $.ajax({//根据page去后台加载数据
                                  url: "/notice/findPageNotice",
                                  type: "get",
                                  dataType: "json",
                                  data: {pageNum: page},
                                  success: function (data) {
                                      $("#main").html("");
                                      console.log(data);
                                      var template = $('#template1').html();
                                      Mustache.parse(template);
                                      $(data.list).each(function () {
                                          var rendered = Mustache.render(template, this);
                                          $("#main").append(rendered);
                                      });

                                  }
                              });

                          }

                      };
                      $('#mypage').bootstrapPaginator(options);//设置分页
                  }

              });
          }
      })
  </script>
  </body>
</html>