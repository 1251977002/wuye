<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link href="./assets/vendors/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="./assets/vendors/distpicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet">
    <link href="./assets/vendors/chosen/chosen.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="assets/vendors/webuploader/webuploader.css"/>
    <link rel="stylesheet" type="text/css" href="assets/page.css"/>
    <link rel="stylesheet" type="text/css" href="./assets/vendors/star/star-rating.css">


    <!-- Custom styles for this template -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="">
<!--[if lt IE 10]>
<div id="browser-warning" class="contextual bg-danger center navbar-fixed-top">
    <div class="container">
        <i class="glyphicon glyphicon-warning-sign"></i> 目前 物业管理系统不支持 IE 10 以下浏览器使用，请升级浏览器或更换浏览器。推荐使用 Chrome 浏览器。
    </div>
</div>
<![endif]-->

<!--头部主标题导航-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#/backend/">
                物业管理系统
                <span class="badge">1.0</span>
            </a>
        </div>
        <div class="navbar-collapse collapse">
            <!--头部菜单-->
            <ul class="nav navbar-nav">
                <li><a href="control-data.jsp">欠费管理</a></li>
                <li><a href="room-list.jsp">套房管理</a></li>
                <li><a href="cost-list.jsp">收费管理</a></li>
                <li class="active"><a href="owner-list.jsp">业主管理</a></li>
            </ul>
            <!-- #头部菜单-->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Saturn</li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

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
                    <a href="owner-list.jsp">业主列表</a>
                </li>
                <li class='active'>
                    <a href="owner-add.jsp">业主入住</a>
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
            <p><a href="owner-list.jsp
              ">&lt; 查看业主列表</a></p>

        </div>

        <!--页面右侧-->
        <div class="main">

            <form class="form-horizontal" enctype="multipart/form-data" action="3" method="post">
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
                                <span class="text-danger">*</span>单元房号
                            </td>
                            <td>
                                <input type="text" class="form-control" name="title" value="" placeholder="">
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
                            <td class="form-title">
                                <span class="text-danger">*</span>物业费标准
                            </td>
                            <td>
                                <select class="form-control chosen" name="status">
                                    <option value="1">洋房A（0.4元/平米/年）</option>
                                    <option value="1">洋房B（0.5元/平米/年）</option>
                                    <option value="2">联排别墅（0.6元/平米/年）</option>
                                    <option value="2">独栋别墅（0.7元/平米/年）</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td class="form-title">物业费用</td>
                            <td>
                                47.6元/年（选择了「户型」和「物业费标准」，系统会自动计算该楼层的物业费用）
                            </td>
                        </tr>


                        <tr>
                            <td class="form-title"><span class="text-danger">*</span>
                                户主姓名
                            </td>
                            <td>
                                <input type="text" class="form-control" name="title" value="" placeholder="">
                            </td>
                        </tr>


                        <tr>
                            <td class="form-title"><span class="text-danger">*</span>
                                联系方式
                            </td>
                            <td>
                                <input type="text" class="form-control" name="title" value="" placeholder="">
                            </td>
                        </tr>
                        <tr>
                            <td class="form-title">
                                <span class="text-danger">*</span>星级
                            </td>
                            <td>
                                <input id="comment" name="comment" class="rating" min="0" max="5" step="1"
                                       data-size="xss" value="5">

                                </select>
                            </td>
                        </tr>
                        <tr style="height: 100px;">
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
                        </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            </tr>

            <table class="table form-table">
                <tbody>
                <tr>
                    <td class="form-title"></td>
                    <td>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">保存</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        </form>
    </div>
</div>
</div>
<!-- /container -->
<!-- <script src="./assets/vendors/jquery-1.10.2.min.js"></script> -->
<script src="assets/vendors/webuploader/jquery.js"></script>
<script src="assets/vendors/webuploader/webuploader.js"></script>
<script src="assets/vendors/webuploader//upload.js"></script>
<script type="text/javascript">

</script>


<script src="./assets/vendors/jquery-1.11.1.min.js"></script>
<script src="./assets/vendors/bootstrap/bootstrap.min.js"></script>
<script src="./assets/vendors/distpicker/bootstrap-datepicker.min.js"></script>
<script src="./assets/vendors/distpicker/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="./assets/vendors/chosen/chosen.jquery.min.js"></script>
<script src="./assets/vendors/lodash.min.js"></script>
<script src="./assets/vendors/jquery.confirm.min.js"></script>
<script src="./assets/yoozi.js"></script>
<script src="./assets/common.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        //下拉列表添加 chosen
        yoozi.chosen('.chosen');

    });
</script>

<script src="./assets/vendors/star/star-rating.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#comment").rating();
    });
</script>


</body>
</html>