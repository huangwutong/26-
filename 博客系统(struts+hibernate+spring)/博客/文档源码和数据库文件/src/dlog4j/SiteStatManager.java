/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import dlog4j.beans.RefererBean;
import dlog4j.formbean.LogForm;
import dlog4j.formbean.ReplyForm;
import dlog4j.formbean.UserForm;
import net.sf.hibernate.Criteria;
import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.expression.Order;

/**
 * 用于网站统计的工具类
 * @author Winter Lau
 */
public class SiteStatManager extends ManagerBase {
	
	public final static int SCOPE_ALL		= -1;
	
	/**
	 * 统计日记数
	 * 例如：
	 * 统计所有日记数 int logCount = statLogs(0, SCOPE_ALL);
	 * 统计昨天日记数 int logCount = statLogs(-1,Calendar.DATE);
	 * 统计本月月日记数 int logCount = statLogs(0,Calendar.MONTH);
	 * 
	 * @param inc	增量值
	 * @param scope	范围值
	 * @return 日记数,-1表示统计失败
	 * @throws SQLException
	 * @throws HibernateException
	 */
	public static int statLogs(int inc, int scope) throws SQLException, HibernateException{
		Session ssn = null;
		int log_count = -1;
		try{
			ssn = getSession();
			String hql = "SELECT COUNT(*) FROM "+LogForm.class.getName()+" AS log WHERE log.status=0";
			Calendar cal_begin = null;
			Calendar cal_end = null;
			if(scope != SCOPE_ALL){
				cal_begin = Calendar.getInstance();
				cal_end = Calendar.getInstance();
				if(inc != 0){
					cal_begin.add(scope, inc);
					cal_end.add(scope, inc);
				}
				resetCalendar(cal_begin, scope);
				resetCalendar(cal_end, scope);
				cal_end.add(scope, 1);
				hql += " AND log.logTime>=? AND log.logTime<?";
			}
			Query q2 = ssn.createQuery(hql);
			if(scope != SCOPE_ALL){
				q2.setCalendar(0, cal_begin);
				q2.setCalendar(1, cal_end);
			}
			List res = q2.list();
			log_count = (res.size()>0)?((Integer)res.get(0)).intValue():0;
		}finally{
			closeSession(ssn);
		}
		return log_count;
	}

	/**
	 * 统计评论数
	 * 例如：
	 * 统计所有评论数 int logCount = statLogs(0, SCOPE_ALL);
	 * 统计昨天评论数 int logCount = statLogs(-1,Calendar.DATE);
	 * 统计本月月评论数 int logCount = statLogs(0,Calendar.MONTH);
	 * 
	 * @param inc	增量值
	 * @param scope	范围值
	 * @return 评论数,-1表示统计失败
	 * @throws SQLException
	 * @throws HibernateException
	 */
	public static int statReplies(int inc, int scope) throws SQLException, HibernateException{
		Session ssn = null;
		int log_count = -1;
		try{
			ssn = getSession();
			String hql = "SELECT COUNT(reply.id) FROM "+ReplyForm.class.getName()+" AS reply WHERE reply.log.status<>" + LogForm.STATUS_DELETED;
			Calendar cal_begin = null;
			Calendar cal_end = null;
			if(scope != SCOPE_ALL){
				cal_begin = Calendar.getInstance();
				cal_end = Calendar.getInstance();
				if(inc != 0){
					cal_begin.add(scope, inc);
					cal_end.add(scope, inc);
				}
				resetCalendar(cal_begin, scope);
				resetCalendar(cal_end, scope);
				cal_end.add(scope, 1);
				hql += " AND reply.writeTime>=? AND reply.writeTime<?";
			}
			Query q2 = ssn.createQuery(hql);
			if(scope != SCOPE_ALL){
				q2.setCalendar(0, cal_begin);
				q2.setCalendar(1, cal_end);
			}
			List res = q2.list();
			log_count = (res.size()>0)?((Integer)res.get(0)).intValue():0;
		}finally{
			closeSession(ssn);
		}
		return log_count;
	}
	
	/**
	 * 获取第一篇日记
	 * @return
	 * @throws SQLException
	 * @throws HibernateException
	 */
	public static LogForm getFirstLog() throws SQLException, HibernateException{
		Session ssn = null;
		try{
			ssn = getSession();
			Criteria crit = ssn.createCriteria(LogForm.class);
			crit.addOrder(Order.asc("logTime"));
			crit.setMaxResults(1);
			List logs = crit.list();
			if(logs.size()>0)
				return (LogForm)logs.get(0);			
		}finally{
			closeSession(ssn);
		}		
		return null;
	}

	/**
	 * 获取第一个访问记录
	 * @return
	 * @throws SQLException
	 * @throws HibernateException
	 */
	public static RefererBean getFirstVisit() throws SQLException, HibernateException{
		Session ssn = null;
		try{
			ssn = getSession();
			Criteria crit = ssn.createCriteria(RefererBean.class);
			crit.addOrder(Order.asc("visitDate"));
			crit.addOrder(Order.asc("visitTime"));
			crit.setMaxResults(1);
			List logs = crit.list();
			if(logs.size()>0)
				return (RefererBean)logs.get(0);			
		}finally{
			closeSession(ssn);
		}		
		return null;
	}

	/**
	 * 统计访问数
	 * 例如：
	 * 统计所有访问数 int logCount = statLogs(0, SCOPE_ALL);
	 * 统计昨天访问数 int logCount = statLogs(-1,Calendar.DATE);
	 * 统计本月月访问数 int logCount = statLogs(0,Calendar.MONTH);
	 * 
	 * @param inc	增量值
	 * @param scope	范围值
	 * @return 访问数,-1表示统计失败
	 * @throws SQLException
	 * @throws HibernateException
	 */
	public static int statTotalVisit(int inc, int scope) throws SQLException, HibernateException{
		Session ssn = null;
		int log_count = -1;
		try{
			ssn = getSession();
			String hql = "SELECT COUNT(*) FROM "+RefererBean.class.getName()+" AS log";
			if(scope != SCOPE_ALL)
				hql += " WHERE log.visitDate LIKE ?";			
			Query q2 = ssn.createQuery(hql);
			if(scope != SCOPE_ALL){
				Calendar cal = Calendar.getInstance();
				cal.add(scope,inc);
				DateFormat fmt = null;
				String sDate = null;
				switch(scope){
				case Calendar.DATE:	
					fmt = new SimpleDateFormat("yyyyMMdd");
					sDate = fmt.format(cal.getTime());
					break;
				case Calendar.MONTH:
					fmt = new SimpleDateFormat("yyyyMM");
					sDate = fmt.format(cal.getTime())+'%';
					break;
				case Calendar.YEAR:
					fmt = new SimpleDateFormat("yyyy");
					sDate = cal.get(Calendar.YEAR) + "%";
					break;
				default:
					throw new IllegalArgumentException("The value of scope is un-supported.");
				}
				q2.setString(0, sDate);
			}
			List res = q2.list();
			log_count = (res.size()>0)?((Integer)res.get(0)).intValue():0;
		}finally{
			closeSession(ssn);
		}
		return log_count;
	}

	/**
	 * 统计用户访问数
	 * 例如：
	 * 统计所有用户访问数 int logCount = statLogs(0, SCOPE_ALL);
	 * 统计昨天用户访问数 int logCount = statLogs(-1,Calendar.DATE);
	 * 统计本月月用户访问数 int logCount = statLogs(0,Calendar.MONTH);
	 * 
	 * @param inc	增量值
	 * @param scope	范围值
	 * @return 用户访问数,-1表示统计失败
	 * @throws SQLException
	 * @throws HibernateException
	 */
	public static int statUserVisit(int inc, int scope) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int log_count = -1;
		try{
			conn = getConnection();
			String sql = "SELECT distinct remoteAddr,userAgent FROM dlog_visit";
			if(scope != SCOPE_ALL)
				sql += " WHERE visitDate LIKE ?";
			ps = conn.prepareStatement(sql,
					ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			if(scope != SCOPE_ALL){
				Calendar cal = Calendar.getInstance();
				cal.add(scope,inc);
				DateFormat fmt = null;
				String sDate = null;
				switch(scope){
				case Calendar.DATE:	
					fmt = new SimpleDateFormat("yyyyMMdd");
					sDate = fmt.format(cal.getTime());
					break;
				case Calendar.MONTH:
					fmt = new SimpleDateFormat("yyyyMM");
					sDate = fmt.format(cal.getTime())+'%';
					break;
				case Calendar.YEAR:
					fmt = new SimpleDateFormat("yyyy");
					sDate = cal.get(Calendar.YEAR) + "%";
					break;
				default:
					throw new IllegalArgumentException("The value of scope is un-supported.");
				}
				ps.setString(1, sDate);
			}
			rs = ps.executeQuery();
			rs.last();
			return rs.getRow();
		}finally{
			close(rs,ps,conn);
		}
	}

	/**
	 * 计算最高流量的一天
	 * @return
	 * @throws SQLException
	 */
	public static String[] maxVisit() throws SQLException{
		String[] values = {"",""};
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int log_count = -1;
		try{
			conn = getConnection();
			String sql = "SELECT visitDate,COUNT(1) FROM dlog_visit GROUP BY visitDate ORDER BY 2 DESC";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				values[0] = rs.getString(1);
				values[1] = String.valueOf(rs.getInt(2));
			}
		}finally{
			close(rs,ps,conn);
		}
		return values;
	}
	
	/**
	 * 统计用户数
	 * @return 数组第一个数为总用户数，第二个数为当日新增用户数
	 * @throws SQLException
	 * @throws HibernateException
	 */
	public static int[] statUsers() throws SQLException, HibernateException{
		Session ssn = null;
		int[] counts = {0,0};
		try{
			ssn = getSession();
			String hql = "SELECT COUNT(*) FROM "+UserForm.class.getName()+" AS u";
			Query q2 = ssn.createQuery(hql);
			List res = q2.list();
			counts[0] = (res.size()>0)?((Integer)res.get(0)).intValue():0;
			
			hql = "SELECT COUNT(*) FROM "+UserForm.class.getName()+" AS u WHERE u.regTime>=?";
			q2 = ssn.createQuery(hql);
			Calendar cal = Calendar.getInstance();
			resetCalendar(cal, Calendar.DATE);
			q2.setCalendar(0, cal);
			res = q2.list();
			counts[1] = (res.size()>0)?((Integer)res.get(0)).intValue():0;
		}finally{
			closeSession(ssn);
		}
		return counts;
	}
	
	/**
	 * 重置日历的值
	 * @param cal
	 * @param scope
	 */
	protected static void resetCalendar(Calendar cal, int scope){
		cal.set(Calendar.MILLISECOND, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		switch(scope){
		case Calendar.DATE:			
			break;
		case Calendar.MONTH:
			cal.set(Calendar.DATE, 1);
			break;
		case Calendar.YEAR:
			cal.set(Calendar.DATE, 1);
			cal.set(Calendar.MONTH, 0);
			break;
		default:
			throw new IllegalArgumentException("The value of scope is un-supported.");
		}
	}
}
