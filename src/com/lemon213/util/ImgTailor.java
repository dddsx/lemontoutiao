package com.lemon213.util;


import com.lemon213.pojo.ImgData;
import com.sun.scenario.effect.ImageData;
import sun.applet.Main;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Iterator;

public class ImgTailor {
    public static void cutImage(InputStream in, OutputStream out, ImgData imgData, String readImageFormat, String writeImageFormat) throws IOException {
        Iterator iterator = ImageIO.getImageReadersByFormatName(readImageFormat);
        ImageReader reader = (ImageReader) iterator.next();
        ImageInputStream iis = ImageIO.createImageInputStream(in);
        reader.setInput(iis, true);
        ImageReadParam param = reader.getDefaultReadParam();
        Rectangle rect = new Rectangle(imgData.getX(), imgData.getY(), imgData.getWidth(), imgData.getHeight());
        param.setSourceRegion(rect);
        BufferedImage bi = reader.read(0, param);
        ImageIO.write(bi, writeImageFormat, out);
    }

    public static void main(String[] args) throws Exception {

    }
}
