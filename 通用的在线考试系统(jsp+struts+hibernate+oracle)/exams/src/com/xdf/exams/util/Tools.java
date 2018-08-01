package com.xdf.exams.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Tools {
	public static String d2sshort(Date d) {
		if(d==null)
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(d);
	}
	public static Date s2dshort(String d) {
		if(d==null||d.equals(""))
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return sdf.parse(d);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}	
	public static String d2slong(Date d) {
		if(d==null)
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(d);
	}
	public static Date s2dlong(String d) {
		if(d==null||d.equals(""))
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.parse(d);
		} catch (ParseException e) {
			return null;
		}
	}		
	public static String[] tostringarray(String s) {
		if(s==null)
			return null;
		char[] cs = s.toCharArray();//ABC  A B C
		String[] ss = new String[cs.length];
		for (int i=0;i<cs.length;i++) {
			ss[i] = String.valueOf(cs[i]);
		}
		return ss;
	}
	public static String filtHTML(String str) {
		if(str==null)
			return "";
		StringBuffer sb = new StringBuffer();
		for (int i=0;i<str.length();i++) {
			char a = str.charAt(i);
			switch(a) {
			case '<':
				sb.append("&lt;");
			break;
			case '>':
				sb.append("&gt;");
			break;	
			case '&':
				sb.append("&amp;");
			break;	
			case '"':
				sb.append("&quot;");
			break;
			case ' ':
				sb.append("&nbsp;");
			break;
			case '\n':
				sb.append("<br>");
			break;	
			default:
				sb.append(a);
			}
		}
		return sb.toString();
	}
}
