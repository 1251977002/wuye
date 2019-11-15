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

    <title>已逾期用户列表 </title>

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
    <jsp:param name="menu" value="control" />
  </jsp:include>
        
    <!-- <div class="list-container have-subhead" >  -->
      
        <!--头部副标题导航-->
        <nav   class="navbar navbar-fixed-top subhead ab">
          <div class="navbar-collapse collapse">
            <ul class="sub-list">
              <li class='bread'>
                物业费逾期管理:
              </li>
              <li >
                <a href="/owe/owedata">欠费概况</a>
                
              </li>
              <li class='active'>
                <a href="#">已逾期用户列表</a>
                
              </li>
               <li>
                <a href="/owe/oweqitian">七天内到期的用户列表</a>
              </li>
            </ul>
            <ul class="sub-btns">
              <li>
                <a href="/owe/exportyuqi" class="btn btn-sm btn-default">
                  <span class="glyphicon glyphicon-list-alt"></span>
                  导出 excel 表
                </a>
              </li>
            </ul>
          </div>
        </nav>
        <!-- #头部副标题导航-->  
        <!--页面主体-->
          <div class="list-container have-subhead ab">

            <!--页面左侧-->
            <div class="sidebar">
              <h1>按条件查询</h1>
              <!--查询表单-->
              <div class="form-group">
                <label>请选择楼栋</label>
                <select class="form-control chosen build" name="buildingname">
                  <option value="">--请选择楼栋--</option>

                  <%--楼栋、ajax--%>
                </select>
              </div>
              <div class="form-group">
                <label>请输入 业主姓名</label>
                <input type="text" class="form-control username" value="${(param.username == null) ? "" : (param.username)}" name="username" placeholder="">
              </div>
              <div class="form-group-btns">
                <button type="button" class="btn btn-sm btn-primary selectInfo">筛选</button>
                <button type="button" class="btn btn-sm btn-default resetInfo">重置</button>
              </div>
            </div>

            <!--页面右侧-->
            <div class="main">

              <!--列表头部-->
              <div>
                <h5>
                  <!--列表的标题-->
                  已逾期用户列表
                  <!--迷你页码-->

                </h5>
              </div>
              <!-- #列表头部-->

              <!--列表-->
              <div>
                <table class="table table-striped table-hover">
                  <thead>
                    <tr>
                      <th>楼栋号</th>
                      <th>单元</th>
                      <th>房间号</th>
                      <th>业主姓名</th>
                      <th>联系电话</th>
                      <th>到期时间</th>
                      <th>物业费标准</th>
                      <th>逾期天数</th>
                      <th>所欠物业费</th>
                      <th>备注</th>
                      <th>操作</th>
                    </tr>
                  </thead>
                  <tbody id="main">



                  </tbody>
                </table>
              </div>
              <!-- #列表-->
              <!--页码-->
              <nav class="pull-right" aria-label="Page navigation">
                <ul id="mypage"></ul>
              </nav>
              <!-- #页码-->
              
            </div>
          </div>
    </div>
    <!-- /container -->
  <!-- 添加备注弹出框 -->

  <div  class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" >
      <div class="modal-content"  >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >修改记录列表</h4>
        </div>
        <div class="modal-body">
          <div role="tabpanel" class="tab-pane " >
            <br />
            <table class="table table-striped">
              <thead>
              <tr>
                <th>管理员</th>
                <th>备注</th>
                <th>发布时间</th>
              </tr>
              </thead>
              <tbody class = "record">

              </tbody>
            </table>
            <br />
            <h5>添加备注</h5>
            <div>
              <form action="/owe/saveRecord" method="post">
                <table class="form-table">
                  <tbody>
                  <tr>
                    <td class="form-title">
                      备注
                    </td>
                    <td>
                      <input type="hidden" name="userid" value="" class="userid1" >
                      <input type="text" class="form-control" name="title" value="" placeholder="">
                      <input type="hidden" name="adminname" class="adminname" value="<shiro:principal/>">
                    </td>
                  </tr>
                  <tr>
                    <td class="form-title"></td>
                    <td>
                      <button type="submit" class="btn btn-primary">保存</button>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </form>
            </div>
          </div>
        </div>
        <!--  <div class="modal-footer">
           <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

         </div> -->
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
  <script src="${basePath}assets/bootstrap-paginator.min.js"></script>
  <script src="${basePath}assets/mustache.js"></script>
  <script id="template" type="x-tmpl-mustache">
    <tr>
        <td>{{buildingname}}</td>
        <td>{{unitname}}</td>
        <td>{{housenum}}</td>
        <td>{{username}}</td>
        <td>{{user.tel}}</td>
        <td>{{endtime}}</td>
        <td>{{user.model.propertmoney}}元/年</td>
        <td>{{overday}}</td>
        <td>{{overmoney}}元</td>
        <td>{{record.content}}</td>
        <td><!-- 添加备注按钮 -->
            <input type = "hidden" class = "userid" value = "{{user.id}}" >
            <button type="button" class="btn btn-primary btn-xs btnbox" data-toggle="modal" data-target="#myModal">
                          添加备注
            </button>
        </td>
    </tr>
  </script>

  <script id="temp" type="x-tmpl-mustache">
     <tr>
        <td>{{adminname}}</td>
        <td>{{content}}</td>
        <td>{{createtime}}</td>
     </tr>
  </script>

  <script type="text/javascript">
      $(document).ready(function(){

        //日期选择
        yoozi.datapicker('.datepicker');

        automatic();
        function automatic() {
          $.get("/building/findAll", function (json) {
            $(json).each(function () {
              var opt = "<option value=" + this.name + ">" + this.name + "</option>";
              $(".build").append(opt);
            });
          });
        }
      });
      $(function () {
         $("#main").on("click",".btnbox",function () {
           var userid = $(this).siblings(".userid").val();
           $.ajax({
             type: "GET",
             url: "/owe/findbyuserid",
             dataType: "json",
             data: {
               userid: userid,
             },
             success: function (data) {
               $(".record").html("");
               var template = $('#temp').html();
               Mustache.parse(template);
               if(data != null && data.size>0){
                 $(data).each(function (index) {
                   console.log(userid);
                   $(".userid1").attr("value",userid);
                   var rendered = Mustache.render(template, this);
                   $(".record").append(rendered);
                 });
               }else {
                 $(".userid1").attr("value",userid);
               }
             }
           })
         })







            //筛选时，分页
        $(".selectInfo").click(function () {
          pageStart();
        });
        //重置时，分页
        $(".resetInfo").click(function () {
          $(".build").html("<option value=\"\">--请选择楼栋--</option>");
          $(".username").val(""),
                  pageStart();
          automatic();
        });

        pageStart();//开始分页

        function pageStart() {//分页函数
          $.ajax({ //去后台查询第一页数据
            type: "GET",
            url: "/owe/findPageByEndTime",
            dataType: "json",
            data: {pageNum: 1,
              buildingname:$(".build").val(),
              username:$(".username").val()
            },	//参数：当前页为1
            success: function (data) {
              console.log(data);
              $("#main").html("");
              var template = $('#template').html();
              Mustache.parse(template);
              $(data.list).each(function () {
                var rendered = Mustache.render(template, this);
                $("#main").append(rendered);
              });


              var options = {//根据后台返回的分页相关信息，设置插件参数
                bootstrapMajorVersion: 3, //如果是bootstrap3版本需要加此标识，并且设置包含分页内容的DOM元素为UL,如果是bootstrap2版本，则DOM包含元素是DIV
                currentPage: data.pageNum, //当前页数
                totalPages: data.pages == 0 ? "" : data.pages,//总页数
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
                    url: "/owe/findPageByEndTime",
                    type: "get",
                    dataType: "json",
                    data: {pageNum: page,
                      buildingname:$(".build").val(),
                      username:$(".username").val(),
                    },
                    success: function (data) {
                      $("#main").html("");
                      console.log(data);
                      var template = $('#template').html();
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







    <!-- <script type="text/javascript">
         function ulrHtml(num){
                     var toUrl = "room-edit.html?"+num;   
             window.open(toUrl);         
        }
</script> -->
  </body>
</html>