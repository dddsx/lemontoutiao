package com.lemon213.util;

import java.io.InputStream;
import java.util.Properties;

/**
 * @author xiaobu
 * @describe 管理、获取各类图片的路径
 */
public class FilePathManager {
    private static Properties prop  = null;
    static {
        try {
            InputStream inStream = FilePathManager.class.getClassLoader().getResourceAsStream("filePath.properties");
            prop = new Properties();
            prop.load(inStream);
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public static String getHeadPicPath(){
        return prop.getProperty("headPicPath");
    }
}
