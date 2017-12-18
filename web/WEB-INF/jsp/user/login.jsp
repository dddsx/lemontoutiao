<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragrma","no-cache");
        response.setDateHeader("Expires",0);
    %>
    <%@ include file="/public/head.jspf" %>
    <c:if test="${!empty sessionScope.sessionUser}"> <!-- 防止用户重复登录 -->
        <c:redirect url="/"/>
    </c:if>
    <style type="text/css">
        body{
            background-color:#f1f1f1;
        }
        span.error{color: #d9534f; padding:0 6px;}
        .wrapper{
            width: 450px;
            padding: 50px;
            margin: 50px auto auto;
            box-shadow: 0 0 8px rgba(0,0,0,.1);
            background-color: white;
        }
        .home{
            padding-top: 30px;
            padding-left: 70px;
        }
        .popover-content{
            color: #d9534f;
            font-size: 17px;
        }
    </style>
</head>
<body>
<div class="home">
    <button type="button" class="btn btn-primary btn-lg backhome">
        <span class="glyphicon glyphicon-home"></span>返回首页
    </button>
</div>
<div class="wrapper" >
    <h3 class="text-center">登 录 </h3><br>
    <!-- 错误信息弹出框 -->
    <div style="padding-left: 350px">
        &nbsp;<a id="errorWin" tabindex="0" data-toggle="popover" data-trigger="focus" data-content="${requestScope.errorMessage}"></a>
    </div>
    <form id="loginForm" name="loginForm" class="form-horizontal" action="loginCheck" method="post">
        <div class="form-group">
            <label class="col-xs-3 control-label" for="username">用户名</label>
            <div class="col-xs-8">
                <input class="form-control" id="username" name="username" type="text" placeholder="" required data-msg-required="请输入用户名" minlength="5" data-msg-minlength="没有低于5位的用户名" maxlength="20">
            </div>
            <div class="col-xs-1"></div>
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label" for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
            <div class="col-xs-8">
                <input class="form-control" id="password" name="password" type="password" placeholder="" required data-msg-required="请输入密码" minlength="6" data-msg-minlength="没有低于6位的密码" maxlength="16">
            </div>
            <div class="col-xs-1"></div>
        </div>
        <br>
        <div class="text-center">
            <button class="btn btn-primary btn-lg" type="submit">登 录</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger btn-lg" type="reset">重 置</button>
        </div>
        <br>
        <a href="register">还没有账号？点我注册</a>
    </form>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${root}/js/jquery.validate.js"></script>
<script src="${root}/js/myvalidate.js"></script>
<script>
    var errorWin = $('#errorWin').popover();
    $(function(){
        $(".backhome").click(function(){
            window.location.href="${root}";
        });

        var errorWin = $('#errorWin').popover();
        errorWin.popover('show');
        setInterval(hide, 3000);
        function hide()
        {
            errorWin.popover('hide');
        }
    }); // ";"不要漏掉
</script>
</body>
</html>
