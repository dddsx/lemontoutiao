<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 如果使用了导航条，需要移除所有导航条的折叠和展开行为。
对于栅格布局，额外增加 .col-xs-* 类或替换掉 .col-md-* 和 .col-lg-*。 不要担心，针
对超小屏幕设备的栅格系统能够在所有分辨率的环境下展开。-->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragrma","no-cache");
        response.setDateHeader("Expires",0);
    %>
    <%@include file="/public/head.jspf"%>
    <link href="${root}/css/navbar.css" rel="stylesheet">
    <link href="${root}/css/news_category.css" rel="stylesheet">
</head>
<body style="overflow-x: hidden;">

<!-- 动态引入导航条 -->
<jsp:include page="../lib/navbar.jsp"/>

<input id="category" type="hidden" value="${requestScope.category}">

<!-- 主内容 -->
<div class="container">
    <div class="row">
        <div class="col-xs-2">
            <%@include file="./left_nav.jsp"%>
        </div>
        <div class="col-xs-6 ">
            <div class="news-container">
                <table id="news-table" class="table table-striped">
                    <c:forEach var="article" items="${requestScope.articleList}">
                        <tr class="news-list">
                            <td>
                                <div class="picture">
                                    <a href="${root}/view/${article.id}" target="_blank"><img class="cover-img" src="${root}/${coverPath}/${article.cover}"></a>
                                </div>
                            </td>
                            <td>
                                <div class="headline">
                                    <a class="headline-font" href="${root}/view/${article.id}" target="_blank"><p>${article.headline}</p></a>
                                </div>
                                <div class="other-info text-right">${article.user.nickname} · ${article.commentNum}评论 · ${article.showTime}</div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <c:choose>
                 <c:when test="${!empty requestScope.articleList}">
                     <div class="text-center" style="background-color:hsla(0,0%,71%,.1)">
                         <a class="reload" role="button" style="color: #5e5e5e;">加载更多</a>
                     </div>
                </c:when>
                    <c:otherwise>
                        <div class="text-center">
                            <a href="https://www.toutiao.com" class="h3">破网站什么都没有，还是去看今日头条好了</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="col-xs-4">
            <!-- 动态引入右侧导航 -->
            <jsp:include page="./right_nav.jsp"/>
        </div>
    </div>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${root}/js/NewsCategory.js"></script>
</body>
</html>
