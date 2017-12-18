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
<c:if test="${empty requestScope.errorMessage}">
    <h3>发表成功!</h3><br>
    <span><a href="${root}/view/${requestScope.articleId}">查看文章</a>&nbsp;&nbsp;&nbsp;<a href="${root}">返回首页</a></span>
</c:if>
<c:if test="${!empty requestScope.errorMessage}">
    ${requestScope.errorMessage}
</c:if>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
