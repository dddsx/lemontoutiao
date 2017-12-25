<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="root" />
<c:set value="${applicationScope.headPicPath}" var="headPicPath" />
<!-- 导航条 -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header"> <a class="navbar-brand" href="${root}/">柠檬头条</a> </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">天气<span class="caret"></span></a>
                    <ul class="dropdown-menu" id="weather">
                        ${applicationScope.weather}
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav" style="float: right">
                <c:if test="${empty sessionScope.sessionUser}">
                <li>
                    <a href="${root}/user/login">登录</a>
                </li>
                <li><a href="${root}/user/register">注册</a></li>
                </c:if>
                <c:if test="${!empty sessionScope.sessionUser}">
                    <li><img src="${root}/${headPicPath}/${sessionScope.sessionUser.picName}" alt="???" class="img-circle headPic"></li>
                    <!-- 用户下拉菜单 -->
                    <li>
                        <a class="dropdown-toggle username" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.sessionUser.showName}<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a style="color:#555555" href="#" onclick="{alert('敬请期待!')}">我的收藏</a></li>
                            <li><a style="color:#555555" href="#" onclick="{alert('敬请期待!')}">我的关注</a></li>
                            <li><a style="color:#555555" href="#" onclick="{alert('敬请期待!')}">我的粉丝</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a style="color:#555555" href="${root}/user/myspace">个人空间</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a style="color:#555555" href="${root}/user/logout">退出</a></li>
                        </ul>
                    </li>
                    <li><a href="${root}/write">发文</a></li>
                </c:if>
                <li><a href="mailto:dddsx6324@163.com">反馈</a></li>
                <li><a href="http://www.12377.cn/" target="_blank">投诉</a></li>
            </ul>
        </div>
    </div>
</nav>
