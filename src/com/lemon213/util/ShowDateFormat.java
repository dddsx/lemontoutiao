package com.lemon213.util;


import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author xiaobu
 * @describe 时间格式化工具类, 使时间能够个性化的在网页上显示
 */
public class ShowDateFormat {
    public static String format(Date date){
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
}
