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

    <title>业主列表 </title>

    <!-- Bootstrap core CSS -->
    <link href="${basePath}assets/vendors/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="${basePath}assets/vendors/distpicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet">
    <link href="${basePath}assets/vendors/chosen/chosen.min.css" rel="stylesheet">
    <link href="${basePath}assets/page.css" rel="stylesheet">
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
<!-- <div class="list-container have-subhead ab"> -->
<!--头部副标题导航-->
<nav class="navbar navbar-fixed-top subhead ab">
    <div class="navbar-collapse collapse">
        <ul class="sub-list">
            <li class='bread'>
                业主管理:
            </li>
            <li class='active'>
                <a href="/user/list">业主列表</a>
            </li>
            <li>
                <a href="/user/add">业主入住</a>
            </li>
        </ul>
        <ul class="sub-btns">
            <li>
                <a href="/user/export" class="btn btn-sm btn-default">
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
            <select class="form-control chosen buildingselect" name="status">
                <option value="">--请选择楼栋--</option>

                <%--楼栋、ajax--%>
            </select>
        </div>
        <div class="form-group">

            <label>请输入 业主姓名</label>
            <input type="text" class="form-control username" value="" name="username" value="" placeholder="">
        </div>

        <div class="form-group-btns">
            <button type="button" class="btn btn-sm btn-primary selectInfo">筛选</button>
            <a href="javascript:;" class="btn btn-sm btn-default cleanbtn">重置</a>
        </div>
    </div>
    <!--页面右侧-->
    <div class="main">
        <!--列表头部-->
        <div>
            <h5>
                <!--列表的标题-->
                业主列表
            </h5>
        </div>
        <!-- #列表头部-->
        <!--列表-->
        <div>
            <table class="table table-striped usertable">
                <thead>
                <tr>
                    <th>楼栋号</th>
                    <th>单元房号</th>
                    <th>业主姓名</th>
                    <th>性别</th>
                    <th>证件号码</th>
                    <th>联系电话</th>
                    <th width="150">操作</th>
                </tr>
                </thead>
                <tbody class="userinfo">

                </tbody>
            </table>

        </div>
        <!-- #列表-->

        <!--页码-->
        <nav aria-label="Page navigation">
            <ul id="mypage"></ul>
        </nav>
        <!-- #页码-->
    </div>
</div>
</div>
<!-- /container -->
<!-- 添加备注弹出框 -->
<div style="z-index: 9999" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width: 800px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <!-- <h4 class="modal-title" id="myModalLabel">修改记录列表</h4> -->
                <div>
                    <ul class="nav nav-tabs" role="tablist" id="ulbody">
                        <li role="presentation" class="active">
                            <a href="#base" aria-controls="base" role="tab" data-toggle="tab">套房信息更改</a>
                        </li>
                        <li role="presentation">
                            <a href="#person" id="changeuserinfo" aria-controls="person" role="tab" data-toggle="tab">业主信息更改</a>
                        </li>
                        <li role="presentation">
                            <a href="#file" aria-controls="file" role="tab" data-toggle="tab">相关文件更改</a>
                        </li>
                        <li role="presentation">
                            <a href="#timeline" aria-controls="timeline" role="tab" data-toggle="tab">业主信息修改记录</a>
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <!--套房信息-->
                        <div role="tabpanel" class="tab-pane active " id="base">
                            <br/>
                            <div>
                                <input type="hidden" name="_token" value="17nb09nROctqttKz9hcPg4gxNB0wCU8B21t744md">
                                <input type="hidden" name="id" value="0"/>
                                <div>
                                    <table class="form-table ">
                                        <tbody>
                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>楼栋号
                                            </td>
                                            <td>
                                                <select class="form-control chosen buildingselect2" id="buildingname" name="buildingname">
                                                    <%--楼栋building--%>

                                                </select>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>单元号
                                            </td>
                                            <td>
                                                <select class="form-control chosen unitselect" name="unitname">
                                                    <%--单元unit--%>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span> 房号
                                            </td>
                                            <td>
                                                <input type="text" class="form-control housenuminput" name="housenum"
                                                       value=""
                                                       placeholder="">
                                                <span id="error" style="color: red"></span>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>户型
                                            </td>
                                            <td>
                                                <select class="form-control chosen modelselect" name="modelid">
                                                    <%--房型--%>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>物业费标准
                                            </td>
                                            <td>
                                                <span id="money"></span>元/年（选择了「户型」，系统会自动计算该楼层的物业费用）
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div>
                                    <table class="table form-table">
                                        <tbody>
                                        <tr>
                                            <td class="form-title"></td>
                                            <button type="button" class="btn btn-primary btn-lg btn-block updateuser">
                                                保存
                                            </button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--业主信息-->
                        <div role="tabpanel" class="tab-pane " id="person">
                            <br/>
                            <div>
                                <div>
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>业主姓名</th>
                                            <th>联系电话</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody id="userinfo">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h5>添加业主</h5>
                            <div class="row">
                                <div>
                                    <form>
                                        <table class="form-table">
                                            <tbody>
                                            <tr>
                                                <td class="form-title">
                                                    <span class="text-danger">*</span>业主姓名
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="title" value=""
                                                           placeholder="">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="form-title">
                                                    <span class="text-danger">*</span>联系电话
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="title" value=""
                                                           placeholder="">
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
                        <!--相关文件-->
                        <div role="tabpanel" class="tab-pane" id="file">
                            <br/>
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>文件</th>
                                    <th>备注</th>
                                    <th>上传时间</th>
                                    <th width="100">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><a href="#">房产证.jpg</a></td>
                                    <td>已经办理房产证</td>
                                    <td>2016-07-09 12:34:27</td>
                                    <td>
                                        <a href="#" class="btn btn-xs btn-danger"><span
                                                class="glyphicon glyphicon-remove"></span>删除</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href="#">不动产证.jpg</a></td>
                                    <td>已经办理不动产证</td>
                                    <td>2016-09-09 09:08:07</td>
                                    <td>
                                        <a href="#" class="btn btn-xs btn-danger"><span
                                                class="glyphicon glyphicon-remove"></span>删除</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td><a href="#">收据.jpg</a></td>
                                    <td>2017-12-10 至 2018-12-10 的物业管理费收据</td>
                                    <td>2017-12-10 10:10:10</td>
                                    <td>
                                        <a href="#" class="btn btn-xs btn-danger"><span
                                                class="glyphicon glyphicon-remove"></span>删除</a>
                                    </td>
                                </tr>


                                </tbody>
                            </table>
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

                            <h5 style="margin-top: 120px">添加文件</h5>
                            <div>

                                <form>
                                    <table class="form-table">
                                        <tbody>
                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>上传文件
                                            </td>
                                            <td>
                                                <input type="file" id="exampleInputFile">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-title">
                                                备注
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" name="title" value=""
                                                       placeholder="">
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
                        <!--修改记录-->
                        <div role="tabpanel" class="tab-pane " id="timeline">
                            <br/>
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>管理员</th>
                                    <th>备注</th>
                                    <th>发布时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>管理员A</td>
                                    <td>上传了文件《2017-12-10 至 2018-12-10 的物业管理费收据》</td>
                                    <td>2016-07-09 12:34:27</td>
                                </tr>
                                <tr>
                                    <td>管理员B</td>
                                    <td>添加备注：该房子正在进行二手交易</td>
                                    <td>2016-09-09 09:08:07</td>
                                </tr>
                                <tr>
                                    <td>管理员C</td>
                                    <td>删除了业主 王五</td>
                                    <td>2016-09-09 09:08:07</td>
                                </tr>
                                <tr>
                                    <td>管理员C</td>
                                    <td>添加了业主 陆六</td>
                                    <td>2016-09-09 09:08:07</td>
                                </tr>
                                </tbody>
                            </table>

                            <!--页码-->
                            <div class="yema">
                                <nav class="pull-right ">
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
                            </div>
                            <!-- #页码-->

                            <br/> <br/>
                            <h5>添加备注</h5>
                            <div>
                                <form>
                                    <table class="form-table">
                                        <tbody>
                                        <tr>
                                            <td class="form-title">
                                                备注
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" name="title" value=""
                                                       placeholder="">
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

                </div>
            </div>
        </div>
        <!--弹框结束-->
    </div>
</div>

<script src="${basePath}assets/vendors/jquery-1.11.1.min.js"></script>
<script src="${basePath}assets/vendors/bootstrap/bootstrap.min.js"></script>
<script src="${basePath}assets/vendors/chosen/chosen.jquery.min.js"></script>
<script src="${basePath}assets/vendors/star/star-rating.js"></script>
<%--分页--%>
<script src="${basePath}assets/bootstrap-paginator.min.js"></script>
<script src="${basePath}assets/mustache.js"></script>
<%--user信息表格模板--%>
<script id="template" type="x-tmpl-mustache">
 <tr class = "usertr">
                    <td>{{buildingname}}</td>
                    <td>{{unitname}}{{housenum}}</td>
                    <td>{{username}}</td>
                    <td>{{sex}}</td>
                    <td>{{card}}</td>
                    <td>{{tel}}</td>
                    <td>
                        <input type="hidden" class="deluserid" value = "{{id}}">
                        <input type="hidden" class="buildinghidden" value = "{{buildingname}}">
                        <input type="hidden" class="unithidden" value = "{{unitname}}">
                        <input type="hidden" class="modelhidden" value = "{{model.modelname}}">
                        <input type="hidden" class="delhousenum" value = "{{housenum}}">
                        <button type="button" class="btn btn-primary btn-xs changebtn" data-toggle="modal" data-target="#myModal" >
                            <span class="glyphicon glyphicon-pencil"></span>
                            更改
                        </button>
                        <a class="btn btn-danger btn-xs deluser" href="javascript:;" ref = "{{housenum}}">
                        <span class="glyphicon glyphicon-remove"></span>删除</a>
                    </td>
                </tr>




</script>
<script type="text/javascript">
    $(document).ready(function () {
        //$("#comment").rating();
        $(".selectInfo").click(function () {
            pageStart();
        });
    });
    //左侧单选下拉框楼栋
    $.ajax({
        type: "GET",
        url: "/building/findAll",
        success: function (json) {
            //$(".buildingselect").empty();
            $(json).each(function () {
                $(".buildingselect").append("<option value=" + this.name + ">" + this.name + "</option>");
            });
        },
    });
    //删除
    $(".userinfo").on("click", ".deluser", function () {
        if (confirm("确定删除么？")) {
            var housenum = $(this).attr("ref");
            window.location.href = "/user/delByhouseNum?housenum=" + housenum;
        }
    });
    //重置、清空左侧内容
    $(".cleanbtn").click(function () {
        $(".username").val("");
        $(".buildingselect").val("");
        pageStart();
    });
    //分页
    pageStart();//开始分页
    function pageStart() {//分页函数
        $.ajax({ //去后台查询第一页数据
            type: "get",
            url: "/user/findByPage",
            dataType: "json",
            data: {
                pageNum: '1',
                username: $(".username").val(),
                status: $(".buildingselect").val(),
            }, //参数：当前页为1
            success: function (data) {
                console.log(data);
                var template = $('#template').html();
                Mustache.parse(template);
                $(".userinfo").html("");
                $(data.list).each(function () {
                    var rendered = Mustache.render(template, this);
                    $(".userinfo").append(rendered);
                });

                var options = {//根据后台返回的分页相关信息，设置插件参数
                    bootstrapMajorVersion: 3, //如果是bootstrap3版本需要加此标识，并且设置包含分页内容的DOM元素为UL,如果是bootstrap2版本，则DOM包含元素是DIV
                    currentPage: data.pageNum, //当前页数
                    totalPages: data.pages == 0 ? "" : data.pages,
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
                            url: "/user/findByPage",
                            type: "get",
                            dataType: "json",
                            data: {
                                pageNum: page,
                                username: $(".username").val(),
                                status: $(".buildingselect").val(),
                            },
                            success: function (data) {
                                var template = $('#template').html();
                                Mustache.parse(template);
                                $(".userinfo").html("");
                                //$(".mytable tr").not(':eq(0)').empty()
                                $(data.list).each(function () {
                                    var rendered = Mustache.render(template, this);
                                    $(".userinfo").append(rendered);
                                });

                            }
                        });
                    }
                };
                $('#mypage').bootstrapPaginator(options);//设置分页
            }
        });
    }

    //点击更改时
    $(".usertable").on("click", ".changebtn", function () {
        var id = $(this).siblings(".deluserid").val();
        var buildingname = $(this).siblings(".buildinghidden").val();
        var unitname = $(this).siblings(".unithidden").val();
        var modelname = $(this).siblings(".modelhidden").val();
        var housenum = $(this).siblings(".delhousenum").val();
        $(".buildingselect2").empty();
        $(".unitselect").empty();
        $(".modelselect").empty();
        //楼栋
        $.ajax({
            type: "GET",
            url: "/building/findAll",
            success: function (json) {
                $(json).each(function () {
                    $(".buildingselect2").val("");
                    if(buildingname == this.name){
                        $(".buildingselect2").append("<option selected=\"selected\" value=" + this.name + ">" + this.name + "</option>");
                    } else {
                        $(".buildingselect2").append("<option value=" + this.name + ">" + this.name + "</option>");
                    }
                });
            },
        });
        //单元
        $.ajax({
            type: "GET",
            url: "/unit/findAll",
            success: function (json) {
                $(json).each(function () {
                    $(".unitselect").val("");
                    if (unitname == this.name) {
                        console.log(unitname);
                        console.log(this.name);
                        $(".unitselect").append("<option selected value=" + this.name + ">" + this.name + "</option>");
                    } else {
                        $(".unitselect").append("<option value=" + this.name + ">" + this.name + "</option>");
                    }
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
                    $(".modelselect").val("");
                    if (modelname == this.name) {
                        $(".modelselect").append("<option selected value=" + this.id + ">" + this.modelname + "(" + this.area + ")" + "</option>");
                    } else {
                        $(".modelselect").append("<option value=" + this.id + ">" + this.modelname + "(" + this.area + ")" + "</option>");
                    }
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
        $(".housenuminput").blur(function () {
            $.ajax({
                type: "GET",
                url: "/user/findByBuildAndUnitHouse",
                data: {
                    buildingname: $("#buildingname").val(),
                    unitname: $(".unitselect").val(),
                    housenum: $(".housenuminput").val(),
                },
                success: function (json) {
                    $("#error").html("");
                    if (json != null && json != "" && json != "null") {
                        if (this.housenum != $(".delhousenum").val()) {
                            $("#error").html("与原房间号相同，无需更改！");
                        } else {
                            $("#error").html("该房间已有住户");
                        }
                        $(".updateuser").attr("disabled", true);
                    }
                }
            });
            $(".housenuminput").focus(function () {
                $("#error").html("");
                $(".updateuser").attr("disabled", false);
            });
        });
        //业主信息更改
        $.ajax({
            type: "GET",
            url: "/user/findById",
            data: {
                id: id,
            },
            success: function (json) {
                $("#userinfo").html("");
                $("#userinfo").append("<tr>" +
                    "<td> " + json.username + " </td>" +
                    "<td> " + json.tel + " </td>" +
                    "<td><a href=\"#\" class=\"btn btn-xs btn-danger\">" +
                    "<span class=\"glyphicon glyphicon-remove\"></span>删除</a>" +
                    "</td>" +
                    "</tr>");
            },
        });
    });
    //点击保存
    $(".updateuser").click(function () {
        $.ajax({
            type: "GET",
            url: "/user/update",
            data: {
                id: $(".deluserid").val(),
                buildingname: $("#buildingname").val(),
                unitname: $(".unitselect").val(),
                housenum: $(".housenuminput").val(),
                modelid: $(".modelselect").val(),
            },
            success: function (json) {
                if (json == 0) {
                    console.log("保存成功！");
                }
            },
            complete: function () {
                $('.modal').modal('hide');
                $(".housenuminput").val("");
                pageStart();
            }
        });
    });

</script>
</body>
</html>