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
            width:500px ;
            margin-top: 30px;
            margin-left: 100px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <h3>发表成功, 请耐心等待管理员审核</h3><br>
    <span><a style="font-size: 16px" href="${root}/write">继续发文</a>&nbsp;&nbsp;&nbsp;<a style="font-size: 16px" href="${root}/article/news_recommend">返回首页</a></span>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
