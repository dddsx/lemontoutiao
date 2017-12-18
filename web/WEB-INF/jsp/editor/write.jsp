<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragrma","no-cache");
        response.setDateHeader("Expires",0);
    %>
    <%@ include file="/public/head.jspf" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${root}/op-plugin/umeditor1.2.3-utf8-jsp/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${root}/op-plugin/umeditor1.2.3-utf8-jsp/third-party/jquery.min.js"></script>
    <script type="text/javascript" src="${root}/op-plugin/umeditor1.2.3-utf8-jsp/third-party/template.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${root}/op-plugin/umeditor1.2.3-utf8-jsp/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${root}/op-plugin/umeditor1.2.3-utf8-jsp/umeditor.min.js"></script>
    <script type="text/javascript" src="${root}/op-plugin/umeditor1.2.3-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <link href="${root}/css/navbar.css" rel="stylesheet">
    <style type="text/css">
        body{
            margin-top: 55px;
            background-color:#f1f1f1;
        }
        h1{
            font-family: "微软雅黑";
            font-weight: normal;
        }
        .container{
            padding: 0px;
            width: 840px;
        }
        #myEditor{
            width:740px;
            height:380px;
        }
        .error{color: #CC0000; padding:0 6px;}
    </style>
</head>
<body>
<!-- 动态引入导航条 -->
<jsp:include page="../lib/navbar.jsp"/>
<div class="container">
<form id="edit" action="${root}/commitArticle" method="post">
    <h1 class="text-center">发表文章</h1>
    <span class="error">${requestScope.errorMessage}</span>
    <p style="color: grey">文章分类、标题</p>
    <div style="margin-bottom: 5px;">
        <select name="categoryId">
            <option value="2">热点</option>
            <option value="3">科技</option>
            <option value="4">搞笑</option>
            <option value="5">娱乐</option>
            <option value="6">游戏</option>
            <option value="7">体育</option>
            <option value="8">动漫</option>
            <option value="9">电影</option>
            <option value="10">汽车</option>
            <option value="11">军事</option>
            <option value="12">故事</option>
            <option value="13">财经</option>
            <option value="14">段子</option>
        </select>&nbsp;
        <input type="text" id="headline" name="headline" maxlength="30" required data-msg-required="请输入文章标题" style="width: 630px">
    </div>
    <p style="color: grey">文章内容</p>
    <!--style给定宽度可以影响编辑器的最终宽度-->
        <script type="text/plain" id="myEditor" name="content">
            <p style="color: grey">文章里的第一张图片将作为你的封面图</p>
        </script><br>
        <button class="btn btn-primary btn-lg" type="submit">发表文章</button>
</form>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${root}/js/jquery.validate.js"></script>
<script>
    var um = UM.getEditor('myEditor');
    $(function(){
        $("#edit").validate({
            submitHandler: function() {
                this.submit();
            }
        });
        $("#myEditor").bind("focus", clean = function () {
            $(this).text("");
            $(this).unbind("focus", clean);
        })
    });
</script>
</body>
</html>
