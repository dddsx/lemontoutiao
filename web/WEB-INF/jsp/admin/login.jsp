<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragrma","no-cache");
        response.setDateHeader("Expires",0);
    %>
    <%@include file="/public/head.jspf"%>
    <style>
        .login{
            margin-top: 50px;
            margin-left: 50px;
        }
        .error{
            color: red;
        }
    </style>
</head>
<body>

<div class="login">
    <h2>后台管理系统登录</h2>
    <form action="${root}/admin/loginCheck" method="post">
        用户名：<input type="text" name="username" maxlength="20"><br><br>
        密码：<input type="password" name="password" maxlength="16"><br><br>
        <input type="submit" value="登录">
        <input type="reset" value="重置"><br><br>
        <span class="error">${requestScope.errorMessage}</span>
    </form>
</div>
</body>
</html>
