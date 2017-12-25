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
            padding:0px 20px;
        }
       .ibox-content{
            float: left;
            margin-top: 20px;
        }
        .personal-photo {
            width: 214px;
            height: 214px;
        }
        .person-info{
            padding-top: 20px;
            padding-left: 240px;
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
            font-family: 'Microsoft YaHei', serif;
            font-size: 17px;
            padding-left: 20px;
        }
        .popover-content{
            color: #d9534f;
            font-size: 17px;
        }
        .myArticle{
            list-style: none;
            position: relative;
        }
        .writeTime{
            position: absolute;
            right: 50px;
        }
        .check_status{
            position: absolute;
            right: 200px;
        }
        .h2{
            margin-bottom: 25px;
        }
    </style>
</head>
<body>
<!-- 动态引入导航条 -->
<jsp:include page="../lib/navbar.jsp"/>

<input id="get-gender" type="hidden" value="${requestScope.user_message.gender}">

<!-- 头像修改模态框 -->
<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form class="avatar-form" action="${root}/user/imgUpload" enctype="multipart/form-data" method="post">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal" type="button">&times;</button>
                    <h4 class="modal-title" id="avatar-modal-label">修改头像</h4>
                </div>
                <div class="modal-body">
                    <div class="avatar-body">
                        <div class="avatar-upload">
                            <input class="avatar-src" name="avatar_src" type="hidden">
                            <input class="avatar-data" name="avatar_data" type="hidden">
                            <label for="avatarInput">使用正规头像格式，不超过2M，保证截取框在图片内</label>
                            <input class="avatar-input" id="avatarInput" name="avatar_file" type="file">
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="avatar-wrapper"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="avatar-preview preview-lg"></div>
                                <div class="avatar-preview preview-md"></div>
                                <div class="avatar-preview preview-sm"></div>
                            </div>
                        </div>
                        <div class="row avatar-btns">
                            <div class="col-md-9">
                                <div class="btn-group">
                                    <button class="btn" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"><i class="fa fa-undo"></i> 向左旋转</button>
                                </div>
                                <div class="btn-group">
                                    <button class="btn" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"><i class="fa fa-repeat"></i> 向右旋转</button>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-success btn-block avatar-save" type="submit"><i class="fa fa-save"></i> 保存修改</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 用户资料修改模态框 -->
<div id="change-message" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title">修改资料</h3>
            </div>
            <div class="modal-body">
                <form id="message-form" class="form-horizontal" action="${root}/user/change_message" method="post">
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
                        <label>生日:&nbsp;&nbsp;</label><input id="birthday" name="birthday" style="height: 29px" class="Wdate" type="text" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" value="<fmt:formatDate value="${requestScope.user_message.birthday}" pattern="yyyy-MM-dd"/>">&nbsp;&nbsp;&nbsp;
                        <label>地区:&nbsp;&nbsp;&nbsp;</label><input id="location" name="location" type="text" maxlength="30" value="${requestScope.user_message.location}"/>
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
        <div id="headPic" class="ibox-content">
            <div id="crop-avatar">
                <div class="avatar-view" title="点击修改头像">
                    <img class="personal-photo" src="${root}/${headPicPath}/${sessionScope.sessionUser.picName}"
                         alt="???">
                </div>
            </div>
        </div>
        <dl class="person-info">
            <dt class="h2">${requestScope.user_message.nickname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a style="cursor: pointer" data-toggle="modal" data-target="#change-message"><span class="glyphicon glyphicon glyphicon-pencil"></span></a>
                &nbsp;<a id="errorWin" tabindex="0" data-toggle="popover" data-trigger="focus" data-content="${requestScope.errorMessage}"></a></dt>
            <dd style="font-size: 17px;">
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
                    <c:when test="${!empty requestScope.user_message.birthday}">
                        <fmt:formatDate value="${requestScope.user_message.birthday}" pattern="yyyy-MM-dd"/>
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
            <li role="presentation" class="active"><a class="person-menu" href="#my_article" role="tab" data-toggle="tab">我的文章</a></li>
            <li role="presentation"><a class="person-menu" href="#my_history"  role="tab" data-toggle="tab">阅读历史</a></li>
            <li role="presentation"><a class="person-menu" href="#my_collect"  role="tab" data-toggle="tab">我的收藏</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="my_article" style="margin-bottom: 50px">
                <hr>
                <ul id="myArticle" class="myArticle">
                    <c:forEach var="article" items="${requestScope.articleList}">
                        <li class="articleList">
                            <a href="${root}/updateArticleForm?articleId=${article.id}">${article.headline}</a>
                            <span class="check_status">
                                <c:if test="${article.isCheck == true}">已审核</c:if>
                                <c:if test="${article.isCheck == false}">未审核</c:if>
                            </span>
                            <span class="writeTime"><fmt:formatDate value="${article.gmtCreate}" pattern="yyyy-MM-dd" /></span>
                        </li>
                        <hr>
                    </c:forEach>
                </ul>
                <div class="text-center" style="background-color:hsla(0,0%,71%,.1);padding-right: 20px">
                    <a id="reload" role="button" style="color: #5e5e5e;font-size: 18px">加载更多</a>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="my_history">
                暂未开放
            </div>
            <div role="tabpanel" class="tab-pane" id="my_collect">
                暂未开放
            </div>
        </div>
    </div>
</div>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${root}/op-plugin/My97DatePicker/WdatePicker.js"></script>
<link href="${root}/op-plugin/jquery-html5-upload/cropper/cropper.min.css" rel="stylesheet">
<link href="${root}/op-plugin/jquery-html5-upload/sitelogo/sitelogo.css" rel="stylesheet">
<script src="${root}/op-plugin/jquery-html5-upload/cropper/cropper.min.js"></script>
<script src="${root}/op-plugin/jquery-html5-upload/sitelogo/sitelogo.js"></script>
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

        //加载文章
        var page = 1;
        $("#reload").click(function () {
            $(this).text("请稍后...");
            page++;
            loadArticle(page);
            console.log("向后台请求第:" + page +"页");
        })
    });

    function formatDate(date) {
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? '0' + m : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        return y + '-' + m + '-' + d;
    }

    function loadArticle(page) {
        $.ajax({
            type: "post",
            url:"moreArticle",
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify({
                page : page
            }),
            success:function (data) {
                console.log(JSON.stringify(data));
                if(data.message  === "loading") {
                    var $articleTable = $("#myArticle");
                    $.each(data.articleList, function (i, item) {
                        var check;
                        var date = new Date(item.gmtCreate);
                        var showDate = formatDate(date);
                        if(item.isCheck === true)
                            check = "已审核";
                        else
                            check = "未审核";
                        $articleTable.append('<li class="articleList">' +
                            '<a href="../updateArticleForm?articleId=' + item.id + '">' + item.headline + '</a>' +
                            '<span class="check_status">' + check +'</span>' +
                            '<span class="writeTime">' + showDate + '</span>' +
                            '</li>' +
                            '<hr>'
                        )
                    });
                    $("#reload").text("加载更多");
                } else if(data.message === "noMoreArticle"){
                    $("#reload").text("暂时没有了").unbind();
                }
            },
            error:function () {
                alert("服务器异常，请联系开发人员");
            }
        });
    }
</script>
</body>
</html>
