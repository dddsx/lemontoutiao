<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragrma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
    <%@ include file="/public/head.jspf" %>
    <c:set value="${applicationScope.headPicPath}" var="headPicPath"/>
    <link href="${root}/css/navbar.css" rel="stylesheet">
    <style>
        .jumbotron {
            width: 1024px;
            margin: 0 auto;
            padding-left: 30px;
            padding-right: 30px;
        }
        .changeForm {
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<!-- 动态引入导航条 -->
<jsp:include page="../lib/navbar.jsp"/>
<div class="jumbotron">
    <h1>修改您的密码</h1>
    <p>  本系统于2018年1月12日新增用户密码加密功能，在此之前注册的用户为了账号安全，请务必进行一次密码修改。</p>
    <div class="changeForm">
        <form action="${root}/user/changePwd" method="post">
            <div class="form-group">
                <label for="old_pwd">旧密码</label>
                <input type="password" class="form-control" id="old_pwd" name="old_pwd" maxlength="16" placeholder="输入原来的密码">
            </div>
            <div class="form-group">
                <label for="new_pwd">新密码</label>
                <input type="password" class="form-control" id="new_pwd" name="new_pwd" maxlength="16" placeholder="新密码">
            </div>
            <div class="form-group">
                <label for="re_pwd">密码确认</label>
                <input type="password" class="form-control" id="re_pwd" name="re_pwd" maxlength="16" placeholder="新密码确认">
            </div>
            <button id="submit" type="submit" class="btn btn-default">提交</button><span style="color:#ed4040">&nbsp;&nbsp;${requestScope.message}</span>
        </form>
    </div>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $("#submit").click(function () {
            var old_pwd = $("#old_pwd").val();
            var new_pwd = $("#new_pwd").val();
            var re_pwd = $("#re_pwd").val();
            if(old_pwd === "" || old_pwd === null || new_pwd === "" ||
                new_pwd === null || re_pwd === "" || re_pwd === null){
                alert("请先将表单填写完整");
                return false;
            }
            if(new_pwd !== re_pwd){
                alert("确认密码不一致");
                return false;
            }
        });
    });
</script>
</body>
</html>
