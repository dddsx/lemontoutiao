<%@ page import="com.lemon213.pojo.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragrma","no-cache");
    response.setDateHeader("Expires",0);
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@include file="/public/head.jspf"%>
    <style>
        .navbar{
            min-width: 880px; /* 指定顶部导航栏最小宽度，使它不能折叠 */
        }
        .container{
            width: 1340px !important;
        }
        body{
            overflow-x:hidden;
        }
        .headPic{
            width: 35px;
            height: 35px;
            margin: 9px 5px; /*上下, 左右*/
        }
        .left-nav{
            width:  110px;
            height: 600px;
            position: fixed;
            top: 120px;
            font: 18px "PingFang SC","Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei","Helvetica Neue",Arial,sans-serif;
        }
        hr{
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .article-box{
            width:740px;
        }
        .editor-info{
            height: 70px;
            word-wrap:break-word;
            word-break:break-all;
            overflow: hidden;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 2px solid #ed4040;
        }
        .editor-intro{
            margin-top: 20px;
            font-size: 18px;
            word-wrap:break-word;
            word-break:break-all;
            overflow: hidden;
        }
        .editor-pic{
            width: 50px;
            height: 50px;
        }
        .editor-name{
            font-size: 17px;
        }
        .article-vote{
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .comment-list{
            border-top: 1px solid #e8e8e8;
            padding: 15px;
            list-style: none;
        }
        .comment-container{
            margin-top: 55px;
            padding: 0px;
            margin-bottom: 100px;
        }
        .user-img{
            width: 45px;
            height: 45px;
        }
        .user-name{
            color: #2e6da4;
            font-size: 18px;
        }
        .comment-time{
            font-size: 18px;
        }
        .comment-content{
            font-size: 14px;
            margin-top: 5px;
            padding-left: 49px;
            line-height: 22px;
            color: #222;
            word-wrap: break-word;
            word-break: break-all;
            font-family: PingFang SC,Hiragino Sans GB,Microsoft YaHei,WenQuanYi Micro Hei,Helvetica Neue,Arial,sans-serif;
        }
        span.error{color: #d9534f; padding:0 6px;}
    </style>
</head>
<body>
<!-- 导航条 -->
<nav id="top" class="navbar navbar-inverse">
    <div class="container-fluid">
        <div>
            <ul class="nav navbar-nav">
                <li><a href="${root}/article/news_recommend" style="color: aliceblue;">推荐</a></li>
                <li><a href="${root}/article/news_hot" style="color: aliceblue;">热点</a></li>
                <li><a href="${root}/article/news_tech" style="color: aliceblue;">科技</a></li>
                <li><a href="${root}/article/news_funny" style="color: aliceblue;">搞笑</a></li>
                <li><a href="${root}/article/news_entertainment" style="color: aliceblue;">娱乐</a></li>
                <li><a href="${root}/article/news_game" style="color: aliceblue;">游戏</a></li>
                <li><a href="${root}/article/news_sports" style="color: aliceblue;">体育</a></li>
                <li><a href="${root}/article/news_cartoon" style="color: aliceblue;">动漫</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color: aliceblue;">更多<span class="caret"></span></a>
                    <ul class="dropdown-menu text-center" style="min-width:100%;">
                        <li><a href="${root}/article/news_movie">电影</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${root}/article/news_automobile">汽车</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${root}/article/news_military">军事</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${root}/article/news_story">故事</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${root}/article/news_finance">财经</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${root}/article/essay_joke">段子</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav" style="float: right">
                <c:if test="${empty sessionScope.sessionUser}">
                    <li>
                        <a href="${root}/user/login" style="color: aliceblue;">登录</a>
                    </li>
                    <li><a href="${root}/user/register" style="color: aliceblue;">注册</a></li>
                </c:if>
                <c:if test="${!empty sessionScope.sessionUser}">
                    <li><img src="${root}/${applicationScope.headPicPath}/${sessionScope.sessionUser.picName}" alt="???" class="img-circle headPic"></li>
                    <!-- 用户下拉菜单 -->
                    <li>
                        <a class="dropdown-toggle username" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="color: aliceblue;">${sessionScope.sessionUser.showName}<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a style="color:#555555" href="#" onclick="{alert('敬请期待!')}">我的收藏</a></li>
                            <li><a style="color:#555555" href="#" onclick="{alert('敬请期待!')}">我的关注</a></li>
                            <li><a style="color:#555555" href="#" onclick="{alert('敬请期待!')}">我的粉丝</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a style="color:#555555" href="${root}/user/myspace">个人资料</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a style="color:#555555" href="${root}/user/logout">退出</a></li>
                        </ul>
                    </li>
                    <li><a href="${root}/write" style="color: aliceblue;">发文</a></li>
                </c:if>
                <li><a href="mailto:dddsx6324@163.com" style="color: aliceblue;">反馈</a></li>
                <li><a href="http://www.12377.cn/" style="color: aliceblue;" target="_blank">投诉</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- 主内容 -->
<div class="container">
    <div class="row">
        <div class="col-xs-2" style="padding-left: 30px;">
            <div class="left-nav text-center">
                <ul style="list-style-type:none;padding: 0px;">
                    <li style="margin-bottom: 5px;">
                        <a href="#comment-form" style="color: #606060"><span class="glyphicon glyphicon glyphicon-edit" aria-hidden="true"><b>评论(${requestScope.article.commentNum})</b></span></a>
                    </li><hr>
                    <li>
                        <a href="#top" style="color: #606060"><span class="glyphicon glyphicon glyphicon glyphicon-hand-up" aria-hidden="true"><b>返回顶部</b></span></a>
                    </li><hr>
                    <li style="margin-bottom: 5px;">
                        <a href="${root}" style="color: #606060"><span class="glyphicon glyphicon glyphicon glyphicon-home" aria-hidden="true"><b>返回首页</b></span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-xs-7">
            <div class="article-box">
                <h1 class="article-title"><b>${requestScope.article.headline}</b></h1>
                <div class="article-sub">
                    <span style="color: #5e5e5e">
                        ${requestScope.article.user.nickname}&nbsp;
                        <%
                            java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            Article article = (Article) request.getAttribute("article");
                            out.print(df.format(article.getGmtCreate()));
                        %>
                    </span>
                    <span style="float: right;color: #5e5e5e">
                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true">${requestScope.article.clickNum}&nbsp;&nbsp;</span>
                    </span>
                </div>
                <hr>
                <div class="article-content">
                        ${requestScope.article.content}
                </div>
                <div class="article-vote">
                    <a id="praise-btn" type="button" class="btn btn-default btn-lg">
                        <span id="praise_num" class="glyphicon glyphicon glyphicon-thumbs-up">${requestScope.article.praiseNum}</span>
                    </a>
                    <span id="prompt" style="color: #ed4040;font-size: 17px"></span>
                </div>
                <div class="article-comment">
                    <form id="comment-form" method="post" action="${root}/articleComment?artId=${requestScope.article.id}">
                        <textarea name="content" style="width: 740px;height: 100px" maxlength="200" placeholder="限200字, 请文明评论" required data-msg-required="评论不能为空"></textarea>
                        <div>
                            <span for="content" class="error"></span>
                            <button id="comment-submit" style="float: right;margin-top: 5px" type="submit" class="btn btn-primary btn-lg">发表评论</button>
                        </div>
                    </form>
                    <ul class="comment-container">
                        <c:forEach var="comment" items="${requestScope.commentList}">
                            <li class="comment-list" comment-id="${comment.id}">
                                <div class="user-info" style="float: left">
                                    <img class="user-img img-circle" src="${root}/${applicationScope.headPicPath}/${comment.user.picName}">&nbsp;<span class="user-name">${comment.user.nickname}</span>&nbsp;&nbsp;
                                    <span class="comment-time">${comment.showTime}</span>
                                </div>
                                <div style="float: right;margin-top: 5px">
                                    <a onclick="love(${comment.id})" style="cursor:pointer;color:#ed4040;"><img src="${root}/img/materia/love.png" style="width:30px;height:30px"><span class="love_num">${comment.praiseNum}</span></a>
                                </div>
                                <div class="comment-content" style="clear:both;">${comment.content}</div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-xs-3">
            <div class="editor-info">
                <img src="${root}/${applicationScope.headPicPath}/${requestScope.article.user.picName}" alt="???" class="img-circle editor-pic">
                <span class="editor-name"><b>${requestScope.article.user.nickname}</b></span>
            </div>
            <div class="editor-intro"><span>作者简介: </span><span style="color: #5e5e5e">${requestScope.article.user.introduce}</span></div>
        </div>
    </div>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${root}/js/jquery.validate.js"></script>
<script src="${root}/js/myvalidate.js"></script>
<script>
    $(function () {
        $("#praise-btn").click(praise);
    });

    function praise() {
        $.ajax({
            type: "post",
            url: "${root}/articlePraise",
            dataType: 'text',
            contentType: "application/json",
            data: JSON.stringify({
                articleId : ${requestScope.article.id},
                editorId : ${requestScope.article.user.editor.id}
            }),
            success:function (data) {
                if(data === "login"){
                    $("#prompt").html('请先<a href="${root}/user/login" target="_blank">登录</a>后才能点赞！');
                } else if(data === "success"){
                    $("#praise-btn").css("border", "2px solid #ed4040");
                    var $praise_num = $("#praise_num");
                    var text = $praise_num.text();
                    text = parseInt(text) + 1;
                    $praise_num.text(text);
                } else if(data === "repeat"){
                    $("#praise-btn").css("border", "2px solid #ed4040");
                    $("#prompt").text("您已为该文章点过赞！");
                }
            },
            error:function () {
                $("#prompt").text("服务器异常，请联系开发人员");
            }
        });
    }

    function love(commentId) {
        $.ajax({
            type: "post",
            url: "${root}/commentLove",
            dataType: 'text',
            contentType: "application/json",
            data: JSON.stringify({
                commentId : commentId
            }),
            success:function (data) {
                var $loveNum = $("li[comment-id=" + commentId + "] .love_num");
                var text = $loveNum.text();
                text = parseInt(text) + 1;
                $loveNum.text(text);
            },
            error:function () {
                alert("服务器异常，请联系开发人员");
            }
        });
    }
</script>
</body>
</html>
