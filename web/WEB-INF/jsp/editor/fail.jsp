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
    <style>
        .wrap{
            width:1300px ;
            margin: 100px auto;
        }
    </style>
</head>
<body>
<div class="wrap">
    <img src="${root}/img/materia/rest.jpg">
    <div style="float: right;margin-top: 100px;margin-right: 30px">
        <h2>您发表文章过于频繁，喝口水休息，几分钟后再试试吧</h2><br>
        <span><a style="font-size: 18px" href="${root}/write">继续作文</a>&nbsp;&nbsp;&nbsp;<a style="font-size: 18px" href="${root}/article/news_recommend">返回首页</a></span>
    </div>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
