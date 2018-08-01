package net.acai.util;
/**
 * Title:        清清网络
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      www.SuperSpace.com
 * @author:       SuperSpace
 * @version 1.0
 */
import net.acai.util.*;
import java.text.SimpleDateFormat;
import java.text.*;
import java.util.Date;

/**
 * Title:        清清网络
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      211.68.39.120、webcpu.51.net
 * @author SuperSpace
 * @version 1.0
 */

public class Format {

    public static String getDateTime()
    {
    	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	java.util.Date Now=new java.util.Date();
    	String NDate=formatter.format(Now);
    	return NDate;
    }
    public static String getStrDate(String DateString){
    	return DateString.substring(0,10);
    }

    	
    public static String getStrDateTime(){
    	return StringUtils.replace(StringUtils.replace(StringUtils.replace(getDateTime(),":",""),"-","")," ","");
    	}
    public static boolean compareTo(String  last,String now){
    	try{
    	   	DateFormat formatter=DateFormat.getDateInstance();
    		Date temp1=formatter.parse(last);
    		Date temp2=formatter.parse(now);
    		if(temp1.after(temp2))
    			return false;
    		else if(temp1.before(temp2))
    			return true;
    	}
    	catch(ParseException e)
    	{
    		e.printStackTrace();
    	}
    	return false;
    }

    /**
     * 字符串替换，将 source 中的 oldString 全部换成 newString
     *
     * @param source 源字符串
     * @param oldString 老的字符串
     * @param newString 新的字符串
     * @return 替换后的字符串
     */
    public static String Replace(String source, String oldString, String newString) {
        StringBuffer output = new StringBuffer();

        int lengthOfSource = source.length();   // 源字符串长度
        int lengthOfOld = oldString.length();   // 老字符串长度

        int posStart = 0;   // 开始搜索位置
        int pos;            // 搜索到老字符串的位置

        while ((pos = source.indexOf(oldString, posStart)) >= 0) {
            output.append(source.substring(posStart, pos));

            output.append(newString);
            posStart = pos + lengthOfOld;
        }

        if (posStart < lengthOfSource) {
            output.append(source.substring(posStart));
        }

        return output.toString();
    }

    /*
    public static String ReplaceIgnoreCase(String source, String oldString, String newString) {
    }
    */

    /**
     * 将字符串格式化成 HTML 代码输出
     * 只转换特殊字符，适合于 HTML 中的表单区域
     *
     * @param str 要格式化的字符串
     * @return 格式化后的字符串
     */
    public static String toHtmlInput(String str) {
        if (str == null)    return null;

        String html = new String(str);

        html = Replace(html, "&", "&amp;");
        html = Replace(html, "<", "&lt;");
        html = Replace(html, ">", "&gt;");

        return html;
    }

    /**
     * 将字符串格式化成 HTML 代码输出
     * 除普通特殊字符外，还对空格、制表符和换行进行转换，
     * 以将内容格式化输出，
     * 适合于 HTML 中的显示输出
     *
     * @param str 要格式化的字符串
     * @return 格式化后的字符串
     */
    public static String toHtml(String str) {
        if (str == null)    return null;

        String html = new String(str);

        html = toHtmlInput(html);
        html = Replace(html, "\r\n", "\n");
        html = Replace(html, "\n", "<br>\n");
        html = Replace(html, "\t", "    ");
        html = Replace(html, "  ", " &nbsp;");

        return html;
    }

    /**
     * 将普通字符串格式化成数据库认可的字符串格式
     *
     * @param str 要格式化的字符串
     * @return 合法的数据库字符串
     */
    public static String toSql(String str) {
        String sql = new String(str);
        return Replace(sql, "'", "''");
    }

    /*
    public static void main(String[] args) {
        String s = "<html>    ddd";
        Format f = new Format();
                    }
    */
}