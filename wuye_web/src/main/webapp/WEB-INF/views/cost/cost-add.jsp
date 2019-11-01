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

    <title>收费管理 </title>

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
        
   <!--  <div class="list-container have-subhead"> -->
      
        <!--头部副标题导航-->
        <nav class="navbar navbar-fixed-top subhead ab">
          <div class="navbar-collapse collapse">
            <ul class="sub-list">
              <li class='bread'>
                收费管理:
              </li>
              <li >
                <a href="/cost/list">物业费账单</a>
              </li>
              <li class='active'>
                <a href="/cost/add">收取物业费</a>
              </li>
            </ul>
            <ul class="sub-btns">
              <li>
                <a href="#" class="btn btn-sm btn-default">
                  <span class="glyphicon glyphicon-list-alt"></span>
                  导出 excel 表
                </a>
              </li>
            </ul>
          </div>
        </nav>
        <!-- #头部副标题导航-->  
        <!--页面主体-->
          <div  class="list-container have-subhead ab">

            <!--页面左侧-->
            <div class="sidebar">
                <h1>按条件查询</h1>
                <div class="form-group">
                    <label>请选择楼栋</label>
                    <select class="form-control chosen build" name="buildname">
                        <option value="">--请选择楼栋--</option>
                        <%--楼栋、ajax--%>
                    </select>
                </div>
                <div class="form-group">
                  <label>请输入 单元房号</label>
                  <input type="text" class="form-control housename" name="housename" value="${(param.housename == null) ? "" : (param.housename)}" placeholder="">
                </div>
                <div class="empty"></div>
                <div class="form-group-btns">
                  <button type="button" class="btn btn-sm btn-primary selectInfo">查询</button>
                  <button type="button" class="btn btn-sm btn-default resetInfo">重置</button>
                </div>
            </div>

            <!--页面右侧-->
            <div class="main infolist">


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
    <script src="${basePath}assets/bootstrap-paginator.min.js"></script>
    <script src="${basePath}assets/mustache.js"></script>
    <script id="template" type="x-tmpl-mustache">
    <!--列表头部-->
                <div>
                  <h5>
                  <!--列表的标题-->
                  应交的物业费明细
                  </h5>
                </div>
                <!-- #列表头部-->
                <!--列表-->
                <div>
                    <!-- #列表头部-->
                    <table class="form-table">
                        <tbody>
<tr>
                <td class="form-title">
                    <span class="text-danger">*</span>楼栋号
                </td>
                <td>{{buildingname}}</td>
            </tr>
            <tr>
                <td class="form-title">
                     <span class="text-danger">*</span>单元房号
                </td>
                <td>{{unitname}}{{housenum}}</td>
            </tr>
            <tr>
                <td class="form-title">户主姓名</td>
                <td>{{username}}</td>
            </tr>
            <tr>
                <td class="form-title">户型</td>
                <td>
                     {{model.modelname}}（{{model.area}}平米）
                </td>
            </tr>
            <tr>
                <td class="form-title">标准物业费</td>
                <td>
                     <span class = "promoney" name="promoney">{{model.propertmoney}}</span>元/年
                </td>
            </tr>
            <tr>
                <td class="form-title">往年欠费</td>
                <td>￥<span class = "owemoney" name="owemoney">{{owemoney}}</span></td>
            </tr>
            <tr>
                 <td class="form-title">
                      <span class="text-danger">*</span>缴费周期
                 </td>
                 <td>
                      <select class="form-control chosen year" name="year">
                             <%--ajax--%>
                      </select>
                 </td>
            </tr>
            <tr>
                 <td class="form-title">合计应交金额</td>
                 <td>
                      <span class = "money">{{money}}</span>元/年（[往年欠费]+[物业费标准]*「缴费周期」，系统会自动计算该楼层的物业费用）
                 </td>
            </tr>
            <tr>
                 <td class="form-title">
                      <span class="text-danger">*</span>缴纳方式
                 </td>
                 <td>
                      <select class="form-control chosen payway" name="payway">
                          <option value="现金">现金</option>
                          <option value="支付宝">支付宝</option>
                          <option value="微信">微信</option>
                          <option value="银行卡">银行卡</option>
                      </select>
                 </td>
            </tr>
            <tr>
                 <td class="form-title">收款说明</td>
                 <td>
                      <textarea class="form-control cont" name="title"></textarea>
                 </td>
            </tr>
                            <%--ajax--%>
                        </tbody>
                    </table>
                </div>
                <table class="table form-table">
                    <tbody>
                        <tr>
                            <td align="center">
                                <button type="button" class="btn btn-primary btn-lg ensure" data-toggle="modal" data-target=".bs-example-modal-sm">确认</button>
                                <div class="modal  bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                                    <div class="modal-dialog modal-sm" role="document">
                                        <div class="modal-content">
                                            <h3>缴费成功</h3>
                                            <div class="fee">
                                                <a target="_blank" class = "print" href = "javascript:;"> <button type="submit" class="btn btn-primary btn-sm " >打印收据</button> </a>
                                                <button type="button"  class="btn btn-primary btn-sm" data-dismiss="modal">返回</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">取消</button>
                               <div id="fade" ></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
              </div>
              <!-- #列表-->

    </script>


    <script type="text/javascript">
      $(document).ready(function(){

          //日期选择
          yoozi.datapicker('.datepicker');

          $("#find").click(function () {
              $(".build").focus();
          });

          //页面加载时自动生成楼栋
          automatic();
          function automatic() {
              $.get("/building/findAll", function (json) {
                  $(json).each(function () {
                      var opt = "<option value=" + this.name + ">" + this.name + "</option>";
                      $(".build").append(opt);
                  });
              });
          }

          //当点击“查询”时，先判断两个框是否为空，然后异步找出此人的信息
          $(".selectInfo").click(function () {
              var buildname = $(".build").val();
              var housename = $(".housename").val();
              if(buildname == "" || buildname == "null" || buildname == null || housename == "" || housename == "null" || housename == null){
                  $(".empty").html("<span style=\"color: red;font-size: 12px;\" class=\"glyphicon glyphicon-warning-sign\">楼栋和房间号不能为空</span>");
              }else {
                  showInfo();
              }
          });

          //重置时
          $(".resetInfo").click(function () {
              $(".build").html("<option value=\"\">--请选择楼栋--</option>");
              $(".username").val(""),
              automatic();
          });

          //查找此人信息
          function showInfo() {
              $.ajax({
                  type:"GET",
                  url:"/cost/findByBnameAndHname",
                  data:{
                      buildingname:$(".build").val(),
                      unitname:$(".housename").val().substring(0,3),
                      housenum:$(".housename").val().substring(3),
                  },
                  success:function (json) {
                      var template = $('#template').html();
                      Mustache.parse(template);
                      $(".infolist").html("");
                      $(".empty").html("");
                      $(json).each(function () {
                          console.log(json);
                          var rendered = Mustache.render(template, this);
                          $(".infolist").prepend(rendered);
                      });

                      //并生成年份，并根据第一个年份确定合计应交费用
                      $.get("/cost/findAllYear",function (json) {
                          $(".year").empty();
                          $(json).each(function (index) {
                              var opt = "<option value="+this.yearno+">" + this.year + "</option>";
                              $(".year").append(opt);
                              if(index == 0){
                                  $.ajax({
                                      type:"GET",
                                      url:"/cost/findByYear",
                                      data:{
                                          year:1,
                                          promoney:$(".promoney").text(),
                                          owemoney:$(".owemoney").text(),
                                      },
                                      success:function (json) {
                                          $(".money").text(json);
                                      }
                                  });
                              }
                          });
                      });
                  }
              });
          }

          //"缴费周期"变化时，合计应缴费用应该改变
          $(".infolist").on("change",".year",function () {
              $.ajax({
                  type:"GET",
                  url:"/cost/findByYear",
                  data:{
                      year:$(".year").val(),
                      promoney:$(".promoney").text(),
                      owemoney:$(".owemoney").text(),
                  },
                  success:function (json) {
                      $(".money").text(json);
                  }
              });
          })

          $(".infolist").on("click",".ensure",function () {
              $.ajax({
                  type:"GET",
                  url:"/cost/addPropert",
                  data:{
                      buildingname:$(".build").val(),
                      unitname:$(".housename").val().substring(0,3),
                      housenum:$(".housename").val().substring(3),
                      year:$(".year").val(),
                      money:$(".money").text(),
                      payway:$(".payway").val(),
                      title:$(".cont").val()
                  },
                  success:function (json) {
                      if(json.id == 0){
                          alert("账单已存在，请勿重复操作！");
                      }else {
                          $(".print").click(function(){
                              window.location.href = "/cost/shouju?propertid="+json.id;
                          });
                      }
                  }
              });
          })

      });
    </script>

  </body>
</html>