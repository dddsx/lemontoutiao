package com.lemon213.util;

import java.io.InputStream;
import java.util.Properties;

/**
 * @author xiaobu
 * @describe 管理、获取各类图片的路径
 */
public class FilePathManager {
    private static String headPicPath;
    private static String coverPath;
    static {
        try {
            InputStream inStream = FilePathManager.class.getClassLoader().getResourceAsStream("filePath.properties");
            Properties prop = new Properties();
            prop.load(inStream);
            headPicPath = prop.getProperty("headPicPath");
            coverPath = prop.getProperty("coverPath");
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public static String getHeadPicPath(){return headPicPath;}

    public static String getCoverPath(){return coverPath;}
}
