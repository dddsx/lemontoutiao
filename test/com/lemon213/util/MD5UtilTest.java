package com.lemon213.util;


import org.junit.Test;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5UtilTest {

    @Test
    public void testGenerateMD5(){
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update("5953805".getBytes());
            byte[] bs = md.digest();
            StringBuilder sb = new StringBuilder(40);
            for(byte x:bs) {
                if((x & 0xff)>>4 == 0) {
                    sb.append("0").append(Integer.toHexString(x & 0xff));
                } else {
                    sb.append(Integer.toHexString(x & 0xff));
                }
            }
            System.out.println(sb.toString());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
}
