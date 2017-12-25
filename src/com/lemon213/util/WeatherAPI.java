package com.lemon213.util;


import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

public class WeatherAPI {
    public static String getJSON(String city){
        try {
            //参数url化
            city = java.net.URLEncoder.encode(city, "utf-8");
            //拼地址
            String apiUrl = String.format("http://www.sojson.com/open/api/weather/json.shtml?city=%s",city);
            //开始请求
            URL url= new URL(apiUrl);
            URLConnection open = url.openConnection();
            InputStream input = open.getInputStream();
            //这里转换为String，带上包名，怕你们引错包
            return org.apache.commons.io.IOUtils.toString(input,"utf-8");
        } catch (IOException e) {
            return null;
        }
    }

    public static void main(String[] args){
        System.out.println(getJSON("宾阳县"));
    }
}
