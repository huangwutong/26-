package net.acai.util;
/**
 * Title:        ��������
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      www.SuperSpace.com
 * @author:       SuperSpace
 * @version 1.0
 */
/**
 * Title:        ��������
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:     http://xSuperSpace.yeah.net
 * @author 	SuperSpace
 * @version 1.0
 */



import java.text.*;
import java.util.*;

public class StringUtils {

    // ת��html�ĳ���;
    private static final char[] QUOTE_ENCODE = "&quot;".toCharArray();
    private static final char[] AMP_ENCODE = "&amp;".toCharArray();
    private static final char[] LT_ENCODE = "&lt;".toCharArray();
    private static final char[] GT_ENCODE = "&gt;".toCharArray();
    private static final char[] APOS_ENCODE = "&apos;".toCharArray();
	private static final char[] BR_TAG = "<BR>".toCharArray();

    /**
     * ��ʼ��,��������һ����ֻ�ܵ���
     * 
     */
    private static Object initLock = new Object();

    /**
     * ���linde�е�oldStringΪnewString
     *
     * @���� line ��Ҫ��������ַ���
     * @���� oldString the String that should be replaced by newString
     * @param newString the String that will replace all instances of oldString
     *
     * @return a String will all instances of oldString replaced by newString
     */
    public static final String replace( String line, String oldString, String newString )
    {
        if (line == null) {
            return null;
        }
        int i=0;
        if ( ( i=line.indexOf( oldString, i ) ) >= 0 ) {
            char [] line2 = line.toCharArray();
            char [] newString2 = newString.toCharArray();
            int oLength = oldString.length();
            StringBuffer buf = new StringBuffer(line2.length);
            buf.append(line2, 0, i).append(newString2);
            i += oLength;
            int j = i;
            while( ( i=line.indexOf( oldString, i ) ) > 0 ) {
                buf.append(line2, j, i-j).append(newString2);
                i += oLength;
                j = i;
            }
            buf.append(line2, j, line2.length - j);
            return buf.toString();
        }
        return line;
    }

 
    /**
     * This method takes a string which may contain HTML tags (ie, &lt;b&gt;,
     * &lt;table&gt;, etc) and converts the '&lt'' and '&gt;' characters to
     * their HTML escape sequences.
     *
     * @param in the text to be converted.
     * @return the input string with the characters '&lt;' and '&gt;' replaced
     *  with their HTML escape sequences.
     */
    public static final String escapeHTMLTags(String in) {
        if (in == null) {
            return null;
        }
        char ch;
        int i=0;
        int last=0;
        char[] input = in.toCharArray();
        int len = input.length;
        StringBuffer out = new StringBuffer((int)(len*1.3));
        for (; i < len; i++) {
            ch = input[i];
            if (ch > '>') {
                continue;
            } else if (ch == '<') {
                if (i > last) {
                    out.append(input, last, i - last);
                }
                last = i + 1;
                out.append(LT_ENCODE);
            } else if (ch == '>') {
                if (i > last) {
                    out.append(input, last, i - last);
                }
                last = i + 1;
                out.append(GT_ENCODE);
            }
        }
        if (last == 0) {
            return in;
        }
        if (i > last) {
            out.append(input, last, i - last);
        }
        return out.toString();
    }
	public static String convertNewlines(String input) {
        char [] chars = input.toCharArray();
        int cur = 0;
        int len = chars.length;
        StringBuffer buf = new StringBuffer(len);
        // Loop through each character lookin for newlines.
        for (int i=0; i<len; i++) {
            // If we've found a Unix newline, add BR tag.
            if (chars[i]=='\n') {
                buf.append(chars, cur, i-cur).append(BR_TAG);
                cur = i+1;
            }
            // If we've found a Windows newline, add BR tag.
            else if (chars[i]=='\r' && i<len-1 && chars[i+1]=='\n') {
                buf.append(chars, cur, i-cur).append(BR_TAG);
                i++;
                cur = i+1;
            }
        }
        // Add whatever chars are left to buffer.
        buf.append(chars, cur, len-cur);
        return buf.toString();
    }

	public static String  getTranslateStr(String sourceStr,String fieldStr){
	//�����߼����ʽ��ת������
		  String []  sourceList;
		  String resultStr="";
		  //dim i,j
		  if (sourceStr.indexOf(" ")>0){ 
			 boolean isOperator=true;
			 sourceList=sourceStr.split(" ");
			 //'--------------------------------------------------------
			 //rem Response.Write "num:" & cstr(ubound(sourceList)) & "<br>"
			for(int i=0;i<sourceList.length;i++){
				 if(sourceList[i].equals("AND")||sourceList[i].equals("&")||sourceList[i].equals("��")||sourceList[i].equals("��")){
				  	 resultStr=resultStr+" and ";
					 isOperator=true;
				 }
				 else if(sourceList[i].equals("OR")||sourceList[i].equals("|")||sourceList[i].equals("��")){
				 	resultStr=resultStr + " or ";
					isOperator = true;
				 }
				 else if(sourceList[i].equals("NOT")||sourceList[i].equals("!")||sourceList[i].equals("��")||sourceList[i].equals("��")){
				 	resultStr=resultStr + " not ";
					isOperator = true;
				 }
				 else if(sourceList[i].equals("(")||sourceList[i].equals("��")||sourceList[i].equals("��")){
					resultStr=resultStr + " ( ";
					isOperator = true;
				 }
				 else if(sourceList[i].equals(")")||sourceList[i].equals("��")||sourceList[i].equals("��")){
					resultStr=resultStr + " ) ";
					isOperator = true;
				 }
				 else{
					if(!"".equals(sourceList[i])){
						if (!isOperator)
						{
							resultStr=resultStr + " and ";
						}
						if (sourceList[i].indexOf("%")>0)
						{
							resultStr=resultStr+" "+fieldStr+ " like '" + sourceList[i].replaceAll("'","''") + "' ";

						} 
						else
							resultStr=resultStr+" "+fieldStr+ " like '%" + sourceList[i].replaceAll("'","''") + "%' ";
						isOperator=false;
					}
				 }
			}
			return resultStr;
		  }
		  else{
				if (sourceStr.indexOf("%")>0)
				{
					resultStr=resultStr+" "+fieldStr+ " like '" + sourceStr.replaceAll("'","''") + "' ";

				} 
				else
					resultStr=resultStr+" "+fieldStr+ " like '%" + sourceStr.replaceAll("'","''") + "%' ";
						
			return resultStr;
		  }

				 
								
	}

}