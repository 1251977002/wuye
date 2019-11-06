<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../basepath/basepath.jsp" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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

    <title>楼盘列表 </title>


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
        <jsp:param name="menu" value="roomlist"/>
    </jsp:include>

    <!--页面主体-->
    <div class="list-container have-subhead">

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

            <%-- <!--列表头部-->
             <div>
                 <h5>
                     <!--列表的标题-->
                     &lt;%&ndash;测试 用户能不能看到  很NICE&ndash;%&gt;
                     套房列表
                     你好：<shiro:principal/>
                     <shiro:hasRole name="管理员">
                         <a href="admin.jsp">Administer the system</a>
                     </shiro:hasRole>
                     <!--迷你页码-->
                   &lt;%&ndash;  <span class="pagination-total pull-right">
                     查询结果: 660 条记录，当前 1/66 页
                         <!--上一页-->
                     <a href="#" class="btn btn-xs btn-default">
                       <span class="glyphicon glyphicon glyphicon-menu-left"></span>
                     </a>&ndash;%&gt;
                         <!--下一页-->
                     <a href="#/backend/admin/user?page=2" class="btn btn-xs btn-default">
                       <span class="glyphicon glyphicon glyphicon-menu-right"></span>
                     </a>
                   </span>
                 </h5>
             </div>--%>
            <!-- #列表头部-->

            <!--列表-->
            <div>
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>楼栋号</th>
                        <th>单元房号</th>
                        <th>户型</th>
                        <th>物业费</th>
                        <th>业主姓名</th>
                        <th>联系电话</th>
                        <th>物业费到期时间</th>
                        <th>逾期时间</th>
                        <th width="150">操作</th>
                    </tr>
                    </thead>
                    <tbody class="mytable">


                    <%--<tr>
                        <td>十一栋</td>
                        <td>洋房三单元602</td>
                        <!--  <td>602</td> -->
                        <td>两房两厅（89平米）</td>
                        <td>35.6元/年</td>
                        <td>李四</td>
                        <td>14444444444</td>
                        <td>2018-09-17 <span class="label label-default">已延期</span></td>
                        <td>5天</td>
                        <td>
                            &lt;%&ndash;<span class="glyphicon glyphicon-pencil"></span>
                            更改
                          </a> -->&ndash;%&gt;
                            <button type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                    data-target="#myModal">
                                <span class="glyphicon glyphicon-pencil"></span>
                                更改
                            </button>
                            <a href="#" class="btn btn-xs btn-danger">
                                <span class="glyphicon glyphicon-remove"></span>
                                删除
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>十二栋</td>
                        <td>洋房三单元603</td>
                        <!-- <td>603</td> -->
                        <td>四房两厅（139平米）</td>
                        <td>55.6元/年</td>
                        <td>王五</td>
                        <td>15555555555</td>
                        <td>2017-09-17 <span class="label label-warning">七天内到期</span></td>
                        <td>0天</td>
                        <td>
                            &lt;%&ndash; <span class="glyphicon glyphicon-pencil"></span>
                             更改
                           </a> -->&ndash;%&gt;
                            <button type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                    data-target="#myModal">
                                <span class="glyphicon glyphicon-pencil"></span>
                                更改
                            </button>
                            <a href="#" class="btn btn-xs btn-danger">
                                <span class="glyphicon glyphicon-remove"></span>
                                删除
                            </a>
                        </td>
                    </tr>--%>
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
<%--<div style="z-index: 9999" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
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
                            <a href="#person" aria-controls="person" role="tab" data-toggle="tab">业主信息更改</a>
                        </li>
                        <li role="presentation">
                            <a href="#file" aria-controls="file" role="tab" data-toggle="tab">相关文件</a>
                        </li>
                        <li role="presentation">
                            <a href="#timeline" aria-controls="timeline" role="tab" data-toggle="tab"
                               id="time">业主信息修改记录</a>
                        </li>

                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <!--套房信息-->
                        <div role="tabpanel" class="tab-pane active " id="base">
                            <br/>
                            <form class="form-horizontal" enctype="multipart/form-data" action="#/backend/admin/product"
                                  method="post">
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
                                                <select class="form-control chosen" name="status">
                                                    <option value="1">一栋</option>
                                                    <option value="2">二栋</option>
                                                    <option value="3">三栋</option>
                                                    <option value="4">四栋</option>
                                                    <option value="5">五栋</option>
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>单元号
                                            </td>
                                            <td>
                                                <select class="form-control chosen" name="status">
                                                    <option value="1">洋房一单元</option>
                                                    <option value="2">洋房二单元</option>
                                                    <option value="3">洋房三单元</option>
                                                    <option value="4">别墅区一街</option>
                                                    <option value="5">别墅区二街</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span> 房号
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" name="title" value=""
                                                       placeholder="">
                                            </td>
                                        </tr>


                                        <tr>
                                            <td class="form-title">
                                                <span class="text-danger">*</span>户型
                                            </td>
                                            <td>
                                                <select class="form-control chosen" name="status">
                                                    <option value="1">三房两厅（119平米）</option>
                                                    <option value="2">两房两厅（89平米）</option>
                                                    <option value="3">四房两厅（139平米）</option>
                                                </select>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td class="form-title">物业费用</td>
                                            <td>
                                                /月（选择了「户型」，系统会自动计算该楼层的物业费用）
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
                                            <a href="../owner/owner-list.jsp" class="btn btn-primary btn-lg btn-block">
                                                保存</a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>
                        <!--业主信息-->
                        <div role="tabpanel" class="tab-pane " id="person">
                            <br/>
                            <div class="row">
                                <div class="col-md-6">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>业主姓名</th>
                                            <th>联系电话</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>张三</td>
                                            <td>13333333333</td>
                                            <td>
                                                <a href="#" class="btn btn-xs btn-danger"><span
                                                        class="glyphicon glyphicon-remove"></span>删除</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>张四</td>
                                            <td>14444444444</td>
                                            <td>
                                                <a href="#" class="btn btn-xs btn-danger"><span
                                                        class="glyphicon glyphicon-remove"></span>删除</a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h5>添加业主</h5>
                            <div class="row">
                                <div class="col-md-6">
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
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>


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
<span class="label label-danger"></span>

<script id="template" type="x-tmpl-mustache">
                    <tr>
                        <td>{{buildingname}}</td>
                        <td>{{unitname}}{{housenum}}</td>
                        <td>{{user.modelname}}</td>
                        <td>{{money}}/年</td>
                        <td>{{user.username}}</td>
                        <td>{{user.tel}}</td>
                        <td>{{endtime}}
                        {{#isoverday}}
                        <span class="label label-success">未逾期</span>
                        <td>未出现逾期</td>
                        {{/isoverday}}
                        {{^isoverday}}
                        <span class="label label-danger">已逾期</span>
                        <td>{{overday}}天</td>
                        {{/isoverday}}
                        </td>

                        <shiro:hasRole name="管理员">
                        <td>
                        <a href="javascript:;" rel= "{{id}}" class="btn btn-xs btn-danger" id="del">
                        <span class="glyphicon glyphicon-remove"></span>
                        删除</a>
                        </td>
                        </shiro:hasRole>
                    </tr>

</script>


<script type="text/javascript">
    $(document).ready(function () {

        $(".selectInfo").click(function () {
            pageStart();
        })


        $(".mytable").on("click", "#del", function () {
            if (confirm("确定要删除吗？")) {
                var id = $(this).attr("rel");
                window.location.href = "/room/deleteroom?id=" + id;
                return true;
            }
            return false;
        });


        //左侧模糊查询   楼栋

        $.ajax({
            type: "GET",
            url: "/room/findAllBuilding",
            success: function (json) {
                $(json).each(function () {
                    console.log(json);
                    $(".buildingselect").append("<option value = " + this.name + ">" + this.name + "</option>");
                });
            },
        });
        //重置和清空左侧查询框内容
        $(".cleanbtn").click(function () {
            $(".username").val("");
            $(".buildingselect").val("");
            pageStart();

        });


        pageStart();//开始分页

        function pageStart() {//分页函数
            $.ajax({ //去后台查询第一页数据
                type: "get",
                url: "/room/findByPage1",
                dataType: "json",
                data: {
                    pageNum: '1',
                    username: $(".username").val(),
                    status: $(".buildingselect").val(),
                },
                //参数：当前页为1
                success: function (data) {
                    console.log(data);
                    var template = $('#template').html();
                    Mustache.parse(template);
                    $(".mytable").html("");

                    /*判断模板中的时间是否逾期*/
                    $(data.list).each(function (index) {
                        console.log(data.list[index].overday);
                        data.list[index].isoverday=function () {
                            if(data.list[index].overday<=0){
                                return true;
                            }
                            return false;
                        }

                        var rendered = Mustache.render(template, this);
                        $(".mytable").append(rendered);
                    });

                    var options = {//根据后台返回的分页相关信息，设置插件参数
                        bootstrapMajorVersion: 3, //如果是bootstrap3版本需要加此标识，并且设置包含分页内容的DOM元素为UL,如果是bootstrap2版本，则DOM包含元素是DIV
                        currentPage: data.pageNum, //当前页数
                        totalPages: data.pages == 0 ? "" : data.pages, //总页数
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
                                url: "/room/findByPage1",
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
    $()

</script>


</body>
</html>