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

    <title>楼栋列表 </title>

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
    <jsp:param name="menu" value="room"/>
</jsp:include>

<div class="list-container have-subhead">

    <jsp:include page="../headSecond.jsp">
        <jsp:param name="menu" value="buildinglist"/>
    </jsp:include>

    <!--页面主体-->
    <div class="list-container have-subhead">

        <!--页面左侧-->
        <div class="sidebar">
            <a href="/room/roomlist"><h1>返回</h1></a>
            <!--查询表单-->
            <p><a href="/room/roomlist">&lt; 查看套房列表</a></p>

        </div>

        <!--页面右侧-->
        <div class="main">

            <!--列表头部-->
            <div>
                <h5>单元管理</h5>
            </div>
            <!-- #列表头部-->

            <!--列表-->
            <div>
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>楼栋名称</th>
                        <th>备注</th>
                        <th width="150">操作</th>
                    </tr>
                    </thead>
                    <tbody class="mytable">

                    <%--<c:choose>
                        <c:when test="${ (!empty buildinglist) && (fn:length(buildinglist) > 0)}">
                            <c:forEach var="building" items="${buildinglist}" varStatus="sta">
                                <tr>
                                    <td>${building.name}</td>
                                    <td>${building.note}</td>
                                    <td>
                                        <shiro:hasRole name="管理员">
                                            <button type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                                    data-target="#myModal">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                                编辑
                                            </button>
                                            <a href="/building/deletebuilding?id=${building.id}"
                                               class="btn btn-xs btn-danger" id="del">
                                                <span class="glyphicon glyphicon-remove"></span>
                                                删除
                                            </a>
                                        </shiro:hasRole>
                                    </td>
                                </tr>

                            </c:forEach>


                        </c:when>

                    </c:choose>--%>
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
<%--模态框，点击编辑弹出--%>
<div style="z-index: 9999" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <!-- <h4 class="modal-title" id="myModalLabel">修改记录列表</h4> -->
                <div>
                    <ul class="nav nav-tabs" role="tablist" id="ulbody">
                        <li role="presentation" class="active">
                            <a href="#base" aria-controls="base" role="tab" data-toggle="tab">楼栋信息更改</a>
                        </li>
                        <%--<li role="presentation">
                            <a href="#file" aria-controls="file" role="tab" data-toggle="tab">相关文件</a>
                        </li>
                        <li role="presentation">
                            <a href="#timeline" aria-controls="timeline" role="tab" data-toggle="tab"
                               id="time">业主信息修改记录</a>
                        </li>--%>

                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <!--楼栋信息-->
                        <div role="tabpanel" class="tab-pane active " id="base">
                            <br/>
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
                                            <input type="text" class="form-control" id="buildingname">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-title">
                                            <span class="text-danger">*</span>备注
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" id="note">
                                            <input type="hidden" class="hiddenid" value="">
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
                                        <button type="button" class="btn btn-primary btn-lg btn-block edit">
                                            保存
                                        </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <%--<!--相关文件-->
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
                            <br/>
                            <h5>添加文件</h5>
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
                                                <a href="#" class="btn btn-primary">保存</a>
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
                            <br/>
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
                                                <button class="btn btn-primary">保存</button>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>--%>


                    </div>
                </div>
            </div>
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

                    <td >{{name}}</td>
                    <td >{{note}}</td>
                    <td>
                     <input type="hidden" class = "name" value = "{{name}}">
                     <input type="hidden" class = "note" value = "{{note}}">
                       <shiro:hasRole name="管理员">
                    <button type="button" class="btn btn-primary btn-xs update" data-toggle="modal"
                    data-target="#myModal">
                    <span class="glyphicon glyphicon-pencil"></span>
                    编辑
                    </button>
                    <input type="hidden" class="buildingid" value = "{{id}}" >
                    <a href="javascript:;" rel= "{{id}}" class="btn btn-xs btn-danger" id="del">
                    <span class="glyphicon glyphicon-remove"></span>
                    删除
                    </a>
</shiro:hasRole>
                    </td>
              </tr>

</script>

<script type="text/javascript">

    $(document).ready(function () {
        //日期选择
        yoozi.datapicker('.datepicker');

        /*点击编辑把值带过去*/
        $(".mytable").on("click", ".update", function () {

            var buildingname = $(this).siblings(".name").val();
            var note = $(this).siblings(".note").val();
            var id = $(this).siblings(".buildingid").val();
            console.log(buildingname);
            console.log(note);
            console.log(id);
            $("#buildingname").val(buildingname);
            $("#note").val(note);
            $(".hiddenid").val(id);

        });

        //点击删除弹框
        $(".mytable").on("click", "#del", function () {
            if (confirm("确定要删除吗？")) {
                var id = $(this).attr("rel");
                window.location.href = "/building/deletebuilding?id=" + id;
                return true;
            }
            return false;
        });

        //点击保存
        $(".edit").click(function () {
            $.ajax({
                type: "GET",
                url: "/building/edit",
                data: {
                    id: $(".hiddenid").val(),
                    name: $("#buildingname").val(),
                    note: $("#note").val(),

                },
                success: function (json) {
                    if (json == 0) {
                        console.log("保存成功！");
                    }
                },
                complete: function () {
                    $('.modal').modal('hide');
                    $(".note").val("");
                    pageStart();
                }
            });
        });


        pageStart();//开始分页

        function pageStart() {//分页函数
            $.ajax({ //去后台查询第一页数据
                type: "get",
                url: "/building/findByPage",
                dataType: "json",
                data: {
                    pageNum: '1'

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
                                url: "/building/findByPage",
                                type: "get",
                                dataType: "json",
                                data: {
                                    pageNum: page
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