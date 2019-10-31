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
                <a href="/cost/list">物业费账单</a>
            </li>
            <li>
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
<div class="list-container have-subhead ab">

    <!--页面左侧-->
    <div class="sidebar">
        <h1>按条件查询</h1>
        <!--查询表单-->
        <form method="get">
            <div class="form-group">
                <label>请选择楼栋</label>
                <select class="form-control chosen" id="build" name="status">

                </select>
            </div>
            <div class="form-group">
                <label>请输入 业主姓名</label>
                <input type="text" class="form-control username" name="word" value="" placeholder="">
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
                    <th>标准物业费</th>
                    <th>应付总计</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody class="mytable">

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
       <td>{{housename}}</td>
       <td>{{user.username}}</td>
       <td>{{begintime}}</td>
       <td>{{endtime}}</td>
       <td>￥{{user.owemoney}}</td>
       <td>55.6元/年</td>
       <td class="color">￥55.6(往年欠费+标准物业费)</td>
       <td><!-- 添加备注按钮 -->
           <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
                <span class="glyphicon glyphicon-yen"></span>
                物业费缴纳
           </button>
           <a href="/cost/feelist">
                <button type="button" class="btn red-bg btn-xs btnyear">
                    <span class="glyphicon glyphicon-list-alt"></span>
                    缴费记录
                </button>
           </a>
           <!-- 添加备注弹出框 -->
           <div style="z-index: 1049"  class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div  class="modal-dialog" role="document" >
                    <div  class="modal-content"  >
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <div>
                                 <h3 style="text-align:center">物业费账单</h3>
                            </div>
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
                                        <td>{{housename}}</td>
                                    </tr>
                                    <tr>
                                        <td class="form-title">户主姓名</td>
                                        <td>{{user.username}}</td>
                                    </tr>
                                    <tr>
                                         <td class="form-title">户型</td>
                                         <td>{{user.unitname}}</td>
                                    </tr>
                                    <tr>
                                         <td class="form-title"> 物业费标准</td>
                                         <td>55.6元/年</td>
                                    </tr>
                                    <tr>
                                         <td class="form-title">往年欠费</td>
                                         <td>￥{{user.owemoney}}</td>
                                    </tr>
                                    <tr>
                                         <td class="form-title">
                                              <span class="text-danger">*</span>缴费周期
                                         </td>
                                         <td>
                                              <select class="form-control chosen year" name="status">

                                              </select>
                                         </td>
                                    </tr>
                                    <tr>
                                         <td class="form-title">合计应交金额</td>
                                         <td>
                                               55.6元/年（[往年欠费]+[物业费标准]*「缴费周期」，系统会自动计算该楼层的物业费用）
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
                        <table class="table form-table">
                             <tbody>
                                        <tr>

                                            <td style="text-align:center;">
                                                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target=".bs-example-modal-sm">确认</button>
                                                <div class="modal  bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                                                    <div class="modal-dialog modal-sm" role="document">

                                                        <div class="modal-content">
                                                            <h3>缴费成功</h3>
                                                            <div class="fee">
                                                                <a href='/cost/shouju' target="_blank"> <button type="submit"  class="btn btn-primary btn-sm " >打印收据</button> </a>
                                                                <button type="button"  class="btn btn-primary btn-sm" data-dismiss="modal">返回账单</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- <a href='cost-fee-list.html'> <button type="submit"  class="btn btn-primary btn-lg " >确认</button> </a> -->
                                                <button type="button"  class="btn btn-primary btn-lg" data-dismiss="modal">取消</button>
                                                <div id="fade" ></div>
                                            </td>
                                        </tr>
                             </tbody>
                        </table>
                    </div>
                </div>
           </div>
           <!--弹框结束-->
       </td>
    </tr>

</script>


<script type="text/javascript">
    $(document).ready(function () {
        //日期选择
        yoozi.datapicker('.datepicker');
        //页面加载时自动生成楼栋
        $.get("/building/findAll",function (json) {
            $("#build").empty();
            $(json).each(function () {
                var opt = "<option value="+this.id+">" + this.name + "</option>";
                $("#build").append(opt);
            });
        });

        $(".btnyear").click(function () {
            $.get("/cost/findAllYear",function (json) {
                $(".year").empty();
                $(json).each(function () {
                    var opt = "<option value="+this.yearno+">" + this.year + "</option>";
                    $(".year").append(opt);
                });
            });
        });

        pageStart();//开始分页

        function pageStart() {//分页函数
            $.ajax({ //去后台查询第一页数据
                type: "get",
                url: "/cost/findByPage",
                dataType: "json",
                data: {
                    pageNum: '1',
                   /* buildingid:$("#build").val(),
                    username:$(".username").val(),*/
                }, //参数：当前页为1
                success: function (data) {
                    console.log(data);
                    var template = $('#template').html();
                    Mustache.parse(template);
                    $(".mytable").html("");
                    $(data.list).each(function () {
                        var rendered = Mustache.render(template, this);
                        $(".mytable").append(rendered);
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
                            $.ajax({//根据page去后台加载数据
                                url: "/cost/findByPage",
                                type: "get",
                                dataType: "json",
                                data: {
                                    pageNum: page,
                                    /*buildingid:$("#build").val(),
                                    username:$(".username").val(),*/
                                },
                                success: function (data) {
                                    var template = $('#template').html();
                                    Mustache.parse(template);
                                    $(".mytable").html("");
                                    $(data.list).each(function () {
                                        var rendered = Mustache.render(template, this);
                                        $(".mytable").append(rendered);
                                    });

                                }
                            });
                        }
                    };
                    $('#mypage').bootstrapPaginator(options);//设置分页
                }
            });
        }

    });
</script>
</body>
</html>