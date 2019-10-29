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

            <li class='active'>
                <a href="cost-list.jsp">物业费账单</a>
            </li>
            <li>
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
<div class="list-container have-subhead ab">

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
            <div class="form-group">
                <label>费用起期</label>
                <div class="input-group">
                    <input type="text" class="form-control datepicker" name="date[from]" value=""
                           placeholder="0000-00-00">
                    <span class="input-group-addon">至</span>
                    <input type="text" class="form-control datepicker" name="date[to]" value=""
                           placeholder="0000-00-00">
                </div>
            </div>
            <div class="form-group-btns">
                <button type="submit" class="btn btn-sm btn-primary">筛选</button>
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
                物业费账单列表
                <!--迷你页码-->
                <span class="pagination-total pull-right">
                    查询结果: 660 条记录，当前 1/66 页
                    <!--上一页-->
                    <a href="#" class="btn btn-xs btn-default">
                      <span class="glyphicon glyphicon glyphicon-menu-left"></span>
                    </a>
                    <!--下一页-->
                    <a href="#/backend/admin/user?page=2" class="btn btn-xs btn-default">
                      <span class="glyphicon glyphicon glyphicon-menu-right"></span>
                    </a>
                  </span>
            </h5>
        </div>
        <!-- #列表头部-->

        <!--列表-->
        <div>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>楼栋号</th>
                    <th>单元房号</th>
                    <th>业主姓名</th>
                    <th>物业费缴纳时间</th>
                    <th>物业费到期时间</th>
                    <th>往年欠费</th>
                    <th>滞纳金</th>
                    <th>标准物业费</th>
                    <th>应付总计</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>一栋</td>
                    <td>三单元401</td>
                    <td>张三</td>
                    <td>2016/01/01</td>
                    <td>2017/12/31</td>
                    <td>￥0</td>
                    <td>￥0</td>
                    <td>47.6元/年</td>
                    <td class="color">￥47.6(往年欠费+滞纳金+标准物业费)</td>

                    <td><!-- 添加备注按钮 -->

                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
                            <span class="glyphicon glyphicon-yen"></span>
                            物业费缴纳
                        </button>
                        <a href="">
                            <button type="button" class="btn red-bg btn-xs">
                                <span class="glyphicon glyphicon-list-alt"></span>
                                缴费记录
                            </button>
                        </a>


                    </td>

                </tr>

                <tr>
                    <td>一栋</td>
                    <td>三单元401</td>
                    <td>张三</td>
                    <td>2016/01/01</td>
                    <td>2017/12/31</td>
                    <td>￥0</td>
                    <td>￥0</td>
                    <td>35.6元/年</td>
                    <td class="color">￥35.6(往年欠费+滞纳金+标准物业费)</td>
                    <td><!-- 添加备注按钮 -->

                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
                            <span class="glyphicon glyphicon-yen"></span>
                            物业费缴纳
                        </button>
                        <a href="">
                            <button type="button" class="btn red-bg btn-xs"><span
                                    class="glyphicon glyphicon-list-alt"></span>
                                缴费记录
                            </button>
                        </a>


                    </td>

                </tr>

                <tr>
                    <td>一栋</td>
                    <td>三单元401</td>
                    <td>张三</td>
                    <td>2016/01/01</td>
                    <td>2017/12/31</td>
                    <td>￥0</td>
                    <td>￥0</td>
                    <td>55.6元/年</td>
                    <td class="color">￥55.6(往年欠费+滞纳金+标准物业费)</td>
                    <td><!-- 添加备注按钮 -->

                        <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
                            <span class="glyphicon glyphicon-yen"></span>
                            物业费缴纳
                        </button>
                        <a href="">
                            <button type="button" class="btn red-bg btn-xs"><span
                                    class="glyphicon glyphicon-list-alt"></span>
                                缴费记录
                            </button>
                        </a>

                        <!-- 添加备注弹出框 -->
                        <div style="z-index: 1049" class="modal fade" id="myModal" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <!-- <h4 class="modal-title" id="myModalLabel">修改记录列表</h4> -->
                                        <div>
                                            <h3 style="text-align:center">
                                                物业费账单

                                            </h3>
                                        </div>
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
                                                <td>三单元403</td>
                                            </tr>

                                            <tr>
                                                <td class="form-title">户主姓名</td>
                                                <td>李玉</td>
                                            </tr>

                                            <tr>
                                                <td class="form-title">户型</td>
                                                <td> 三房两厅（119平米）</td>
                                            </tr>
                                            <tr>
                                                <td class="form-title"> 物业费标准</td>
                                                <td>55.6元/年</td>
                                            </tr>
                                            <tr>
                                                <td class="form-title">往年欠费</td>
                                                <td>￥0</td>
                                            </tr>
                                            <tr>
                                                <td class="form-title">滞纳金</td>
                                                <td>￥0</td>
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
                                                    55.6元/年（[往年欠费]+[滞纳金]+[物业费标准]*「缴费周期」，系统会自动计算该楼层的物业费用）
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

                                            <td style="text-align:center;">
                                                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
                                                        data-target=".bs-example-modal-sm">确认
                                                </button>
                                                <div class="modal  bs-example-modal-sm" tabindex="-1" role="dialog"
                                                     aria-labelledby="mySmallModalLabel">
                                                    <div class="modal-dialog modal-sm" role="document">

                                                        <div class="modal-content">
                                                            <h3>缴费成功</h3>
                                                            <div class="fee">
                                                                <a href='shouju.jsp' target="_blank">
                                                                    <button type="submit"
                                                                            class="btn btn-primary btn-sm ">打印收据
                                                                    </button>
                                                                </a>
                                                                <button type="button" class="btn btn-primary btn-sm"
                                                                        data-dismiss="modal">返回账单
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="button" class="btn btn-primary btn-lg"
                                                        data-dismiss="modal">取消
                                                </button>
                                                <div id="fade"></div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <!--弹框结束-->
        </td>

        </tr>


        </tbody>
        </table>
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
    $(document).ready(function () {

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