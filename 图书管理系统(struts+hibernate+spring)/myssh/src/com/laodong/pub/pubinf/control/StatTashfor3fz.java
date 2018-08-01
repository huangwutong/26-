package com.laodong.pub.pubinf.control;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TimerTask;

/**
 * ÿ��3����ִ��һ�ε�����
 * 
 * �����������У������ԣ�
 * ������һ��ִ��ʱ�䡡��
 * ����ִ������
 * @author lhh
 * ������Ȼ�������⣬����ӡ�ɾ������ʱ����Ӱ��run�����е�Iterator����
 */
public class StatTashfor3fz extends TimerTask {
	private static HashMap objMap = new HashMap();

	private static HashMap taskMap = new HashMap();
    /**����Զ�ִ������*/
	public synchronized static void addTask(String key, DingshiInfo dsinfo, Dingshi ds) {
		objMap.put(key, dsinfo);
		taskMap.put(key, ds);
	}
	/**ɾ���Զ�ִ������*/
	public synchronized static void removeTask(String key) {
		objMap.remove(key);
		taskMap.remove(key);
	}

	/**
	 * ��DaemonTaskִ�е�ʵ������
	 */
	public void run() {
		try {
			/**
			 * 2006/12/17 ��Ӵ�ͬ���ؽ��֣���Ҫ�����ڵ���������objMap�ṹ�����仯
			 */
			synchronized(this){
			Set entries = objMap.entrySet();
			Iterator iter = entries.iterator();
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				String taskKey = (String) entry.getKey();
				DingshiInfo info = (DingshiInfo) entry.getValue();
				Dingshi ds = (Dingshi) taskMap.get(taskKey);
				ds.autolaodong(info);
			}
			}
		} catch (Exception e) {
			System.out.println("StatTask.run()�����쳣:" + e.getMessage());
			e.printStackTrace();
		}
	}

	/**
	 * �����ִ�����ڡ�
	 * 
	 * @return long
	 */
	public long getPeriod() {
		// ������ÿ��ִ��һ�Ρ�
		// long PERIOD = 1000 * 60 * 60 * 24;

		// ÿ3����ִ��һ��
		long PERIOD = 1000 * 60 * 3;

		return PERIOD;
	}

	/**
	 * ��һ��ִ��ʱ�䡣
	 * 
	 * @return Date
	 */
	public Date getFirstTime() {
		// ������ĵ�һ��ִ��ʱ��ÿ��00:00:00��
		int hour = 0, minute = 0, second = 0;
		GregorianCalendar calendar = new GregorianCalendar();
		calendar.set(GregorianCalendar.HOUR_OF_DAY, hour);
		calendar.set(GregorianCalendar.MINUTE, minute);
		calendar.set(GregorianCalendar.SECOND, second);
		return new Date(calendar.getTimeInMillis());
	}

}
