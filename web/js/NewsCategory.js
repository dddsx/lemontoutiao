$(function(){
    addLeftNavStyle();
    var page = 1;
    var category = $("#category").val();
    $(".reload").click(function () {
        $(this).text("请稍后...");
        page++;
        loadNews(category, page.toString());
        console.log("向后台请求第:" + page +"页");
    })
});

function addLeftNavStyle() {
    var category =$("#category").val();
    if(category > 10) {
        var more = $("a[category=0]");
        more.removeClass("point");
        more.parent().addClass("active");
        more.children().removeClass("list").addClass("chose");
    }
    var chose = $("a[category=" + category + "]");
    chose.parent().addClass("active");
    chose.children().removeClass("list").addClass("chose");
    chose.removeClass("point");

    var point = $(".point");
    point.bind("mouseover",function () {
        $(this).parent().addClass("active");
        $(this).children().removeClass("list").addClass("chose");
    });
    point.bind("mouseout",function () {
        $(this).parent().removeClass("active");
        $(this).children().removeClass("chose").addClass("list");
    });
}

function loadNews(category, page) {
    $.ajax({
        type: "post",
        url: "/article/reloadNews",
        dataType: 'json',
        contentType: "application/json",
        data: JSON.stringify({
            category : category,
            page : page
        }),
        success:function (data) {
            console.log(JSON.stringify(data));
            if(data.message  === "loading") {
                var $newsTable = $("#news-table").children();
                $.each(data.articleList, function (i, item) {
                    $newsTable.append('<tr class="news-list"><td><div class="picture">' +
                        '<a href=' + '/view/' + item.id + ' target="_blank"><img class="cover-img" src=' + '/img/cover/' + item.cover +'></a>'+
                        '</div></td><td>' +
                        '<div class="headline"><a class="headline-font" href=' + '/view/' + item.id + ' target="_blank"><p>'+ item.headline+ '</p></a>' +
                        '</div> <div class="other-info text-right">' + item.user.nickname + ' · ' + item.user.commentNum + '评论' +
                        ' · ' + item.showTime + '</div> </td></tr>'
                    )
                });
                $(".reload").text("加载更多");
            } else if(data.message === "noMoreNews"){
                $(".reload").text("暂时没有了").unbind();
            }
        },
        error:function () {
            alert("服务器异常，请联系开发人员");
        }
    });
}
