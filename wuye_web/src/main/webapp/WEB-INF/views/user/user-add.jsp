<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../basepath/basepath.jsp" %>
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

    <title>添加业主 </title>

    <!-- Bootstrap core CSS -->
    <link href="${basePath}assets/vendors/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="${basePath}assets/vendors/distpicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet">
    <link href="${basePath}assets/vendors/chosen/chosen.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${basePath}assets/vendors/webuploader/webuploader.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}assets/page.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}assets/vendors/star/star-rating.css">


    <!-- Custom styles for this template -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="">
<jsp:include page="../head.jsp">
    <jsp:param name="menu" value="user"/>
</jsp:include>

<!-- #头部主标题导航-->
<div class="list-container have-subhead">

    <!--头部副标题导航-->
    <nav class="navbar navbar-fixed-top subhead">
        <div class="navbar-collapse collapse">
            <ul class="sub-list">
                <li class='bread'>
                    业主管理:
                </li>
                <li>
                    <a href="/user/list">业主列表</a>
                </li>
                <li class='active'>
                    <a href="/user/add">业主入住</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- #头部副标题导航-->

    <!--页面主体-->
    <div class="list-container have-subhead">

        <!--页面左侧-->
        <div class="sidebar">
            <h1>返回</h1>
            <!--查询表单-->
            <p><a href="/user/list">&lt; 查看业主列表</a></p>

        </div>

        <!--页面右侧-->
        <div class="main">

            <form class="form-horizontal" method="post" action="/user/save">
                <input type="hidden" name="_token" value="17nb09nROctqttKz9hcPg4gxNB0wCU8B21t744md">
                <input type="hidden" name="id" value="0"/>

                <div>
                    <h5>
                        业主信息
                        <span class="pagination-total pull-right">
                    带 <span class="text-danger">*</span> 为必填项
                  </span>
                    </h5>
                </div>


                <div>
                    <table class="form-table">
                        <tbody>
                        <tr>
                            <td class="form-title">
                                <span class="text-danger">*</span>楼栋号
                            </td>
                            <td>
                                <select class="form-control buildingselect" name="buildingname">
                                    <%--楼栋list--%>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td class="form-title">
                                <span class="text-danger">*</span>单元房号
                            </td>
                            <td>
                                <input type="text" class="form-control unithousenum" name="unithouse" value=""
                                       placeholder="">
                                <span id="error" style="color: red"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-title">
                                <span class="text-danger">*</span>户型
                            </td>
                            <td>
                                <select class="form-control  modelselect" name="modelid">
                                    <%--房型、面积--%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-title">物业费用</td>
                            <td>
                                <span id="money"></span>元/年（选择了「户型」，系统会自动计算该楼层的物业费用）
                            </td>
                        </tr>
                        <tr>
                            <td class="form-title roleUserName"><span class="text-danger">*</span>
                                户主姓名
                            </td>
                            <td>
                                <input type="text" class="form-control" name="username" value="" placeholder="">
                            </td>
                        </tr>
                        <tr>
                            <td class="form-title"><span class="text-danger">*</span>
                                登陆名
                            </td>
                            <td>
                                <input type="text" class="form-control userloginname" name="loginname" value="" placeholder="">
                                <span id="loginerror" style="color: red"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-title"><span class="text-danger">*</span>
                                户主性别
                            </td>
                            <td>
                                <input type="text" class="form-control" name="sex" value="" placeholder="">
                            </td>
                        </tr>
                        <tr>
                            <td class="form-title"><span class="text-danger">*</span>
                                户主证件号
                            </td>
                            <td>
                                <input type="text" class="form-control" name="card" value="" placeholder="">
                            </td>
                        </tr>
                        <tr>
                            <td class="form-title"><span class="text-danger">*</span>
                                联系方式
                            </td>
                            <td>
                                <input type="text" class="form-control" name="tel" value="" placeholder="">
                            </td>
                        </tr>
                        <%--<tr style="height: 100px;">
                            <td class="form-title">
                                上传文件
                            </td>
                            <td>
                                <div id="wrapper">
                                    <div id="container">
                                        <!--头部，相册选择和格式选择-->
                                        <div id="uploader">
                                            <div class="queueList">
                                                <div id="dndArea" class="placeholder">
                                                    <div id="filePicker"></div>
                                                </div>
                                            </div>
                                            <div class="statusBar" style="display:none;">
                                                <div class="progress">
                                                    <span class="text">0%</span>
                                                    <span class="percentage"></span>
                                                </div>
                                                <div class="info"></div>
                                                <div class="btns">
                                                    <div id="filePicker2"></div>
                                                    <div class="uploadBtn">开始上传</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--  <input type="file" id="exampleInputFile"> -->
                            </td>
                        </tr>--%>
                        </tbody>
                    </table>
                </div>

                <table class="table form-table">
                    <tbody>
                    <tr>
                        <td class="form-title"></td>
                        <td>
                            <button type="submit" class="btn btn-primary btn-lg btn-block savebtn">保存</button>
                        </td>
                    </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </div>
</div>
<!-- /container -->
<!-- <script src="./assets/vendors/jquery-1.10.2.min.js"></script> -->
<script src="${basePath}assets/vendors/webuploader/jquery.js"></script>
<%--<script src="${basePath}assets/vendors/webuploader/webuploader.js"></script>
<script src="${basePath}assets/vendors/webuploader/upload.js"></script>--%>
<script type="text/javascript">

</script>


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
        //下拉列表添加 chosen
        yoozi.chosen('.chosen');

    });
</script>

<script src="${basePath}assets/vendors/star/star-rating.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#comment").rating();
        //楼栋
        $.ajax({
            type: "GET",
            url: "/building/findAll",
            success: function (json) {
                console.log(json);
                $(json).each(function () {
                    $(".buildingselect").append("<option value=" + this.name + ">" + this.name + "</option>");
                });
            },
        });
        //房型
        $.ajax({
            type: "GET",
            url: "/model/findAll",
            success: function (json) {
                console.log(json);
                $(json).each(function (index) {
                    $(".modelselect").append("<option value=" + this.id + ">" + this.modelname + "(" + this.area + ")" + "</option>");
                    if (index == 0) {
                        $("#money").html(this.propertmoney);
                    }
                });
            },
        });
        //改变房型、物业费自动更改
        $(".modelselect").change(function () {
            $.ajax({
                type: "GET",
                url: "/model/findModelById",
                data: {
                    modelid: $(".modelselect").val(),
                },
                success: function (json) {
                    $("#money").html("");
                    $("#money").html(json.propertmoney);
                }
            });
        });
        //单元房号离开焦点、查找有没有user住
        $(".unithousenum").blur(function () {
            $.ajax({
                type: "GET",
                url: "/user/findByBuildAndUnitHouse",
                data: {
                    buildingname: $(".buildingselect").val(),
                    unitname: $(".unithousenum").val().substring(0, 3),
                    housenum: $(".unithousenum").val().substring(3),
                },
                success: function (json) {
                    if (json != null && json != "" && json != "null") {
                        $("#error").html("该房间已有住户");
                        $(".savebtn").attr("disabled", true);
                    }
                }
            });
        });
        $(".unithousenum").focus(function () {
            $("#error").html("");
            $(".savebtn").attr("disabled", false);
        });
        //判断loginname不能重复
        $(".userloginname").blur(function () {
            $.ajax({
                type:"GET",
                url:"/admin/findByName",
                data:{
                    name:$(".userloginname").val(),
                },
                success:function (json) {
                    console.log(json);
                    if(json != null && json != "" && json != "null"){
                        $("#loginerror").html("登录名已存在、请重新输入");
                        $(".savebtn").attr("disabled", true);
                    }
                },
            });
        });
        $(".userloginname").focus(function () {
            $("#loginerror").html("");
            $(".savebtn").attr("disabled", false);
        });
    });
</script>


</body>
</html>