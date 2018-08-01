package com.laodong.pub.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @���� String����
 * @���� 
 * @���� lhh
 * @���� 2006-6-27
 * @ʱ�� 22:13:31
 */
public class StringUtil {
	/**
	 * 
	 * @���� ��֤�ַ����Ƿ���ֵ����ֵ����true
	 * @���� 
	 * @���� 2006-6-27
	 * @ʱ�� 22:16:35
	 * @param str
	 * @return
	 */
    public static boolean sfYz(String str){
    	if(str==null||str.trim().equals(""))
    		return false;
    	else
    		return true;
    }
    /**
     * 
     * @���� ��֤�ַ����Ƿ���ֵ����ֵ����true
     * @���� 
     * @���� 2006-6-27
     * @ʱ�� 22:18:12
     * @param str
     * @return
     */
    public static boolean sfWz(String str){
    	if(str==null||str.trim().equals(""))
    		return true;
    	else
    		return false;
    }
    public static boolean listSfYz(List list){
    	if(list==null||list.size()==0)
    		return false;
    	else
    		return true;
    }
    public static int getId(HttpServletRequest request, String idName){
    	String idstr = request.getParameter(idName);
    	if(StringUtil.sfWz(idstr))
    		idstr = (String)request.getAttribute(idName);
		int id = 0;
		if(StringUtil.sfYz(idstr))
			id = Integer.parseInt(idstr);
		return id;
    }
    public static String getErrorMsg(HttpServletRequest request){
    	String str = null;
    	String mymessage = (String)request.getAttribute("mymessage");
    	String myerror = (String)request.getAttribute("myerror");
    	if(sfYz(mymessage))
    		str = mymessage;
    	if(sfYz(myerror)){
    		if(sfYz(str))
    		   str += mymessage;
    		else
    		   str = myerror;
    	}
    	return str;
    }
    public static int getIntFromString(String str){
    	if(sfWz(str))
    		return 0;
    	int i = 0;
		try {
			i = Integer.parseInt(str);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
    	return i;
    }
}
