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
    <script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="${root}/css/navbar.css" rel="stylesheet">
    <link href="${root}/css/editor.css" rel="stylesheet">
</head>
<body>
<!-- 动态引入导航条 -->
<jsp:include page="../lib/navbar.jsp"/>
<div class="container">
    <form id="edit" action="${root}/updateArticle" method="post">
        <input type="hidden" name="id" value="${requestScope.article.id}">
        <h1 class="text-center" style="padding-right: 90px">修改文章</h1>
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
                <option value="15">美文</option>
                <option value="16">文化</option>
                <option value="17">探索</option>
                <option value="18">美食</option>
            </select>&nbsp;
            <input type="text" id="headline" name="headline" value="${requestScope.article.headline}" maxlength="30" style="width: 630px">&nbsp;
        </div>
        <p style="color: grey">文章内容</p>
        <script type="text/plain" id="myEditor" name="content">
        </script><br>
        <div style="padding-right: 100px">
            <div style="width:250px;margin: 0 auto">
                <button id="submit" class="btn btn-primary btn-lg">修改文章</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="${root}/deleteArticle?articleId=${requestScope.article.id}" class="btn btn-danger btn-lg" onclick="return agree('删除文章后，将不可恢复')">删除文章</a>
            </div>
        </div>
    </form>
</div>
<script>
    var um = UM.getEditor('myEditor');
    $(function(){
        um.setContent('${requestScope.article.content}');
        $("select[name='categoryId']").val(${requestScope.article.categoryId});
        $("#submit").click(function () {
            var headline = $("#headline").val();
            var content = um.getContent();
            if(headline === null || headline === ""){
                alert("请输入标题");
                return false;
            }
            if(content === null || content === ""){
                alert("文章内容不能为空！");
                return false
            }
            return true;
        });
    });

    function agree(message){
        return confirm(message);
    }
</script>
</body>
</html>
