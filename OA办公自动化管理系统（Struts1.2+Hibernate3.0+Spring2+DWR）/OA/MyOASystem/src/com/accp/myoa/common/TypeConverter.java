package com.accp.myoa.common;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TypeConverter {
	public static Date getStringDate(String dateStr) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = format.parse(dateStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public static Date getStringDate(String dateStr,String strformat){
		DateFormat format = new SimpleDateFormat(strformat);
		Date date = null;
		try {
			date = format.parse(dateStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public String getUser(String str){
		System.out.println(str);
		return str+"aa";
	}
}
