<%@ page import="com.lemon213.pojo.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragrma","no-cache");
        response.setDateHeader("Expires",0);
    %>
    <%@include file="/public/head.jspf" %>
    <style>
        body{
            overflow-x:hidden;
        }
        .article-box {
            margin-top: 50px;
            margin-left: 435px;
            width: 740px;
        }
        .editor-box {
            position: fixed;
            top: 40px;
            left: 150px;
            width: 200px;
        }
        .editor-pic {
            width: 50px;
            height: 50px;
        }
    </style>
</head>
<body>
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
    </div>
    <hr>
    <div class="article-content">
        ${requestScope.article.content}
    </div>
</div>
<div class="editor-box">
    <h3 class="text-center">作者资料</h3><hr>
    <img src="${root}/${headPicPath}/${requestScope.article.user.picName}" alt="???" class="img-circle editor-pic">
    <span><b>${requestScope.article.user.nickname}</b></span><br>
    <hr>
    真实姓名：${requestScope.article.user.editor.realName}
    <hr>
    手机号：${requestScope.article.user.editor.phone}
    <hr>
    工作单位：${requestScope.article.user.editor.workspace}
    <hr>
    发表文章数：${requestScope.article.user.editor.pubNum}
</div>
</body>
</html>
