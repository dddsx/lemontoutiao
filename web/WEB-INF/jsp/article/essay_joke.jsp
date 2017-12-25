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
            margin-bottom: 10px;
        }
    </style>
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
        <div class="col-xs-6">
            <div class="news">
                <div>
                    <ul id="joke-list" class="joke-container">
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
                        <div class="text-center" style="background-color:#f1f1f1;margin-bottom: 30px">
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
<script>
    $(function(){
        addLeftNavStyle();
        var page = 1;
        var category = $("#category").val();
        $(".reload").click(function () {
            $(this).text("请稍后...");
            page++;
            console.log("向后台请求第:" + page +"页");
            loadNews(category, page.toString());
        })
    });

    function addLeftNavStyle() {
        var category =$("#category").val();
        if(category > 10) {
            var more = $("a[category=0]");
            more.removeClass("point");
            more.parent().addClass("active");
            more.children().removeClass("list").addClass("chose");
        }
        var chose = $("a[category=" + category + "]");
        chose.parent().addClass("active");
        chose.children().removeClass("list").addClass("chose");
        chose.removeClass("point");

        var point = $(".point");
        point.bind("mouseover",function () {
            $(this).parent().addClass("active");
            $(this).children().removeClass("list").addClass("chose");
        });
        point.bind("mouseout",function () {
            $(this).parent().removeClass("active");
            $(this).children().removeClass("chose").addClass("list");
        });
    }

    function loadNews(category, page) {
        $.ajax({
            type: "post",
            url: "${root}/article/reloadNews",
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify({
                category : category,
                page : page
            }),
            success:function (data) {
                console.log(JSON.stringify(data));
                if(data.message  === "loading") {
                    var $joke_list = $("#joke-list");
                    $.each(data.articleList, function (i, item) {
                        $joke_list.append(
                            '<li class="joke-list" article-id=' + item.id + '>' +
                            '<div class="author-info">' +
                            '<img class="author-img img-circle" src=' + "${root}/${applicationScope.headPicPath}/" + item.user.picName + '>&nbsp;&nbsp;<span class="author-name">' + item.user.nickname + '</span>' +
                            '</div>' +
                            '<div class="joke-content">' + item.content + '</div>' +
                            '<div>' +
                            '<a type="button" class="btn btn-default btn-lg praise-btn" onclick="praise(' + item.id + ',' + item.user.editor.id + ')">' +
                            '<span class="glyphicon glyphicon glyphicon-thumbs-up praise_num">' + item.praiseNum + '</span>' +
                            '</a>' +
                            '<span class="prompt" style="color: #ed4040;font-size: 17px"></span>' +
                            '</div>' +
                            '</li>'
                        )
                    });
                    $(".reload").text("加载更多");
                } else if(data.message === "noMoreNews"){
                    $(".reload").text("暂时没有了").unbind();
                }
            },
            error:function () {
                alert("服务器异常，请联系开发人员");
            }
        });
    }

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
