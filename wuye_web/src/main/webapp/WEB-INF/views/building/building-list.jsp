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
                    <tbody>

                    <c:choose>
                        <c:when test="${ (!empty buildinglist) && (fn:length(buildinglist) > 0)}">
                            <c:forEach var="building" items="${buildinglist}" varStatus="sta">
                                <tr>
                                    <td>${building.name}</td>
                                    <td>${building.note}</td>
                                    <td>
                                        <a href="#" class="btn btn-xs btn-primary">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                            编辑
                                        </a>
                                        <a href="/building/deletebuilding?id=${building.id}" class="btn btn-xs btn-danger" id="del">
                                            <span class="glyphicon glyphicon-remove"></span>
                                            删除
                                        </a>
                                    </td>
                                </tr>

                            </c:forEach>


                        </c:when>

                    </c:choose>


                   <%-- <tr>
                        <td>一栋</td>
                        <td></td>
                        <td>
                            <a href="#" class="btn btn-xs btn-primary">
                                <span class="glyphicon glyphicon-pencil"></span>
                                编辑
                            </a>
                            <a href="#" class="btn btn-xs btn-danger">
                                <span class="glyphicon glyphicon-remove"></span>
                                删除
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>二栋</td>
                        <td></td>
                        <td>
                            <a href="#" class="btn btn-xs btn-primary">
                                <span class="glyphicon glyphicon-pencil"></span>
                                编辑
                            </a>
                            <a href="#" class="btn btn-xs btn-danger">
                                <span class="glyphicon glyphicon-remove"></span>
                                删除
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>三栋</td>
                        <td></td>
                        <td>
                            <a href="#" class="btn btn-xs btn-primary">
                                <span class="glyphicon glyphicon-pencil"></span>
                                编辑
                            </a>
                            <a href="#" class="btn btn-xs btn-danger">
                                <span class="glyphicon glyphicon-remove"></span>
                                删除
                            </a>
                        </td>
                    </tr>
--%>

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
    $(document).ready(function () {

        //日期选择
        yoozi.datapicker('.datepicker');

    });
</script>
</body>
</html>