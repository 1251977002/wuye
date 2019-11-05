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

    <title>添加楼盘 </title>

    <!-- Bootstrap core CSS -->
    <link href="${basePath}assets/vendors/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="${basePath}assets/vendors/distpicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet">
    <link href="${basePath}assets/vendors/chosen/chosen.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${basePath}assets/vendors/webuploader/webuploader.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}assets/page.css"/>


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

<!-- #头部主标题导航-->
<div class="list-container have-subhead">

    <jsp:include page="../headSecond.jsp">
        <jsp:param name="menu" value="addroom"/>
    </jsp:include>

    <!--页面主体-->
    <div class="list-container have-subhead">

        <!--页面左侧-->
        <div class="sidebar">
            <h1>返回</h1>
            <!--查询表单-->
            <p><a href="/room/roomlist">&lt; 查看套房列表</a></p>

        </div>

        <!--页面右侧-->
        <div class="main">

            <form class="form-horizontal" enctype="multipart/form-data" action="/room/saveroom" method="post">
                <input type="hidden" name="_token" value="17nb09nROctqttKz9hcPg4gxNB0wCU8B21t744md">
                <input type="hidden" name="id" value="0"/>

                <div>
                    <h5>
                        套房信息
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
                                <select class="form-control chosen" name="buildingname">
                                    <option value="一号楼">一号楼</option>
                                    <option value="二号楼">二号楼</option>
                                    <option value="三号楼">三号楼</option>
                                    <option value="四号楼">四号楼</option>
                                    <option value="五号楼">五号楼</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td class="form-title">
                                <span class="text-danger">*</span>单元房号
                            </td>
                            <td>
                                <input type="text" class="form-control" name="unitname" value="" placeholder="">
                            </td>
                        </tr>

                        <tr>
                            <td class="form-title">
                                <span class="text-danger">*</span>户型
                            </td>
                            <td>
                                <select class="form-control chosen" name="modelname" id="model">
                                    <option value="两房两厅（101平米）">两房两厅（101平米）</option>
                                    <option value="三房两厅（116平米）">三房两厅（116平米）</option>
                                    <option value="四房两厅（139平米）">四房两厅（139平米）</option>
                                    <option value="联排别墅（316平米）">联排别墅（316平米）</option>
                                    <option value="独栋别墅（521平米）">独栋别墅（521平米）</option>
                                </select>
                            </td>
                        </tr>


                        <tr>
                            <td class="form-title">物业费用</td>

                            <td>
                               <span id="pp"></span>元/年（选择了「户型」,系统会自动计算该楼层的物业费用）
                            </td>

                        </tr>


                        <tr>
                            <td class="form-title">
                                户主姓名
                            </td>
                            <td>
                                <input type="text" class="form-control" name="username" value="" placeholder="">
                            </td>
                        </tr>


                        <tr>
                            <td class="form-title">
                                联系方式
                            </td>
                            <td>
                                <input type="text" class="form-control" name="tel" value="" placeholder="">
                            </td>
                        </tr>




                       <%-- <tr style="height: 100px;">
                            <td class="form-title">
                                上传文件
                            </td>
                            <td>--%>
                                <%--<div id="wrapper">
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
                                </div>--%>

                                <!--  <input type="file" id="exampleInputFile"> -->
                            </td>
                        </tr>


                        </tbody>
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

                    </table>
                </div>
            </form>
            </tr>

            <%--<table class="table form-table">
                <tbody>
                <tr>
                    <td class="form-title"></td>
                    <td>
                        <a href="../owner/owner-list.jsp" class="btn btn-primary btn-lg btn-block"> 保存</a>
                    </td>
                </tr>
                </tbody>
            </table>--%>
        </div>

        </form>
    </div>
</div>
</div>
<!-- /container -->
<!-- <script src="./assets/vendors/jquery-1.10.2.min.js"></script> -->
<script src="${basePath}assets/vendors/webuploader/jquery.js"></script>
<script src="${basePath}assets/vendors/webuploader/webuploader.js"></script>
<script src="${basePath}assets/vendors/webuploader//upload.js"></script>
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
    var p6 = 0;
    $("#model").change(function () {
        var p1 = ($(this).children('option:selected').val());
        var p2 = (p1.substring(5,8));
        p6 = parseInt(p2);
        console.log(p6);

    });
    var p5 = 0;
    $("#modelmoney").change(function () {
        var p3 = ($(this).children('option:selected').val());
        p5 = parseInt(p3);
        console.log(p5);
        ($("#pp").text(p5*p6*12));
    });




</script>


</body>
</html>