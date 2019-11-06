<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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

                                <div>
                                    <table class="form-table ">
                                        <tbody>
                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>楼栋号
                                            </td>
                                            <td>
                                                <select class="form-control chosen buildingselect2" id="buildingname"
                                                        name="buildingname">
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
                                            <button type="text" class="btn btn-primary btn-lg btn-block updateuser">
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
                            <h5>业主修改</h5>
                            <div class="row">
                                <div>
                                    <table class="form-table">
                                        <tbody>
                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>业主姓名
                                            </td>
                                            <td>
                                                <input type="text" class="form-control ownername" name="username"
                                                       value=""
                                                       placeholder="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>联系电话
                                            </td>
                                            <td>
                                                <input type="text" class="form-control ownertel" name="tel" value=""
                                                       placeholder="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-title"></td>
                                            <td>
                                                <button type="button" class="btn btn-primary ownerupdate">更改</button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
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
                                <tbody class="fileinfo">

                                <%--文件列表--%>
                                </tbody>
                            </table>
                            <!--页码-->
                            <nav aria-label="Page navigation">
                                <ul id="mypagefile"></ul>
                            </nav>


                            <!-- #页码-->

                            <h5 style="margin-top: 120px">添加文件</h5>
                            <div>

                                <form action="/user/fileUpload" method="post" enctype="multipart/form-data">
                                    <table class="form-table">
                                        <tbody>
                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>文件名称
                                            </td>
                                            <td>
                                                <input type="text" class="form-control filename" name="filename">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>上传文件
                                            </td>
                                            <td>
                                                <input type="file" name="file" id="exampleInputFile">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-title">
                                                备注
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" name="note" value=""
                                                       placeholder="">
                                                <input type="hidden" name="userid" class="fileuserid" value="">
                                                <input type="hidden" name="adminname" class="adminname"
                                                       value="<shiro:principal/>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-title"></td>
                                            <td>
                                                <button type="submit" class="btn btn-primary">上传</button>
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
                                <tbody class="noticeinfo">
                                <%--信息修改记录、备注--%>
                                </tbody>
                            </table>

                            <!--页码-->
                            <nav aria-label="Page navigation">
                                <ul id="mypagenotice"></ul>
                            </nav>
                            <!-- #页码-->

                            <br/> <br/>
                            <h5>添加备注</h5>
                            <div>
                                <table class="form-table">
                                    <tbody>
                                    <tr>
                                        <td class="form-title">
                                            备注
                                        </td>
                                        <td>
                                            <input type="text" class="form-control noticecontent" name="content"
                                                   value=""
                                                   placeholder="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-title"></td>
                                        <td>
                                            <button type="button" class="btn btn-primary savenotice">保存</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
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
                        <input type="hidden" class="delusername" value = "{{username}}">
                        <input type="hidden" class="buildinghidden" value = "{{buildingname}}">
                        <input type="hidden" class="unithidden" value = "{{unitname}}">
                        <input type="hidden" class="modelhidden" value = "{{model.modelname}}">
                        <input type="hidden" class="delhousenum" value = "{{housenum}}">
                        <button type="button" class="btn btn-primary btn-xs changebtn" data-toggle="modal" data-target="#myModal" >
                            <span class="glyphicon glyphicon-pencil"></span>
                            更改
                        </button>
                        <a class="btn btn-danger btn-xs deluser" href="javascript:;" ref = "{{id}}">
                        <span class="glyphicon glyphicon-remove"></span>删除</a>
                    </td>
                </tr>




</script>
<%--相关文件模板--%>
<script id="template2" type="x-tmpl-mustache">
 <tr>
        <td><a href="#">{{filename}}</a></td>
        <td>{{note}}</td>
        <td>{{createtime}}</td>
        <td>
            <a href="javascript:;" ref = "{{id}}" class="btn btn-xs btn-danger deletefile">
                <span class="glyphicon glyphicon-remove"></span>删除
            </a>
        </td>
    </tr>



</script>
<%--业主信息修改记录模板--%>
<script id="template3" type="x-tmpl-mustache">
    <tr>
        <td>{{adminname}}</td>
        <td>{{title}}{{content}}</td>
        <td>{{createtime}}</td>
    </tr>



</script>
<script type="text/javascript">
    $(document).ready(function () {
        //$("#comment").rating();
        $(".selectInfo").click(function () {
            pageStart();
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

        //删除住户
        $(".userinfo").on("click", ".deluser", function () {
            if (confirm("确定删除么？")) {
                var userid = $(this).attr("ref");
                window.location.href = "/user/delUser?userid=" + userid;
            }
        });
        var id = "";
        var buildingname = "";
        var unitname = "";
        var housenum = "";
        //点击更改时
        $(".usertable").on("click", ".changebtn", function () {
            id = $(this).siblings(".deluserid").val();
            buildingname = $(this).siblings(".buildinghidden").val();
            username = $(this).siblings(".delusername").val();
            unitname = $(this).siblings(".unithidden").val();
            housenum = $(this).siblings(".delhousenum").val();
            var modelname = $(this).siblings(".modelhidden").val();
            $(".fileuserid").val("");
            $(".fileuserid").val(id);
            $(".buildingselect2").empty();
            $(".unitselect").empty();
            $(".modelselect").empty();
            $(".housenuminput").val("");
            $("#error").html("");
            //楼栋
            $.ajax({
                type: "GET",
                url: "/building/findAll",
                success: function (json) {
                    $(json).each(function () {
                        $(".buildingselect2").val("");
                        $(".buildingselect2").append("<option class = \"buildingoption\" value=" + this.name + ">" + this.name + "</option>");
                    });
                    var buildingoption = $(".buildingoption");
                    for (var i = 0; i < buildingoption.length; i++) {
                        if (buildingoption[i].value == buildingname) {
                            buildingoption[i].selected = true;
                            break;
                        }
                    }
                },
            });
            //单元
            $.ajax({
                type: "GET",
                url: "/unit/findAll",
                success: function (json) {
                    $(json).each(function () {
                        $(".unitselect").val("");
                        $(".unitselect").append("<option class = \"unitoption\" value=" + this.name + ">" + this.name + "</option>");
                    });
                    var unitoption = $(".unitoption");
                    for (var i = 0; i < unitoption.length; i++) {
                        if (unitoption[i].value == unitname) {
                            unitoption[i].selected = true;
                            break;
                        }
                    }
                },
            });
            //房型
            $.ajax({
                type: "GET",
                url: "/model/findAll",
                success: function (json) {
                    $(json).each(function (index) {
                        $(".modelselect").val("");
                        $(".modelselect").append("<option class = \"modeloption\" value=" + this.id + ">" + this.modelname + "(" + this.area + ")" + "</option>");
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
            //业主信息查询
            $.ajax({
                type: "GET",
                url: "/user/findById",
                data: {
                    id: id,
                },
                success: function (json) {
                    $(".ownername").val(json.username);
                    $(".ownertel").val(json.tel);
                },
            });
            //文件列表分页
            pageStartFile();

            function pageStartFile() {//分页函数
                $.ajax({ //去后台查询第一页数据
                    type: "get",
                    url: "/file/findByPage",
                    dataType: "json",
                    data: {
                        pageNum: '1',
                        username: username,
                    }, //参数：当前页为1
                    success: function (data) {
                        var template2 = $('#template2').html();
                        Mustache.parse(template2);
                        $(".fileinfo").html("");
                        $(data.list).each(function () {
                            var rendered = Mustache.render(template2, this);
                            $(".fileinfo").append(rendered);
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
                                    url: "/file/findByPage",
                                    type: "get",
                                    dataType: "json",
                                    data: {
                                        pageNum: page,
                                        username: username,
                                    },
                                    success: function (data) {
                                        var template2 = $('#template2').html();
                                        Mustache.parse(template2);
                                        $(".fileinfo").html("");
                                        $(data.list).each(function () {
                                            var rendered = Mustache.render(template2, this);
                                            $(".fileinfo").append(rendered);
                                        });

                                    }
                                });
                            }
                        };
                        $('#mypagefile').bootstrapPaginator(options);//设置分页
                    }
                });
            }

            //业主信息修改记录备注
            pageStartNotice();

            function pageStartNotice() {//分页函数
                $.ajax({ //去后台查询第一页数据
                    type: "get",
                    url: "/notice/findByPage",
                    dataType: "json",
                    data: {
                        pageNum: '1',
                        userid: id,
                    }, //参数：当前页为1
                    success: function (data) {
                        var template3 = $('#template3').html();
                        Mustache.parse(template3);
                        $(".noticeinfo").html("");
                        $(data.list).each(function () {
                            var rendered = Mustache.render(template3, this);
                            $(".noticeinfo").append(rendered);
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
                                    url: "/notice/findByPage",
                                    type: "get",
                                    dataType: "json",
                                    data: {
                                        pageNum: page,
                                        userid: id,
                                    },
                                    success: function (data) {
                                        var template3 = $('#template3').html();
                                        Mustache.parse(template3);
                                        $(".noticeinfo").html("");
                                        $(data.list).each(function () {
                                            var rendered = Mustache.render(template3, this);
                                            $(".noticeinfo").append(rendered);
                                        });

                                    }
                                });
                            }
                        };
                        $('#mypagenotice').bootstrapPaginator(options);//设置分页
                    }
                });
            }
        });
        //单元房号离开焦点、查找有没有user住
        $(".housenuminput").blur(function () {
            $.ajax({
                type: "GET",
                url: "/user/findByBuildAndUnitHouse",
                data: {
                    buildingname: buildingname,
                    unitname: unitname,
                    housenum: $(".housenuminput").val(),
                },
                success: function (json) {
                    console.log(json);
                    if (json != null && json != "" && json != "null") {
                        $("#error").html("该房间已有住户");
                        $(".savebtn").attr("disabled", true);
                    }
                }
            });
            $(".housenuminput").focus(function () {
                $("#error").html("");
                $(".updateuser").attr("disabled", false);
            });
        });
        //模态框中点击保存、更改楼栋号、单元号、门牌号
        $(".updateuser").click(function () {
            $.ajax({
                type: "GET",
                url: "/user/update",
                data: {
                    id: id,
                    username: $(".delusername").val(),
                    adminname: $(".adminname").val(),
                    buildingname: $("#buildingname").val(),
                    unitname: $(".unitselect").val(),
                    housenum: $(".housenuminput").val(),
                    modelid: $(".modelselect").val(),
                },
                success: function (json) {
                },
                complete: function () {
                    $('.modal').modal('hide');
                    $(".housenuminput").val("");
                    pageStart();
                }
            });
        });
        //模态框中点击更改、更改户主姓名、电话
        $(".ownerupdate").click(function () {
            $.ajax({
                type: "GET",
                url: "/user/updateUser",
                data: {
                    id: id,
                    adminname: $(".adminname").val(),
                    username: $(".ownername").val(),
                    tel: $(".ownertel").val(),
                },
                success: function (json) {
                },
                complete: function () {
                    $('.modal').modal('hide');
                    pageStart();
                }
            });
        });
        //模态框中删除文件
        $(".fileinfo").on("click", ".deletefile", function () {
            if (confirm("确定要删除么？")) {
                var id = $(this).attr("ref");
                window.location.href = "/file/deleteFile?id=" + id;
            }
        });
        //模态框中添加备注
        $(".savenotice").click(function () {
            $.ajax({
                type: "GET",
                url: "/notice/saveNewNotice",
                data: {
                    content: $(".noticecontent").val(),
                    userid: id,
                    adminname: $(".adminname").val(),
                },
                success: function (json) {
                },
                complete: function () {
                    $(".noticecontent").val("");
                    $('.modal').modal('hide');
                    pageStart();
                }
            });
        });
    });

</script>
</body>
</html>