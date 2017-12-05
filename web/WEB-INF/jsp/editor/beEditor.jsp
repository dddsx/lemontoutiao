<%@ page import="com.lemon213.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //防止用户重新填写作者信息
    User sessionUser = (User) session.getAttribute("sessionUser");
    if(sessionUser.getIsEditor()){
        response.sendRedirect(request.getContextPath() + "/write");
    }
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragrma","no-cache");
        response.setDateHeader("Expires",0);
    %>
    <%@include file="/public/head.jspf"%>
    <style type="text/css">
        body{
            color: #333;
            background-color:#f1f1f1;
        }
        .container{
            width: 900px !important;
            padding: 50px;
            box-shadow: 0 0 8px rgba(0,0,0,.1);
            background-color: white;
        }
        .xiaobian{
            width:300px;
            height:400px;
            float: left;
        }
        span.error{color:#C00; padding:0 6px;}
        form{
            width: 400px;
        }
    </style>
</head>
<body>
<h2 class="text-center">成为小编</h2><br>
<div class="container">
    <div class="row">
        <div class="col-xs-6">
            <img src="${path}/img/materia/xiaobian.jpg" class="xiaobian">
        </div>
        <div class="col-xs-6">
            <p class="text-center h4">
                <b style="color:crimson">要想成为小编，你必须认真填写以下信息</b>
            </p><hr>
            <form id="loginForm" name="loginForm" class="form-horizontal" action="${path}/saveEditor" method="post">
                <div class="form-group">
                    <label class="col-xs-3 control-label">真实姓名</label>
                    <div class="col-xs-8">
                        <input class="form-control" name="realName" type="text" placeholder="" required data-msg-required="请输入真实姓名" maxlength="10">
                    </div>
                    <div class="col-xs-1"></div>
                </div>
                <div class="form-group">
                    <label class="col-xs-3 control-label">身份证件号</label>
                    <div class="col-xs-8">
                        <input class="form-control" name="idcard" type="text" placeholder="" required data-msg-required="请输入身份证" minlength="18" data-msg-minlength="请输入正确格式的身份证" maxlength="19">
                    </div>
                    <div class="col-xs-1"></div>
                </div>
                <div class="form-group">
                    <label class="col-xs-3 control-label">手机号码</label>
                    <div class="col-xs-8">
                        <input class="form-control" name="phone" type="text" placeholder="" maxlength="11" data-rule-mobile="true" required data-msg-required="请输入手机号" data-msg-mobile="请输入正确的格式">
                    </div>
                    <div class="col-xs-1"></div>
                </div>
                <div class="form-group">
                    <label class="col-xs-3 control-label">工作单位</label>
                    <div class="col-xs-8">
                        <input class="form-control" name="workspace" type="text" required data-msg-required="请填写工作单位" placeholder="没有则填无" maxlength="20">
                    </div>
                    <div class="col-xs-1"></div>
                </div>
                <div class="form-group">
                    <label class="control-label">我已认真阅读<a href="#" onclick="{alert('请发表合法文章!')}"> &lt;&lt;<b>作文规章</b>&gt;&gt;</a>并严格遵守(请在下方输入"我同意")</label>
                </div>
                <div class="form-group">
                    <input class="form-control" name="agree" type="text" placeholder="" required data-msg-required="请同意作文规章" minlength="3" data-msg-minlength="请同意作文规章" maxlength="3">
                </div>
                <div class="text-center">
                    <button class="btn btn-primary btn-lg" type="submit" style="width: 100%">成为小编</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div class="text-center"><span style="color: red">${requestScope.errorMessage}</span></div>
                <br>
            </form>
        </div>
    </div>
</div>
<script src="${path}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${path}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/myvalidate.js"></script>
<script>
    //手机验证规则
    jQuery.validator.addMethod("mobile", function (value, element) {
        var mobile = /^1[3|4|5|7|8]\d{9}$/;
        return this.optional(element) || (mobile.test(value));
    }, "手机格式不对");
</script>
</body>
</html>
