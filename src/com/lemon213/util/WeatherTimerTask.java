package com.lemon213.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletContext;
import java.util.TimerTask;

public class WeatherTimerTask extends TimerTask{
    private ServletContext application;

    public void setApplication(ServletContext application) {
        this.application = application; //通过监听器将这个application对象set进来，因为这里是无法拿application对象的
    }

    @Override
    public void run() {
        String weather = WeatherAPI.getJSON("宾阳县");
        JSONObject json = JSON.parseObject(weather);
        String city = (String) json.get("city");
        JSONObject data = (JSONObject) json.get("data");
        String wendu = (String) data.get("wendu");
        application.setAttribute("weather", city + " : " + wendu + "℃");
    }
}
