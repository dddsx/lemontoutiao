<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="root" />
<div class="right-nav">
    <h4 class="text-center">友情链接</h4>
    <div style="padding-left: 30px">
        <a class="friend-link" href="http://www.sina.com.cn/" target="_blank">新浪网</a>&nbsp;&nbsp;&nbsp;
        <a class="friend-link" href="http://www.qq.com/" target="_blank">腾讯网</a>&nbsp;&nbsp;&nbsp;
        <a class="friend-link" href="http://www.sohu.com/" target="_blank">搜狐网</a>&nbsp;&nbsp;&nbsp;
        <a class="friend-link" href="https://www.csdn.net/" target="_blank">CSDN</a>&nbsp;&nbsp;&nbsp;
        <a class="friend-link" href="https://www.douyu.com/" target="_blank">斗鱼</a>&nbsp;&nbsp;&nbsp;
        <a class="friend-link" href="http://v3.bootcss.com/" target="_blank">bootstrap中文网</a>&nbsp;&nbsp;&nbsp;
        <a class="friend-link" href="http://www.w3school.com.cn/" target="_blank">w3school</a>&nbsp;&nbsp;&nbsp;
        <a class="friend-link" href="https://www.bilibili.com/" target="_blank">哔哩哔哩</a>&nbsp;&nbsp;&nbsp;<br>
        <a class="friend-link" href="http://www.jq22.com/" target="_blank">jQuery插件网</a>&nbsp;&nbsp;&nbsp;
        <a class="friend-link" href="https://github.com/" target="_blank">GitHub</a>&nbsp;&nbsp;&nbsp;
        <a class="friend-link" href="https://stackoverflow.com/" target="_blank">SOF</a>&nbsp;&nbsp;&nbsp;
        <a class="friend-link" href="https://www.twitch.tv/liganss6324" target="_blank">twitch</a>&nbsp;&nbsp;&nbsp;<br>
        <a class="friend-link" href="https://www.toutiao.com/" target="_blank">今日头条</a>&nbsp;&nbsp;&nbsp;
    </div>
</div>

<div class="right-nav">
    <h4 class="text-center">24小时热闻</h4>
</div>

<div class="right-nav company">
    <p>©  2017 柠檬头条网</p>
    <p>宾阳恰柠檬混吃等死有限公司</p>
    <p>违法和不良信息举报：010-58341833</p>
    <p><a href="http://www.12377.cn" style="color: #777">中国互联网不良信息举报中心</a></p>
    <p><a href="${root}/admin/login" style="color: #777">后台管理系统入口</a></p>
</div>
