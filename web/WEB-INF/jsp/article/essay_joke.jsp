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
    <style>
        .joke-list{
            border: 1px solid #e8e8e8;
            padding: 15px;
            list-style: none;
        }
        .joke-container{
            padding: 0px;
        }
        .author-info{
            margin-bottom: 10px;
        }
        .author-name{
            font-size: 18px;
        }
        .author-img{
            width: 35px;
            height: 35px;
        }
        .joke-list{
            margin-bottom: 15px;
        }
        .joke-content{
            word-wrap: break-word;
            word-break: break-all;
        }
    </style>
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
                    <li role="presentation"><a category="1" class="point" href="${root}/article/news_recommend"><span class="list">推荐</span></a></li>
                    <li role="presentation"><a category="2" class="point" href="${root}/article/news_hot"><span class="list">热点</span></a></li>
                    <li role="presentation"><a category="3" class="point" href="${root}/article/news_tech"><span class="list">科技</span></a></li>
                    <li role="presentation"><a category="4" class="point" href="${root}/article/news_funny"><span class="list">搞笑</span></a></li>
                    <li role="presentation"><a category="5" class="point" href="${root}/article/news_entertainment"><span class="list">娱乐</span></a></li>
                    <li role="presentation"><a category="6" class="point" href="${root}/article/news_game"><span class="list">游戏</span></a></li>
                    <li role="presentation"><a category="7" class="point" href="${root}/article/news_sports"><span class="list">体育</span></a></li>
                    <li role="presentation"><a category="8" class="point" href="${root}/article/news_cartoon"><span class="list">动漫</span></a></li>
                    <li role="presentation"><a category="9" class="point" href="${root}/article/news_movie"><span class="list">电影</span></a></li>
                   <li role="presentation"><a category="10" class="point"  href="${root}/article/news_automobile"><span class="list">汽车</span></a></li>
                    <li role="presentation" class="dropup active" type="0">
                        <a href="#"  id="more" data-toggle="dropdown" category="0"
                           aria-haspopup="true" aria-expanded="false"><span class="chose">更多</span></a>
                        <ul class="dropdown-menu nav nav-pills nav-stacked" aria-labelledby="more" style="min-width:100%;">
                            <li role="presentation"><a category="11" href="${root}/article/news_military" class="text-center point"><span class="list" style="font-size: 18px">军事</span></a></li>
                            <li role="presentation"><a category="12" href="${root}/article/news_story" class="text-center point"><span class="list" style="font-size: 18px">故事</span></a></li>
                            <li role="presentation"><a category="13" href="${root}/article/news_finance" class="text-center point"><span class="list" style="font-size: 18px">财经</span></a></li>
                            <li role="presentation" class="active"><a category="14" href="${root}/article/essay_joke" class="text-center"><span class="chose" style="font-size: 18px">段子</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-xs-6">
            <div class="news">
                <input id="category" type="hidden" value="${requestScope.category}">
                <div>
                    <ul class="joke-container">
                        <c:forEach var="article" items="${requestScope.articleList}">
                            <li class="joke-list" article-id="${article.id}">
                                <div class="author-info">
                                    <img class="author-img img-circle" src="${root}/${applicationScope.headPicPath}/${article.user.picName}">&nbsp;&nbsp;<span class="author-name">${article.user.nickname}</span>
                                </div>
                                <div class="joke-content">${article.content}</div>
                                <div>
                                    <a type="button" class="btn btn-default btn-lg praise-btn" onclick="praise(${article.id}, ${article.user.editor.id})">
                                        <span class="glyphicon glyphicon glyphicon-thumbs-up praise_num">${article.praiseNum}</span>
                                    </a>
                                    <span class="prompt" style="color: #ed4040;font-size: 17px"></span>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
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
<script>
    function praise(articleId, editorId) {
        $.ajax({
            type: "post",
            url: "${root}/articlePraise",
            dataType: 'text',
            contentType: "application/json",
            data: JSON.stringify({
                articleId : articleId,
                editorId : editorId
            }),
            success:function (data) {
                var $praiseBtn = $("li[article-id=" + articleId + "] .praise-btn");
                var $praiseNum = $("li[article-id=" + articleId + "] .praise_num");
                var $prompt = $("li[article-id=" + articleId + "] .prompt");
                if(data === "login"){
                    alert('请先登录后才能点赞！');
                } else if(data === "success"){
                    $praiseBtn.css("border", "2px solid #ed4040");
                    var text = $praiseNum.text();
                    text = parseInt(text) + 1;
                    $praiseNum.text(text);
                } else if(data === "repeat"){
                    $praiseBtn.css("border", "2px solid #ed4040");
                    $prompt.text("您已为该文章点过赞！");
                }
            },
            error:function () {
                var $prompt = $("li[article-id=" + articleId + "] .prompt");
                $prompt.text("服务器异常，请联系开发人员");
            }
        });
    }
</script>
</body>
</html>
