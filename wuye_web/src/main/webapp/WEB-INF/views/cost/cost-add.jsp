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
                <a href="cost-list.jsp">物业费账单</a>
              </li>
              <li class='active'>
                <a href="cost-add.jsp">收取物业费</a>
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
              <!--查询表单-->
              <form method="get">
                <div class="form-group">
                    <label>请选择楼栋</label>
                        <select class="form-control chosen" name="status">
                          <option value="1">一栋</option>
                          <option value="2">二栋</option>
                          <option value="3">三栋</option>
                        </select>
                </div>
                <div class="form-group">
                  <label>请输入 单元房号/业主姓名/电话号码</label>
                  <input type="text" class="form-control" name="word" value="" placeholder="">
                  

                </div>
               
                <div class="form-group-btns">
                  <button type="submit" class="btn btn-sm btn-primary">查询</button>
                  <a href="#" class="btn btn-sm btn-default">重置</a>
                </div>
              </form>

            </div>

            <!--页面右侧-->
            <div class="main">

              <!--列表头部-->
              <div>
                <h5>
                  <!--列表的标题-->
                  应交的物业费明细
                  <!--迷你页码-->
                  
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
                              <td>一栋</td>
                            </tr>


                            <tr>
                              <td class="form-title">
                                <span class="text-danger">*</span>单元房号
                              </td>
                              <td>三单元401</td>
                            </tr>

                            <tr>
                              <td class="form-title">
                                户主姓名
                              </td>
                              <td>
                                张三
                              </td>
                            </tr>

                             <tr>
                                <td class="form-title">
                                  户型
                                </td>
                                <td>
                                  三房两厅（119平米）
                                </td>
                              </tr>
                            <tr>
                              <td class="form-title">
                               标准物业费
                              </td>
                              <td>
                                47.6元/年
                              </td>
                            </tr>
                             <tr>
                              <td class="form-title">
                               往年欠费
                              </td>
                              <td>
                                ￥0
                              </td>
                            </tr>
                             <tr>
                              <td class="form-title">
                               滞纳金
                              </td>
                              <td>
                               ￥0
                              </td>
                            </tr>
                            <tr>
                              <td class="form-title">
                                <span class="text-danger">*</span>缴费周期
                              </td>
                              <td>
                                <select class="form-control chosen" name="status">
                                  <option value="1">一年</option>
                                  <option value="2">两年</option>
                                  <option value="3">三年</option>
                                  <option value="4">四年</option>
                                  <option value="5">五年</option>
                                </select>
                              </td>
                            </tr>

                            <tr>
                              <td class="form-title">合计应交金额</td>
                              <td>
                                47.6元/年（[往年欠费]+[滞纳金]+[物业费标准]*「缴费周期」，系统会自动计算该楼层的物业费用）
                              </td>
                            </tr>

                            <tr>
                              <td class="form-title">
                                <span class="text-danger">*</span>缴纳方式
                              </td>
                              <td>
                                <select class="form-control chosen" name="status">
                                  <option value="1">现金</option>
                                  <option value="1">支付宝</option>
                                  <option value="2">微信</option>
                                  <option value="2">银行卡</option>
                                 
                                </select>
                              </td>
                            </tr>
                            <tr>
                                <td class="form-title">
                                  收款说明
                                </td>
                                <td>
                                  <textarea class="form-control" name="title"></textarea>
                                </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                       </form>
                  <table class="table form-table">
                          <tbody>
                            <tr>
                              
                              <td align="center">
                                 <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target=".bs-example-modal-sm">确认</button>
                                                      <div class="modal  bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                                                      <div class="modal-dialog modal-sm" role="document">
                                                            
                                                        <div class="modal-content">
                                                          <h3>缴费成功</h3>
                                                          <div class="fee">
                                                          <a target="_blank"  href='shouju.jsp'> <button type="submit" class="btn btn-primary btn-sm " >打印收据</button> </a>
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
     <!-- <script type="text/javascript">
         function ulrHtml(num){
                     var toUrl = "room-edit.html?"+num;   
             window.open(toUrl);         
        }
</script> -->
  </body>
</html>