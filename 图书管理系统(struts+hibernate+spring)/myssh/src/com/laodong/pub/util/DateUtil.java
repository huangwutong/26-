package com.laodong.pub.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	/**
	 * �õ���ǰ�����ִ�
	 * D-8λ������(yyyyMMdd)
	 */
	public static String getDateTime(){
		return getDateTime("D");
	}
	/**
	 * ���ݲ����õ���ǰ�����ִ�
	 * String DorTorDTȡֵ��Χ��D��T��DT
	 * D-8λ������(yyyyMMdd) 
	 * T-6λʱ����(HHmmss) 
	 * DT-14λ������ʱ����(yyyyMMddHHmmss)
	 * Ĭ�ϣ�D ������
	 */
	public static String getDateTime(String D_T_DT){
		return getDateTime(D_T_DT, null);
	}
	/**
	 * 
	 * @���� �õ�DT��ʽʱ��
	 * @���� 
	 * @���� 2006-7-26
	 * @ʱ�� 21:25:56
	 * @param D_T_DT
	 * @return
	 */
	public static String getDT_DateTime(){
		return getDateTime("DT", null);
	}
	public static String getBZ_DT_DateTime(){
		return getDateTime("DT", null);
	}
	/**
	 * 
	 * @���� ���ݸ������ں͸�ʽ�õ������ִ�
	 * @���� 
	 * @���� 2006-6-4
	 * @ʱ�� 12:37:12
	 * @param DorTorDT
	 * @param date
	 * @return
	 */
    public static String getDateTime(String DorTorDT, Date date){
    	String str = null;
        if(DorTorDT==null)DorTorDT="D";
        if(date==null)
        	date = new Date();
		SimpleDateFormat lFormatDate = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat lFormatTime = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat lFormatTimestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(DorTorDT.equals("DT")){
			String rtn2 = lFormatTimestamp.format(date);
		
			rtn2 = rtn2.substring(0, 4) + rtn2.substring(5, 7) + rtn2.substring(8, 10)
	        + rtn2.substring(11, 13) + rtn2.substring(14, 16)+ rtn2.substring(17, 19);
            str = rtn2;
		}
		else if(DorTorDT.equals("T")){
			String rtn1 = lFormatTime.format(date);
			rtn1 = rtn1.substring(0, 2) + rtn1.substring(3, 5) + rtn1.substring(6, 8);
            str = rtn1;
		}
		else{ //Ĭ�ϣ�D ������
			String rtn = lFormatDate.format(date);
			rtn = rtn.substring(0, 4) + rtn.substring(5, 7) + rtn.substring(8);
            str = rtn;
			
		}
		
		return str; 
		
    }
    public static String getShowTime(){
    	String bzstr = getBZ_DT_DateTime();
    	return zhuanhuanLDDateStrToXSDateStr(bzstr);
    }
    
    /**
     * 
     * @���� ת���Ͷ�DTʱ���ʽΪ��׼DTʱ���ʽ
     * @���� 20060604123428  ->  2006-06-04 12:34:28
     * @���� 2006-6-4
     * @ʱ�� 12:39:48
     * @return
     */
    public static String zhuanhuanLDDateStrToBZDateStr(String datestr){
    	if(StringUtil.sfWz(datestr))
    		return datestr;
    	if(datestr.length()<14){
    		int cha = 14 - datestr.length();
    		for(int i=0;i<cha;i++)
    			datestr += "0";
    	}
    	String str = datestr.substring(0, 4) + "-" + datestr.substring(4, 6) + "-" + datestr.substring(6, 8)
    	+ " " + datestr.substring(8, 10) + ":" + datestr.substring(10, 12) + ":" + datestr.substring(12, 14);
    	return str;
    }
    /**
     * @��������
     * @ҵ������ 20060604123428  ->  12:34:28
     *
     * @author lhh
     * @ʱ�� 2008-2-27 21:32:52
     */
    public static String zhuanhuanLDDateStrToHhmmtt(String datestr){
    	if(StringUtil.sfWz(datestr))
    		return datestr;
    	if(datestr.length()<14){
    		int cha = 14 - datestr.length();
    		for(int i=0;i<cha;i++)
    			datestr += "0";
    	}
    	String str = datestr.substring(8, 10) + ":" + datestr.substring(10, 12) + ":" + datestr.substring(12, 14);
    	return str;
    }
    /**
     * 
     * @���� ת���Ͷ�DTʱ���ʽΪ��ʾʱ���ʽ
     * @���� 20060604123428  ->  2006-06-04 12:34
     * @���� 2006-6-4
     * @ʱ�� 12:39:48
     * @return
     */
    public static String zhuanhuanLDDateStrToXSDateStr(String datestr){
    	if(StringUtil.sfWz(datestr))
    		return datestr;
    	if(datestr.length()<14){
    		int cha = 14 - datestr.length();
    		for(int i=0;i<cha;i++)
    			datestr += "0";
    	}
    	String str = datestr.substring(0, 4) + "-" + datestr.substring(4, 6) + "-" + datestr.substring(6, 8)
    	+ " " + datestr.substring(8, 10) + ":" + datestr.substring(10, 12);
    	return str;
    }
    public static String BZ_zhuanhuanLDDateStrToXSDateStr(String datestr){
    	return zhuanhuanLDDateStrToXSDateStr(datestr);
    }
    /**
     * 
     * @���� ת���Ͷ�DTʱ���ʽΪ����ʾʱ���ʽ
     * @���� 20060604123428  ->  2006-06-04
     * @���� 2006-6-4
     * @ʱ�� 12:39:48
     * @return
     */
    public static String zhuanhuanLDDateStrToJDXSDateStr(String datestr){
    	if(StringUtil.sfWz(datestr))
    		return datestr;
    	if(datestr.length()<8){
    		int cha = 8 - datestr.length();
    		for(int i=0;i<cha;i++)
    			datestr += "0";
    	}
    	String str = datestr.substring(0, 4) + "-" + datestr.substring(4, 6) + "-" + datestr.substring(6, 8);
    	return str;
    }
    /**
     * 
     * @���� ת����׼DTʱ���ʽΪ�Ͷ�DTʱ���ʽ
     * @���� 2006-07-11 23:05:00 -> 20060711230500
     * @���� 2006-7-16
     * @ʱ�� 13:07:30
     * @param datastr
     * @return
     */
    public static String zhuanhuanBZDateStrToLDDateStr(String datastr){
    	if(StringUtil.sfWz(datastr))
    		return datastr;
    	if(datastr.length()<19)
    		return null;
    	datastr = datastr.substring(0, 4) + datastr.substring(5, 7) + datastr.substring(8, 10)
        + datastr.substring(11, 13) + datastr.substring(14, 16)+ datastr.substring(17, 19);
        return datastr;
    }
    /**
     * �����ִ��ɴ洢��ʽת������ʾ��ʽ
     * 20280706 -> 2028-07-06
     * @param datestr
     * @return
     * 2006-8-21
     */
    public static String zhNDateToBDate(String datestr){
    	if(datestr==null||datestr.length()<8)
    		return null;
    	String str = datestr.substring(0, 4) + "-" + datestr.substring(4, 6) + "-" + datestr.substring(6, 8);
        return str;
    }
    /**
     * �����ִ�����ʾ��ʽת���ɴ洢��ʽ
     * 2028-07-06 -> 20280706
     * @param datestr
     * @return
     * 2006-8-21
     */
    public static String zhBDateToNDate(String datestr){
    	if(datestr==null||datestr.length()<10)
    		return null;
    	String str = datestr.substring(0, 4) + datestr.substring(5, 7) + datestr.substring(8, 10);
        return str;
    }
    /**
     * 
     * @���� ת���Ͷ�DTʱ���ʽΪʱ��
     * @���� 
     * @���� 2006-6-4
     * @ʱ�� 12:47:29
     * @param datestr
     * @return
     */
    public static Date zhuanhuanLDDateStrToDate(String datestr){
    	
    	Date date = null;
    	try {
    		String str = datestr.substring(0, 4) + "-" + datestr.substring(4, 6) + "-" + datestr.substring(6, 8)
        	+ " " + datestr.substring(8, 10) + ":" + datestr.substring(10, 12) + ":" + datestr.substring(12, 14);
        	SimpleDateFormat formatTimestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			date = formatTimestamp.parse(str);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("��ʽ�������ִ�����");
		}
    	return date;
    }
    
    public static void main(String[] args){
//    	Date date = zhuanhuanLDDateStrToDate("2006-07-11 23:05:00");
//    	System.out.println("2006-07-11 23:05:00".length());
    	Date d1 = zhuanhuanLDDateStrToDate("20070604123428");
    	Date d2 = zhuanhuanLDDateStrToDate("20060604123428");
    	//d1>d2ʱ����true
    	if(d1.after(d2))
    		System.out.println("ok");
//    	String str = zhuanhuanLDDateStrToBZDateStr("20060604123428");
//    	System.out.println(str);
//    	String str = zhuanhuanBZDateStrToLDDateStr("2006-07-11 23:05:00");
//    	System.out.println(str);
//    	Calendar cal = Calendar.getInstance();
//    	cal.add(Calendar.MINUTE, -10);
//    	Date date = cal.getTime();
//    	System.out.println(date);
//    	String str = DateUtil.getDateTime("DT");
//    	System.out.print(str);
    	//Date d = new Date();
    	//d.setSeconds()
    }
}
