package com.lemon213.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class DataFormatUtil {

    private static final Map<Integer, String> categoryMap = new HashMap<>();
    static {
        categoryMap.put(1, "推荐");
        categoryMap.put(2, "热点");
        categoryMap.put(3, "科技");
        categoryMap.put(4, "搞笑");
        categoryMap.put(5, "娱乐");
        categoryMap.put(6, "游戏");
        categoryMap.put(7, "体育");
        categoryMap.put(8, "动漫");
        categoryMap.put(9, "电影");
        categoryMap.put(10, "汽车");
        categoryMap.put(11, "军事");
        categoryMap.put(12, "故事");
        categoryMap.put(13, "经济");
        categoryMap.put(14, "段子");
        categoryMap.put(15, "美文");
        categoryMap.put(16, "文化");
        categoryMap.put(17, "探索");
        categoryMap.put(18, "美食");
    }

    public static String dateFormat(Date date){
        Date now = new Date();
        long millisec = now.getTime() - date.getTime();
        if(millisec < 0){
            return "异常日期";
        }
        int hour = (int) (millisec/(1000*60*60));
        if(hour < 1){
            return "刚刚";
        } else if(hour < 24){
            return hour+"小时前";
        }
        int day = hour/24;
        if(day < 31){
            return day+"天前";
        } else if(day < 60){
            return "一月前";
        } else {
            return new SimpleDateFormat("yyyy-MM-dd").format(date);
        }
    }

    public static String articleCategoryToZH(int categoryId){
        return categoryMap.get(categoryId);
    }
}
