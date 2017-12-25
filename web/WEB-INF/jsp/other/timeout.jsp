<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
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
    <p style="font-size: 16px">会话超时，请重新登录</p>
    <a style="font-size: 16px" href="${root}/">返回首页</a>
</div>
</body>
</html>
