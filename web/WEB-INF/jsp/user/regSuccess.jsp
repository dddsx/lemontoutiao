<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
    <script type="text/javascript">
        function countDown(sec, link){
            var jumpTo = document.getElementById('jumpTo');
            jumpTo.innerHTML=sec;
            if(--sec>0){
                setTimeout("countDown("+sec+",'"+link+"')",1000);
            }
            else{
                window.location.href =  link;
            }
        }
    </script>
</head>
<body>
<h2>注册成功,欢迎您的到来!</h2>
<a href="login"><span id="jumpTo">5</span>秒后系统跳转到登录界面，也可点击直接跳转</a>
<script type="text/javascript">
    countDown(5, 'login');
</script>
</body>
</html>
