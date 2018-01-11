<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <%
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragrma","no-cache");
        response.setDateHeader("Expires",0);
    %>
    <%@ include file="/public/head.jspf" %>
    <link rel="stylesheet" href="${root}/css/jquery.idcode.css">
    <style type="text/css">
        body{
            background-color:#f1f1f1;
        }
        span.error{color: #d9534f; padding:0 6px;}
        .wrapper{
            width: 450px;
            padding: 50px;
            margin:auto;
            margin-top: 20px;
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
<div class="wrapper">
    <h3 class="text-center">注 册</h3><br>
    <!-- 错误信息弹出框 -->
    <div style="padding-left: 350px">
        &nbsp;<a id="errorWin" tabindex="0" data-toggle="popover" data-trigger="focus" data-content="${requestScope.errorMessage}"></a>
    </div>
    <form id="registerForm" name="registerForm" class="form-horizontal" action="registerCheck" method="post">
        <input id="md5_pwd" name="md5_pwd" type="hidden" value="">
        <div class="form-group">
            <label class="col-xs-3 control-label" for="username">用户名</label>
            <div class="col-xs-8">
                <input class="form-control" id="username" name="username" type="text" placeholder="" required data-msg-required="请输入用户名" minlength="5" data-msg-minlength="用户名至少为5位" maxlength="20">
            </div>
            <div class="col-xs-1"></div>
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label" for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
            <div class="col-xs-8">
                <input class="form-control" id="password" name="password" type="password" placeholder="" required data-msg-required="请输入密码" minlength="6" data-msg-minlength="密码至少为6位" maxlength="16">
            </div>
            <div class="col-xs-1"></div>
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label" for="re_password">密码确认</label>
            <div class="col-xs-8">
                <input class="form-control" id="re_password" name="re_password" type="password" maxlength="16" placeholder="" required data-msg-required="请进行密码确认" equalTo="#password">
            </div>
            <div class="col-xs-1"></div>
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label">邮箱</label>
            <div class="col-xs-8">
                <input type="email" class="form-control" name="email" data-rule-email="true" required data-msg-required="请输入邮箱" placeholder="例如：6324@163.com">
            </div>
            <div class="col-xs-1"></div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-4">
                <input type="text" id="Txtidcode" maxlength="5" class="txtVerification form-control">
            </div>
            <div class="col-xs-5">
                <span id="idcode"></span>
                <%--<button type="button" id="btns">验证</button>--%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-offset-1 col-xs-11">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="clause" value="clause" required data-msg-required="请先阅读并接受条款">我已阅读并接受<a href="${root}/agreement.html" target="_blank">用户条款</a>
                    </label>
                    <span for="clause" class="error"></span>
                </div>
            </div>
        </div>
        <div class="text-center">
            <button id="submit" class="btn btn-primary btn-lg" type="submit">注 册</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger btn-lg" type="reset">重 置</button>
        </div>
        <br>
        <a href="login">已有账号？去登录</a>
    </form>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${root}/js/jquery.validate.js"></script>
<script src="${root}/js/myvalidate.js"></script>
<script src="${root}/js/jquery.idcode.js"></script>
<script src="${root}/js/jquery.md5.js"></script>
<script>
    $(function(){
        $(".backhome").click(function(){
            window.location.href="${root}/";
        });

        var errorWin = $('#errorWin').popover();
        errorWin.popover('show');
        setInterval(hide, 3000);
        function hide()
        {
            errorWin.popover('hide');
        }
    }); // ";"不要漏掉

    $.idcode.setCode();

    $("#submit").click(function (){
        var IsBy = $.idcode.validateCode();
        if(!IsBy){
            alert("验证码错误!");
            return false;
        }
        var $password = $("#password");
        var pwd = $password.val();
        var md5_pwd = $.md5(pwd);
        $("#md5_pwd").val(md5_pwd);
        return true;
    });
</script>
</body>
</html>
