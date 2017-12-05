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
    <link href="${path}/css/navbar.css" rel="stylesheet">
    <link href="${path}/css/news_category.css" rel="stylesheet">
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
                    <li role="presentation"><a category="1" class="point" href="${path}/article/news_recommend"><span class="list">推荐</span></a></li>
                    <li role="presentation"><a category="2" class="point" href="${path}/article/news_hot"><span class="list">热点</span></a></li>
                    <li role="presentation"><a category="3" class="point" href="${path}/article/news_tech"><span class="list">科技</span></a></li>
                    <li role="presentation"><a category="4" class="point" href="${path}/article/news_funny"><span class="list">搞笑</span></a></li>
                    <li role="presentation"><a category="5" class="point" href="${path}/article/news_entertainment"><span class="list">娱乐</span></a></li>
                    <li role="presentation"><a category="6" class="point" href="${path}/article/news_game"><span class="list">游戏</span></a></li>
                    <li role="presentation"><a category="7" class="point" href="${path}/article/news_sports"><span class="list">体育</span></a></li>
                    <li role="presentation"><a category="8" class="point" href="${path}/article/news_cartoon"><span class="list">动漫</span></a></li>
                    <li role="presentation"><a category="9" class="point" href="${path}/article/news_movie"><span class="list">电影</span></a></li>
                    <li role="presentation"><a category="10" class="point" href="${path}/article/news_automobile"><span class="list">汽车</span></a></li>
                    <li role="presentation" class="dropup" type="0">
                        <a href="#"  id="more" data-toggle="dropdown" category="0" class="point"
                           aria-haspopup="true" aria-expanded="false"><span class="list">更多</span></a>
                        <ul class="dropdown-menu nav nav-pills nav-stacked" aria-labelledby="more" style="min-width:100%;">
                            <li role="presentation"><a category="11" href="${path}/article/news_military" class="text-center point"><span style="font-size: 18px">军事</span></a></li>
                            <li role="presentation"><a category="12" href="${path}/article/news_story" class="text-center point"><span style="font-size: 18px">故事</span></a></li>
                            <li role="presentation"><a category="13" href="${path}/article/news_finance" class="text-center point"><span style="font-size: 18px">财经</span></a></li>
                            <li role="presentation"><a category="14" href="${path}/article/essay_joke" class="text-center point"><span style="font-size: 18px">段子</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-xs-6 ">
            <div class="news-container">
                <input id="category" type="hidden" value="${requestScope.category}">
                <table id="news-table" class="table table-striped">
                    <c:forEach var="article" items="${requestScope.articleList}">
                        <tr class="news-list">
                            <td>
                                <div class="picture">
                                            <a href="${path}/view/${article.id}" target="_blank"><img class="cover-img" src="${article.picture}"></a>
                                </div>
                            </td>
                            <td>
                                <div class="headline">
                                    <a href="${path}/view/${article.id}" target="_blank"><br><p>${article.headline}</p></a>
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
                        <a href="${path}/write" class="reload" role="button">我要成为第一个新闻界的鲁迅</a>
                    </c:otherwise>
                </c:choose>
<%--                <div>
                    <nav class="page" aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li><a href="#">首页</a></li>
                            <li><a href="#">第2页</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>--%>
            </div>
        </div>
        <div class="col-xs-4" style="border-top: 2px solid #ed4040;">
            <h4 class="text-center">友情链接</h4>
            <hr style="margin-top: 10px;margin-bottom: 10px">
            <a class="friend-link" href="http://www.sina.com.cn/" target="_blank">新浪网</a>&nbsp;&nbsp;&nbsp;
            <a class="friend-link" href="http://www.qq.com/" target="_blank">腾讯网</a>&nbsp;&nbsp;&nbsp;
            <a class="friend-link" href="http://www.sohu.com/" target="_blank">搜狐网</a>&nbsp;&nbsp;&nbsp;
            <a class="friend-link" href="https://www.csdn.net/" target="_blank">CSDN</a>&nbsp;&nbsp;&nbsp;
            <a class="friend-link" href="https://www.douyu.com/" target="_blank">斗鱼</a>&nbsp;&nbsp;&nbsp;
            <a class="friend-link" href="http://v3.bootcss.com/" target="_blank">bootstrap中文网</a>&nbsp;&nbsp;&nbsp;
            <a class="friend-link" href="http://www.w3school.com.cn/" target="_blank">w3school</a>&nbsp;&nbsp;&nbsp;
            <a class="friend-link" href="https://www.bilibili.com/" target="_blank">哔哩哔哩</a>&nbsp;&nbsp;&nbsp;<br>
            <a class="friend-link" href="http://www.jq22.com/" target="_blank">jQuery插件网</a>&nbsp;&nbsp;&nbsp;
            <a class="friend-link" href="https://github.com/" target="_blank">GitHub</a>&nbsp;&nbsp;&nbsp;
            <a class="friend-link" href="https://stackoverflow.com/" target="_blank">SOF</a>&nbsp;&nbsp;&nbsp;
            <a class="friend-link" href="https://www.twitch.tv/liganss6324" target="_blank">twitch</a>&nbsp;&nbsp;&nbsp;<br>
            <a class="friend-link" href="https://www.toutiao.com/" target="_blank">今日头条</a>&nbsp;&nbsp;&nbsp;
        </div>
    </div>
</div>
<script src="${path}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${path}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${path}/js/NewsCategory.js"></script>
</body>
</html>
