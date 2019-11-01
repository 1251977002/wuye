<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!--头部副标题导航-->
<nav class="navbar navbar-fixed-top subhead">
    <div class="navbar-collapse collapse">
        <ul class="sub-list">
            <li class='bread'>
                套房管理:
            </li>
            <li class="${(param.menu eq 'roomlist') ? 'active' : ''}">
                <a href="/room/roomlist">套房列表</a>
            </li>
            <shiro:hasRole name="管理员">
                <li class="${(param.menu eq 'addroom') ? 'active' : ''}">
                    <a href="/room/addroom">添加套房</a>
                </li>
            </shiro:hasRole>
            <li role="separator" class="divider"></li>
            <li class="${(param.menu eq 'buildinglist') ? 'active' : ''}">
                <a href="/building/buildinglist">楼栋列表</a>
            </li>
            <shiro:hasRole name="管理员">
                <li class="${(param.menu eq 'addbuilding') ? 'active' : ''}">
                    <a href="/building/addbuilding">添加楼栋</a>
                </li>
            </shiro:hasRole>
            <li role="separator" class="divider"></li>
            <li class="${(param.menu eq 'unitlist') ? 'active' : ''}">
                <a href="/unit/unitlist">单元列表</a>
            </li>
            <shiro:hasRole name="管理员">
                <li class="${(param.menu eq 'addunit') ? 'active' : ''}">
                    <a href="/unit/addunit">添加单元</a>
                </li>
            </shiro:hasRole>
            <li role="separator" class="divider"></li>
            <li class="${(param.menu eq 'modellist') ? 'active' : ''}">
                <a href="/model/modellist">户型列表</a>
            </li>
            <shiro:hasRole name="管理员">
                <li class="${(param.menu eq 'addmodel') ? 'active' : ''}">
                    <a href="/model/addmodel">添加户型</a>
                </li>
            </shiro:hasRole>
        </ul>
    </div>
</nav>
<!-- #头部副标题导航-->
