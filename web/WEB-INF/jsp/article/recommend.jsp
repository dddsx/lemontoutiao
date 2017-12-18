<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<!-- 主内容 -->
<div class="container">
    <div class="row">
        <div class="col-xs-2">
            <div class="left-nav text-center">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation" class="active"><a category="1" href="${root}/article/news_recommend"><span class="chose">推荐</span></a></li>
                    <li role="presentation"><a category="2" class="point" href="${root}/article/news_hot"><span class="list">热点</span></a></li>
                    <li role="presentation"><a category="3" class="point" href="${root}/article/news_tech"><span class="list">科技</span></a></li>
                    <li role="presentation"><a category="4" class="point" href="${root}/article/news_funny"><span class="list">搞笑</span></a></li>
                    <li role="presentation"><a category="5" class="point" href="${root}/article/news_entertainment"><span class="list">娱乐</span></a></li>
                    <li role="presentation"><a category="6" class="point" href="${root}/article/news_game"><span class="list">游戏</span></a></li>
                    <li role="presentation"><a category="7" class="point" href="${root}/article/news_sports"><span class="list">体育</span></a></li>
                    <li role="presentation"><a category="8" class="point" href="${root}/article/news_cartoon"><span class="list">动漫</span></a></li>
                    <li role="presentation"><a category="9" class="point" href="${root}/article/news_movie"><span class="list">电影</span></a></li>
                    <li role="presentation"><a category="10" class="point"  href="${root}/article/news_automobile"><span class="list">汽车</span></a></li>
                    <li role="presentation" class="dropup" type="0">
                        <a href="#"  id="more" data-toggle="dropdown" category="0" class="point"
                           aria-haspopup="true" aria-expanded="false"><span class="list">更多</span></a>
                        <ul class="dropdown-menu nav nav-pills nav-stacked" aria-labelledby="more" style="min-width:100%;">
                            <li role="presentation"><a category="11" href="${root}/article/news_military" class="text-center point"><span style="font-size: 18px">军事</span></a></li>
                            <li role="presentation"><a category="12" href="${root}/article/news_story" class="text-center point"><span style="font-size: 18px">故事</span></a></li>
                            <li role="presentation"><a category="13" href="${root}/article/news_finance" class="text-center point"><span style="font-size: 18px">财经</span></a></li>
                            <li role="presentation"><a category="14" href="${root}/article/essay_joke" class="text-center point"><span style="font-size: 18px">段子</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-xs-6">
            <div class="news">
                <input id="category" type="hidden" value="${requestScope.category}">
                <table id="news-table" class="table table-striped">
                    <c:forEach var="article" items="${requestScope.articleList}">
                        <tr class="news-list">
                            <td>
                                <div class="picture">
                                    <c:choose>
                                        <c:when test="${fn:startsWith(article.picture, 'http')}">
                                            <a href="${root}/view/${article.id}" target="_blank"><img class="cover-img" src="${article.picture}"></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${root}/view/${article.id}" target="_blank"><img class="cover-img" src="${root}/${article.picture}"></a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                            <td>
                                <div class="headline">
                                    <a href="${root}/view/${article.id}" target="_blank"><br><p>${article.headline}</p></a>
                                </div>
                                <div class="userId text-right">${article.user.nickname} · ${article.commentNum}评论 · ${article.showTime}</div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <c:choose>
                    <c:when test="${!empty requestScope.articleList}">
                        <a class="reload" role="button">我还想要......</a>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center"><a href="${root}/write" class="h3" role="button">少侠妙笔生花, 发表一些文章吧</a></div>
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
