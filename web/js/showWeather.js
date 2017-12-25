$(function() {
    $.ajax({
        type: "get",
        url: "/getWeather",
        contentType: "application/json",
        success: function (data) {
            console.log(JSON.stringify(data));
            var jsondata = $.parseJSON(data);
            var $weather = $("#weather");
            if(jsondata.status === 200) {
                $weather.append(jsondata.city + " : " + jsondata.data.wendu + "℃");
            } else if(jsondata.status === 304){
                $weather.append("调用频繁，请稍后再刷新页面显示天气");
            } else{
                $weather.append("暂时不能加载天气信息");
            }
        },
        error: function () {
            $("#weather").append("暂时不能加载天气信息");
        }
    })
});


