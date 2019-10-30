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

    <title>欠费统计</title>

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
        
    <!-- <div class="list-container have-subhead"> -->
      
        <!--头部副标题导航-->
        <nav class="navbar navbar-fixed-top subhead">
          <div class="navbar-collapse collapse">
            <ul class="sub-list">
              <li class='bread'>
                物业费逾期管理:
              </li>
              <li class='active'>
                <a href="owe-data.jsp">欠费概况</a>
              </li>
               <li >
                <a href="owe-yuqi.jsp">已逾期用户列表</a>
                
              </li>
               <li >
                <a href="owe-qitian.jsp">七天内到期的用户列表</a>
              </li>
            </ul>
            
          </div>
        </nav>
        <!-- #头部副标题导航-->  
        <!--页面主体-->
          <div  class="list-container have-subhead">

            <!--页面左侧-->
            <div class="sidebar">
            <h1>查看</h1>
            <!--查询表单-->
            <p><a href="owe-yuqi.jsp
              ">&lt; 查看已逾期用户</a></p>

          </div>


            <!--页面右侧-->
            <div  class="main">

              <!--列表头部-->
              <div class="row">
              <div class="panel-heading panel">
              <div class=" panel-default" >
                <h4>
                  <!--列表的标题-->
                  欠费概况
                 
                 
                </h4>
              </div>
              </div>
            </div>
              <!-- #列表头部-->

              <!--列表-->
              <div>
                       
            <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
          <div class="info-box blue-bg">
                        <h4>已逾期用户数</h4>
            <div class="count">6</div>          
          </div><!--/.info-box-->     
        </div><!--/.col-->
        
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
          <div class="info-box blue-bg">
            <h4>七天内物业费到期用户数</h4>
            <div class="count">7</div>
                      
          </div><!--/.info-box-->     
        </div><!--/.col-->  
        
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
          <div class="info-box blue-bg">
            <h4>所欠的物业费总金额</h4>
            <div class="count">￥2000（已逾期用户所欠物业费总和）</div>        
          </div><!--/.info-box-->     
        </div><!--/.col-->
        
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
          <div class="info-box blue-bg">
            <h4>总计</h4>
            <div class="count">￥2000（所欠物业费总金额+滞纳金总和）</div>
                      
          </div><!--/.info-box-->     
        </div><!--/.col-->
        
                
      </div><!--/.row-->




      <div class="row">
                
       
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4>物业费欠费详情列表</h4>
              
            </div>
            <div class="panel-body">
              <table class="table bootstrap-datatable countries">
                <thead>
                  <tr>
                    
                    <th>楼栋号</th>
                                        <th>入住总户数</th>
                    <th>已交费用户数</th>
                    <th>逾期用户数</th>
                    <th>缴费百分比</th>
                  </tr>
                </thead>   
                <tbody>
                  <tr>
                    
                    <td>一栋</td>
                                        <td>300</td>
                    <td>290</td>
                    <td>10</td>
                    <td>
                      <div class="progress px">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 97%;">
                          97%
                        </div>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    
                    <td>二栋</td>
                                        <td>365</td>
                    <td>365</td>
                    <td>0</td>
                    <td>
                     <div class="progress px">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                          100%
                        </div>
                      </div> 
                    </td>
                  </tr>
                  <tr>
                    
                    <td>三栋</td>
                                        <td>210</td>
                    <td>200</td>
                    <td>10</td>
                    <td>
                      <div class="progress px">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
                          90%
                        </div>
                      </div>  
                    </td>
                  </tr>
                  
                   <tr>
                    
                    <td>四栋</td>
                                        <td>210</td>
                    <td>200</td>
                    <td>10</td>
                    <td>
                      <div class="progress px">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
                          90%
                        </div>
                      </div>  
                    </td>
                  </tr>
                   <tr>
                    
                    <td>五栋</td>
                                        <td>210</td>
                    <td>200</td>
                    <td>10</td>
                    <td>
                      <div class="progress px">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
                          90%
                        </div>
                      </div>  
                    </td>
                  </tr>

                </tbody>
              </table>
            </div>
  
         

        </div><!--/col-->


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
                    <li><a href="#">5</a></li>
                    <li><a href="#">6</a></li>
                    <li><a href="#">7</a></li>
                    <li><a href="#">8</a></li>
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