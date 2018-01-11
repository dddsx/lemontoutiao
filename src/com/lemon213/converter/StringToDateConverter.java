package com.lemon213.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

// 实现Converter<S,T>接口, 编写字符串转Date类型的转换器
public class StringToDateConverter implements Converter<String, Date>{

	private String datePattern = "yyyy-MM-dd";
	
	public void setDatePattern(String datePattern) {
		this.datePattern = datePattern;
	}

	@Override
	public Date convert(String date) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat(this.datePattern);
			// 将日期字符串转换成Date类型返回
			return dateFormat.parse(date);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("日期转换失败!");
			return null;
		}
	}
}
