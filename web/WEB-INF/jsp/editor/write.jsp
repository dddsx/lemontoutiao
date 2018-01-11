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
    <link href="${root}/css/editor.css" rel="stylesheet">
    <script src="${root}/op-plugin/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${root}/op-plugin/upload_img/plugins/cover_js/iscroll-zoom.js" type="text/javascript" charset="utf-8"></script>
    <script src="${root}/op-plugin/upload_img/plugins/cover_js/hammer.js" type="text/javascript" charset="utf-8"></script>
    <script src="${root}/op-plugin/upload_img/plugins/cover_js/lrz.all.bundle.js" type="text/javascript" charset="utf-8"></script>
    <script src="${root}/op-plugin/upload_img/plugins/cover_js/jquery.photoClip.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!-- 动态引入导航条 -->
<jsp:include page="../lib/navbar.jsp"/>
<div class="container">
<form id="edit" action="${root}/commitArticle" method="post">
    <input type="hidden" id="cover" name="cover" value="">
    <h1 class="text-center" style="padding-right: 90px">发表文章</h1>
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
        <input type="text" id="headline" name="headline" maxlength="30" style="width: 630px">&nbsp;
    </div>

    <!-- 封面上传 -->
    <p style="color: grey">文章封面图</p>
    <div class="cover-wrap"
         style="display:none;position:fixed;left:0;top:0;width:100%;height:100%;background: rgba(0, 0, 0, 0.4);z-index: 10000000;text-align:center;">
        <div class=""
             style="width:900px;height:600px;margin:100px auto;background-color:#FFFFFF;overflow: hidden;border-radius:4px;">
            <div id="clipArea" style="margin:10px;height: 520px;"></div>
            <div class="" style="height:56px;line-height:36px;text-align: center;padding-top:8px;">
                <button id="clipBtn" type="button"
                        style="width:120px;height: 36px;border-radius: 4px;background-color:#ff8a00;color: #FFFFFF;font-size: 14px;text-align: center;line-height: 36px;outline: none;">
                    保存封面
                </button>
            </div>
        </div>
    </div>
    <div id="view" style="width:160px;height:100px;" title="请上传160*100的封面图片"></div>
    <div style="height:10px;"></div>
    <div class="" style="margin-bottom:10px;width:140px;height:32px;border-radius: 4px;background-color:#ff8a00;color: #FFFFFF;font-size: 14px;text-align:center;line-height:32px;outline:none;position:relative;">点击上传封面图
        <input type="file" id="file" style="cursor:pointer;opacity:0;filter:alpha(opacity=0);width:100%;height:100%;position:absolute;top:0;left:0;">
    </div>

    <!-- 文章内容编写 -->
    <p style="color: grey">文章内容</p>
    <script type="text/plain" id="myEditor" name="content">
            <p style="color: grey">文章发表后，需经过管理员审核才能正式对读者可见，请注意以下几点：</p>
            <p style="color: grey">1.文章内容应绿色健康，不包含暴力、色情、反动等内容。(擦边球除外)<br>
2.上传封面时应避免过多挑选，以免浪费服务器空间。<br>
3.网站会话时间有限，如编辑长篇文章时，可以先发表，日后再进入个人空间继续进行删改。<br>
4.段子是不允许带有图片的<br>
5.原则上不允许发表水文。<br>
6.文章发表的时间间隔为5分钟。<br>
7.管理员有权删除违规文章。<br>
8.网站仅供娱乐，不保证用户的数据健全。
            </p>
    </script>
    <br>
    <!-- 提交按钮 -->
    <button id="submit" class="btn btn-primary btn-lg" type="submit">发表文章</button>
</form>
</div>
<script>
    var um = UM.getEditor('myEditor');
    $(function(){
        $("#myEditor").bind("focus", clean = function () {
            $(this).text("");
            $(this).unbind("focus", clean);
        });
        $("#submit").click(function () {
            var headline = $("#headline").val();
            var content = um.getContent();
            var cover = $("#cover").val();
            if(headline === null || headline === ""){
                alert("请输入标题");
                return false;
            }
            if(cover === null || cover === ""){
                alert("请上传封面图");
                return false;
            }
            if(content === null || content === ""){
                alert("文章内容不能为空！");
                return false;
            }
            return true;
        });
    });

    var clipArea = new bjj.PhotoClip("#clipArea", {
        size: [160, 100],// 截取框的宽和高组成的数组。默认值为[260,260]
        outputSize: [160, 100], // 输出图像的宽和高组成的数组。默认值为[0,0]，表示输出图像原始大小
        //outputType: "jpg", // 指定输出图片的类型，可选 "jpg" 和 "png" 两种种类型，默认为 "jpg"
        file: "#file", // 上传图片的<input type="file">控件的选择器或者DOM对象
        view: "#view", // 显示截取后图像的容器的选择器或者DOM对象
        ok: "#clipBtn", // 确认截图按钮的选择器或者DOM对象
        loadStart: function () {
            // 开始加载的回调函数。this指向 fileReader 对象，并将正在加载的 file 对象作为参数传入
            $('.cover-wrap').fadeIn();
            console.log("照片读取中");
        },
        loadComplete: function () {
            // 加载完成的回调函数。this指向图片对象，并将图片地址作为参数传入
            console.log("照片读取完成");
        },
        //loadError: function(event) {}, // 加载失败的回调函数。this指向 fileReader 对象，并将错误事件的 event 对象作为参数传入
        clipFinish: function (dataURL) {
            // 裁剪完成的回调函数。this指向图片对象，会将裁剪出的图像数据DataURL作为参数传入
            $('.cover-wrap').fadeOut();
            $('#view').css('background-size', '100% 100%');
            console.log(dataURL);
            uploadImg(dataURL);
        }
    });

    function uploadImg(dataURL) {
        $.ajax({
            url: '${root}/uploadArticleCover',
            type: "post",
            dataType: 'text',
            data: {dataURL: dataURL},
            success: function (data) {
                $("#cover").val(data);
                console.log(data);
            }
        });
    }
</script>
</body>
</html>
