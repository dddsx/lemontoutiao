<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="root" />
<div style="font-size: 16px;background-color:#f4f5f6;width:100%;height: 25px;padding-right: 30px">
    <div style="float: right">欢迎您，管理员<span>${sessionScope.sessionAdmin.nickname}</span>&nbsp;<a href="#">注销</a></div>
</div>