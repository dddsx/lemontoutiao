<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragrma","no-cache");
        response.setDateHeader("Expires",0);
    %>
    <%@ include file="/public/head.jspf" %>
    <c:set value="${applicationScope.headPicPath}" var="headPicPath" />
    <link href="${root}/css/navbar.css" rel="stylesheet">
    <style>
        body{
            background-color:#f1f1f1;
        }
        dd{
            display: block;
        }
        .container{
            width: 1100px !important;
            background-color:white;
            padding: 0px;
            margin-top: 70px;
        }
        .personal-property{
            padding:0px 40px;
        }
        .photo-container{
            float: left;
        }
        .personal-photo{
            margin-top: 20px;
            width: 180px;
            height: 180px;
        }
        .focus_num{
            font-size: 16px;
            margin-top: 10px;
            width: 90px;
            height: 32px;
            display: block;
            float: left;
            border-right: 1px solid #EDEDED;
        }
        .fans_num{
            font-size: 16px;
            margin-top: 10px;
            width: 90px;
            height: 32px;
            display: block;
            float: left;
        }
        .person-info{
            padding-top: 20px;
            padding-left: 200px;
        }
        .person-info span{
            color: #999;
        }
        .person-intro{
            overflow: hidden;
            font-size: 17px;
            color:lightslategray;
            border-top: 1px solid #f0f0f0;
            padding-top: 8px;
            margin-top: 15px;
            line-height: 22px;
            word-wrap: break-word;
            word-break: break-all;
        }
        .person-medal{
            color: dimgray;
            font-size: 16px;
            margin-top: 20px;
        }
        .person-medal span{
            color: #999;
        }
        .personal-section{
            margin-top: 1px;
        }
        .person-menu{
            font-size: 17px;
            width: 200px !important;
            text-align: center;
            color: #474747;
        }
        #message-form{
            line-height: normal;
            font-family: 'Microsoft YaHei';
            font-size: 17px;
            padding-left: 20px;
        }
        .popover-content{
            color: #d9534f;
            font-size: 17px;
        }
    </style>
</head>
<body>
<!-- 动态引入导航条 -->
<jsp:include page="../lib/navbar.jsp"/>

<input id="get-gender" type="hidden" value="${requestScope.user_message.gender}">
<!-- 用户资料修改模态框 -->
<div id="change-message" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">修改资料</h3>
            </div>
            <div class="modal-body">
                <form id="message-form" class="form-horizontal" action="${root}/user/change_message" enctype="multipart/form-data" method="post">
                    <div class="form-group">
                        <label>用户名:&nbsp;&nbsp;</label><input type="text"  value="${requestScope.user_message.username}" disabled/>&nbsp;&nbsp;&nbsp;
                        <label><span style="color: red">*</span>昵称:&nbsp;&nbsp;</label><input id="nickname" name="nickname" type="text" maxlength="20" value="${requestScope.user_message.nickname}"/>&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="form-group">
                        <label>职位:&nbsp;&nbsp;</label><input id="job" name="job" type="text" maxlength="15" value="${requestScope.user_message.job}"/>&nbsp;&nbsp;&nbsp;
                        <label>性别:&nbsp;&nbsp;&nbsp;</label><input id="gender" name="gender" type="radio" value="M"/>男&nbsp;&nbsp;
                        <input name="gender" type="radio" value="F"/>女&nbsp;&nbsp;
                        <input name="gender" type="radio" value="N"/>未知
                    </div>
                    <div class="form-group">
                        <label>生日:&nbsp;&nbsp;</label><input id="birthday" name="birthday" style="height: 29px" class="Wdate" type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" value="${requestScope.birthday}">&nbsp;&nbsp;&nbsp;
                        <label>地区:&nbsp;&nbsp;&nbsp;</label><input id="location" name="location" type="text" maxlength="30" value="${requestScope.user_message.location}"/>
                    </div>
                    <div class="form-group">
                        <label>修改头像:&nbsp;&nbsp;</label><input type="file" name="headPic">
                    </div>
                    <div class="form-group">
                        <label style="display: block;">个性签名:&nbsp;&nbsp;</label><textarea id="introduce" name="introduce" style="width: 400px;height: 80px;" maxlength="50">${requestScope.user_message.introduce}</textarea>&nbsp;&nbsp;&nbsp;
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
                <button id="save" type="button" class="btn btn-danger">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 用户信息表单 -->
<div class="container">
    <div class="personal-property">
        <dl class="photo-container">
            <dt><img class="personal-photo" src="${root}/${headPicPath}/${sessionScope.sessionUser.picName}"></dt>
            <dd class="focus_num text-center"><a href="#" onclick="{alert('敬请期待!')}">关注:0</a></dd>
            <dd class="fans_num text-center"><a href="#" onclick="{alert('敬请期待!')}">粉丝:0</a></dd>
        </dl>
        <dl class="person-info">
            <dt class="h2">${requestScope.user_message.nickname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a style="cursor: pointer" data-toggle="modal" data-target="#change-message"><span class="glyphicon glyphicon glyphicon-pencil"></span></a>
                &nbsp;<a id="errorWin" tabindex="0" data-toggle="popover" data-trigger="focus" data-content="${requestScope.errorMessage}"></a></dt>
            <dd style="font-size: 17px;margin-top: 15px">
                <c:choose>
                    <c:when test="${!empty requestScope.user_message.job}">${requestScope.user_message.job}</c:when>
                    <c:otherwise>未填写职位</c:otherwise>
                </c:choose>
                    <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                <c:choose>
                    <c:when test="${!empty requestScope.user_message.location}">${requestScope.user_message.location}</c:when>
                    <c:otherwise>未填写地区</c:otherwise>
                </c:choose>
                <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                <c:choose>
                    <c:when test="${!empty requestScope.birthday}">
                        ${requestScope.birthday}
                    </c:when>
                    <c:otherwise>未填写生日</c:otherwise>
                </c:choose>
                <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                <c:choose>
                    <c:when test="${requestScope.user_message.gender == 'M'}">男</c:when>
                    <c:when test="${requestScope.user_message.gender == 'F'}">女</c:when>
                    <c:otherwise>未知性别</c:otherwise>
                </c:choose>
            </dd>
            <dd class="person-intro">
                <c:choose>
                    <c:when test="${!empty requestScope.user_message.introduce}">${requestScope.user_message.introduce}</c:when>
                    <c:otherwise>这家伙很懒，什么都没留下</c:otherwise>
                </c:choose>
            </dd>
            <dd class="person-medal">
                ${requestScope.user_message.money}<span><a href="#" style="color: darkorange"> 柠檬币</a></span><span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>奖章:
            </dd>
        </dl>
    </div>
    <div style="margin-top:50px;background-color: #f1f1f1"><br></div>
    <div class="personal-section">
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a class="person-menu" href="#my_active"  role="tab" data-toggle="tab">我的动态</a></li>
            <li role="presentation"><a class="person-menu" href="#my_hobby" role="tab" data-toggle="tab">我的喜好</a></li>
            <li role="presentation"><a class="person-menu" href="#my_article" role="tab" data-toggle="tab">我的文章</a></li>
            <li role="presentation"><a class="person-menu" href="#my_video" role="tab" data-toggle="tab">我的视频</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="my_active">
                我的动态。。。
            </div>
            <div role="tabpanel" class="tab-pane" id="my_hobby">
                我的喜好。。。
            </div>
            <div role="tabpanel" class="tab-pane" id="my_article">
                我的文章。。。
            </div>
            <div role="tabpanel" class="tab-pane" id="my_video">
                我的视频。。。
            </div>
        </div>
    </div>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${root}/op-plugin/My97DatePicker/WdatePicker.js"></script>
<script>
    $(function(){
        $("#save").click(function () {
            $("#message-form").submit();
        });
        var errorWin = $('#errorWin').popover();
        errorWin.popover('show');
        setInterval(hide, 3000);
        function hide()
        {
            errorWin.popover('hide');
        }
        var gender = $("#get-gender").val();
        $("input[value= "+gender+"]").attr("checked", 'true');
    });
</script>
</body>
</html>
