<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="path" />
<html>
<head>
    <title>Title</title>
    <style>
        .img-container{
            padding-top: 130px;
            margin-left: auto;
            margin-right: auto;
            width: 600px;
            height: 372px;
        }
    </style>
</head>
<body>
    <div class="img-container">
        <img src="${path}/img/materia/404.jpg" class="img">
    </div>
</body>
</html>
