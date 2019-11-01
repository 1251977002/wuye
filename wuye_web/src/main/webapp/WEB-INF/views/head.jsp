<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!--头部主标题导航-->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#/backend/">
                物业管理系统
            </a>
        </div>
        <div class="navbar-collapse collapse">
            <!--头部菜单-->
            <ul class="nav navbar-nav">
                <li class="${(param.menu eq 'owe') ? 'active' : ''}"><a href="/owe/owedata">欠费管理</a></li>
                <li class="${(param.menu eq 'room') ? 'active' : ''}" ><a href="/room/roomlist">套房管理</a></li>
                <li class="${(param.menu eq 'cost') ? 'active' : ''}"><a href="cost-list.jsp">收费管理</a></li>
                <li class="${(param.menu eq 'user') ? 'active' : ''}" ><a href="/user/list">业主管理</a></li>
                <li class="${(param.menu eq 'notice') ? 'active' : ''}"><a href="/notice/noticeList">公告板</a></li>
                <li class="${(param.menu eq 'bbs') ? 'active' : ''}"><a href="/bbs/bbslist">社区论坛</a></li>
            </ul>
            <!-- #头部菜单-->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">尊敬的<shiro:principal/> ，您好！</li>
                        <li><a href="/admin/logout">退出</a></li>

                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- #头部主标题导航-->

