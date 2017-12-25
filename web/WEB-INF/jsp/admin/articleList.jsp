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
        .article-table{
            width: 1200px;
            margin: 0 auto;
        }
        h3{
            text-align: center;
        }
        table{
            text-align: center;
        }
        th{
            text-align: center;
        }
        td{
            height: 42px;
            word-wrap: break-word;
            word-break: break-all;
            overflow: hidden;
        }
        .page{
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<h3>文章审核</h3>
<div class="article-table">
    <div class="search" style="margin-bottom: 10px">
        文章类型:
        <select name="category" class="category">
            <option value="all">全部</option>
            <option value="1">推荐</option>
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
        是否已审核:
        <select name="isCheck" class="isCheck">
            <option value="all">全部</option>
            <option value="0">否</option>
            <option value="1">是</option>
        </select>&nbsp;
        <input id="query" type="button" value="查询">
    </div>
    <table border="1">
        <tr>
            <th width="80px">id</th>
            <th width="300px">标题</th>
            <th width="150px">作者</th>
            <th width="70px">类别</th>
            <th width="150px">发表时间</th>
            <th width="150px">修改时间</th>
            <th width="70px">是否审核</th>
            <th width="70px">审核人</th>
            <th width="200px">操作</th>
        </tr>
        <c:forEach var="article" items="${requestScope.pageInfo.dataList}">
        <tr>
            <td>${article.id}</td>
            <td height="10px">
                <a href="${root}/admin/articleView?id=${article.id}" target="_blank">${article.headline}</a>
            </td>
            <td>${article.user.nickname}</td>
            <td>${article.category}</td>
            <td><fmt:formatDate value="${article.gmtCreate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            <td><fmt:formatDate value="${article.gmtModified}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            <td>
                <c:if test="${article.isCheck == true}">是</c:if>
                <c:if test="${article.isCheck == false}">否</c:if>
            </td>
            <td>${article.checker.username}</td>
            <td>
                <c:if test="${article.isCheck == true}">
                    <a href="${root}/admin/articleCheck?articleId=${article.id}&&isCheck=false" onclick="return agree('下架后, 文章对用户将不可见')">下架</a><span> | </span>
                </c:if>
                <c:if test="${article.isCheck == false}">
                    <a href="${root}/admin/articleCheck?articleId=${article.id}&&isCheck=true" onclick="return agree('通过审核后, 文章将正式对用户可见')">通过审核</a><span> | </span>
                </c:if>
                <c:if test="${article.isRecom == true}">
                    <a href="${root}/admin/articleRecom?articleId=${article.id}&&isRecom=false" onclick="return agree('移出推荐后, 文章将从推荐板块中消失')">移出推荐</a><span> | </span>
                </c:if>
                <c:if test="${article.isRecom == false}">
                    <a href="${root}/admin/articleRecom?articleId=${article.id}&&isRecom=true" onclick="return agree('推荐后, 文章将编入推荐板块')">推荐</a><span> | </span>
                </c:if>
                <a href="${root}/admin/articleDelete?articleId=${article.id}" onclick="return agree('确定删除该篇文章？')">删除</a>
            </td>
        </tr>
        </c:forEach>
    </table>

    <!-- 分页 -->
    <div class="page">
        <a href="${root}/admin/articleList?page=0&&isCheck=${requestScope.isCheck}&&category=${requestScope.category}">首页</a>
        <c:if test="${requestScope.pageInfo.requestPage > 1}">
        <a href="${root}/admin/articleList?page=${requestScope.pageInfo.requestPage-1}&&isCheck=${requestScope.isCheck}&&category=${requestScope.category}">上一页</a>
        </c:if>
        第 ${requestScope.pageInfo.requestPage} 页
        <c:if test="${requestScope.pageInfo.requestPage < requestScope.pageInfo.totalPage}">
        <a href="${root}/admin/articleList?page=${requestScope.pageInfo.requestPage+1}&&isCheck=${requestScope.isCheck}&&category=${requestScope.category}">下一页</a>
        </c:if>
        共 ${requestScope.pageInfo.totalPage} 页
    </div>

    <!-- 隐藏表单 -->
    <input type="hidden" name="getCategory" value="${requestScope.category}">
    <input type="hidden" name="isCheck" value="${requestScope.isCheck}">
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script>
    $(function(){
        var category = $("input[name='getCategory']").val();
        console.log(category);
        if(category === ''){
            $(".category").val("all");
        } else {
            $(".category").val(category);
        }
        var isCheck = $("input[name='isCheck']").val();
        console.log(isCheck);
        if(isCheck === ''){
            $(".isCheck").val("all");
        } else {
            $(".isCheck").val(isCheck);
        }
        $("#query").click(query)
    });

    function query() {
        var category = $(".category").val();
        var isCheck = $(".isCheck").val();
        if(category === "all")
            category = "";
        if(isCheck === "all")
            isCheck = "";
        console.log(category +" " + isCheck);
        window.location.href = "${root}" + "/admin/articleList?page=1&&category="+category+"&&isCheck="+isCheck;
    }

    function agree(message){
        return confirm(message);
    }
</script>
</body>
</html>
