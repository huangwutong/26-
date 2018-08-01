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

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import net.sf.hibernate.Criteria;
import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.expression.Expression;
import net.sf.hibernate.expression.Order;

import org.apache.commons.lang.StringUtils;
import org.apache.lucene.queryParser.ParseException;

import dlog4j.formbean.CategoryForm;
import dlog4j.formbean.DraftForm;
import dlog4j.formbean.LogForm;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;
import dlog4j.search.SearchProxy;
import dlog4j.security.DlogRole;

/**
 * @author Liudong
 * 日记管理器
 */
public class LogManager extends ManagerBase{

    /**
     * 日记的搜索
     * @deprecated 该方法由searchAllLogs来代替
     * @param ssn
     * @param site
     * @param loginUser
     * @param cat_id
     * @param search
     * @param from
     * @param count
     * @return
     * @throws HibernateException
     */
    public static List searchLogs(Session ssn, SiteForm site, UserForm loginUser, int cat_id, String search, String orderField, int from, int count) throws HibernateException, IOException, ParseException
    {
        SearchProxy proxy = SearchProxy.getLogQuery();
        List ids = proxy.searchFor(site.getId(),cat_id,search,from,count);
        if(ids.size()==0)
            return new ArrayList();
        //System.out.println("search.count="+ids.size());
        Criteria crit = ssn.createCriteria(LogForm.class).add(Expression.eq("site.id", new Integer(site.getId())));
        crit = crit.add(Expression.in("id",ids));
        
		if(StringUtils.isEmpty(orderField))
			orderField = "logTime"; 
        crit = crit.addOrder(Order.desc(orderField));
        List logs = crit.list();
        //过滤掉没有权限的日记分类
        Iterator ls = logs.iterator();
        while(ls.hasNext()) {
            LogForm log = (LogForm)ls.next();
    	    if(loginUser==null||!loginUser.isAdmin()) {
    	        if(log.getCategory().getType()==CategoryForm.TYPE_OWNER)
    	            ls.remove();
    	    }
        }
        return logs;
    }
    /**
     * 搜索符合条件的所有日记
     * @param ssn
     * @param site
     * @param loginUser
     * @param cat_id
     * @param search
     * @return
     * @throws HibernateException
     * @throws IOException
     * @throws ParseException
     */
    public static List searchAllLogs(Session ssn, SiteForm site, UserForm loginUser, int cat_id, String search, String orderField) throws HibernateException, IOException, ParseException
    {        
        List logs = new ArrayList();
        SearchProxy proxy = SearchProxy.getLogQuery();
        List ids = proxy.searchFor(site.getId(),cat_id,search,0,-1);
        if(ids.size()>0) {
            Criteria crit = ssn.createCriteria(LogForm.class).add(Expression.eq("site.id", new Integer(site.getId())));
            crit = crit.add(Expression.in("id",ids));
    		if(StringUtils.isEmpty(orderField))
    			orderField = "logTime"; 
    		crit = crit.addOrder(Order.desc(orderField));
            logs = crit.list();
            //过滤掉没有权限的日记分类
            Iterator ls = logs.iterator();
            while(ls.hasNext()) {
                LogForm log = (LogForm)ls.next();
                if(loginUser==null||!loginUser.isAdmin()) {
                    if(log.getCategory().getType()==CategoryForm.TYPE_OWNER) {
                        ls.remove();
                    }
                }
            }
        }
        if(ids!=null)
            ids.clear();
        return logs;
    }
    /**
     * 得到查询出的日记总数
     * @deprecated 该方法已经由searchAllLogs来代替
     * @param ssn
     * @param site
     * @param loginUser
     * @param cat_id
     * @param search
     * @return
     * @throws HibernateException
     * @throws IOException
     * @throws ParseException
     */
    public static int getSearchLogCount(Session ssn, SiteForm site, UserForm loginUser, int cat_id, String search) throws HibernateException, IOException, ParseException
    {
        SearchProxy proxy = SearchProxy.getLogQuery();
        List ids = proxy.searchFor(site.getId(),cat_id,search,0,-1);
        if(ids.size()==0)
            return 0;
        Criteria crit = ssn.createCriteria(LogForm.class).add(Expression.eq("site.id", new Integer(site.getId())));
        crit = crit.add(Expression.in("id",ids));
        List logs = crit.list();
        //过滤掉没有权限的日记分类
        Iterator ls = logs.iterator();
        while(ls.hasNext()) {
            LogForm log = (LogForm)ls.next();
    	    if(loginUser==null||!loginUser.isAdmin()) {
    	        if(log.getCategory().getType()==CategoryForm.TYPE_OWNER)
    	            ls.remove();
    	    }
        }
        int lc = logs.size();
        logs.clear();
        return lc;
    }
	/**
	 * 读取指定的日记信息
	 * @param ssn
	 * @param site
	 * @param loginUser
	 * @param log_id
	 * @return
	 */
	public static LogForm getLogForm(Session ssn, SiteForm site, UserForm loginUser, int log_id)
	{
		LogForm log = null;
		try{
			log = (LogForm)ssn.load(LogForm.class, new Integer(log_id));
			if(log.getStatus()==LogForm.STATUS_DELETED)
			    log = null;
			else
			if(log!=null && log.getSite().getId()!=site.getId())
				log = null;
			else
			if(log!=null&&(loginUser==null||!loginUser.isAdmin())&&log.getCategory().isOwnerOnly())
				log = null;
		}catch(HibernateException e){}
		return log;
	}
	
	/**
	 * 统计出指定月份每天的日记篇数
	 * 使用SQL查询方式避免加载日记内容以提供查询速度
	 * @param ssn
	 * @param site
	 * @param year
	 * @param month (1-12)
	 * @return
	 * @throws HibernateException
	 */
	public static int[] statLogs(Session ssn, SiteForm site, UserForm loginUser, int year, int month) throws HibernateException
	{
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		return statLogs(ssn,site,loginUser,cal);
	}
	
	/**
	 * 统计指定月份每天的日记数（使用Hibernate查询方式）
	 * 使用SQL查询方式避免加载日记内容以提供查询速度
	 * @param ssn
	 * @param site
	 * @param loginUser
	 * @param month
	 * @return
	 * @throws HibernateException
	 */
	public static int[] statLogs(Session ssn, SiteForm site, UserForm loginUser, Calendar month) throws HibernateException{
		
		Calendar firstDate = (Calendar)month.clone();
		firstDate.set(Calendar.DATE,1);
		resetCalendar(firstDate);
		Calendar nextMonthFirstDate = (Calendar)firstDate.clone();
		nextMonthFirstDate.add(Calendar.MONTH,1);
		
		//计算指定月份有多少天
		Calendar tempCal = (Calendar)nextMonthFirstDate.clone();
		tempCal.add(Calendar.DATE,-1);
		int dateCount = tempCal.get(Calendar.DATE);
		
		int[] logCounts = new int[dateCount];
		
		//查询出当月的所有日记进行统计

		StringBuffer hql = new StringBuffer("SELECT log.logTime FROM ");
		hql.append(LogForm.class.getName());
		hql.append(" AS log WHERE log.logTime>=? AND log.logTime<? AND log.status=?");
		Query q = ssn.createQuery(hql.toString());
		q.setTimestamp(0, firstDate.getTime());
		q.setTimestamp(1, nextMonthFirstDate.getTime());
		q.setInteger(2, LogForm.STATUS_NORMAL);
		
		Iterator logs = q.list().iterator();
		while(logs.hasNext()){
			tempCal.setTime((Timestamp)logs.next());
			int date = tempCal.get(Calendar.DATE) - 1;
			logCounts[date]++;
		}
		
		return logCounts;
	}
	/**
	 * 统计指定月份每天的日记数（使用SQL查询方式）
	 * @deprecated 使用Hibernate的HQL来查询
	 * @param ssn
	 * @param site
	 * @param loginUser
	 * @param month
	 * @return
	 * @throws HibernateException
	 */
	public static int[] statLogs(Connection conn, SiteForm site, UserForm loginUser, Calendar month) throws SQLException{
		
		Calendar firstDate = (Calendar)month.clone();
		firstDate.set(Calendar.DATE,1);
		resetCalendar(firstDate);
		Calendar nextMonthFirstDate = (Calendar)firstDate.clone();
		nextMonthFirstDate.add(Calendar.MONTH,1);
		
		//计算指定月份有多少天
		Calendar tempCal = (Calendar)nextMonthFirstDate.clone();
		tempCal.add(Calendar.DATE,-1);
		int dateCount = tempCal.get(Calendar.DATE);
		
		int[] logCounts = new int[dateCount];
		
		//查询出当月的所有日记进行统计

		String sql = "SELECT logTime FROM dlog_journal WHERE logTime>=? AND logTime<? AND status=?";
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			ps = conn.prepareStatement(sql);
			ps.setTimestamp(1, new Timestamp(firstDate.getTime().getTime()));
			ps.setTimestamp(2, new Timestamp(nextMonthFirstDate.getTime().getTime()));
			ps.setInt(3, LogForm.STATUS_NORMAL);
			if(ps.execute()){
				rs = ps.getResultSet();
				while(rs.next()){
					tempCal.setTime(rs.getDate(1));
					int date = tempCal.get(Calendar.DATE) - 1;
					logCounts[date]++;
				}
			}
		}finally{
			close(rs,ps,null);
		}
		
		return logCounts;
	}
	/**
	 * 清除日历的时间字段
	 * @param cal
	 */
	protected static void resetCalendar(Calendar cal){
		cal.set(Calendar.HOUR_OF_DAY,0);
		cal.set(Calendar.MINUTE,0);
		cal.set(Calendar.SECOND,0);
		cal.set(Calendar.MILLISECOND,0);
	}
	/**
	 * 根据参数构建一个日历对象实例
	 * @param year
	 * @param month 1-12
	 * @param date
	 * @param clearTime	是否清除时间字段
	 * @return
	 */
	protected static Calendar buildCalendar(int year,int month,int date,boolean clearTime){
		Calendar cal = Calendar.getInstance();
		if(clearTime)
			resetCalendar(cal);
		if(year!=-1)
			cal.set(Calendar.YEAR,year);
		if(month!=-1)
			cal.set(Calendar.MONTH,month-1);
		if(date!=-1)
			cal.set(Calendar.DATE,date);
		return cal;
	}
	/**
	 * 读取草稿的详细信息
	 * @param ssn
	 * @param site
	 * @param draft_id
	 * @return
	 * @throws HibernateException
	 */
	public static DraftForm getDraft(Session ssn, SiteForm site, int draft_id) throws HibernateException
	{
		Criteria crit = ssn.createCriteria(DraftForm.class);
		crit = crit.add(Expression.eq("site.id", new Integer(site.getId())));
		crit = crit.add(Expression.eq("id", new Integer(draft_id)));
		DraftForm draft = null;
		List drafts = crit.list();
		if(drafts.size()>0)
		    draft = (DraftForm)drafts.get(0);
	    return draft;
	    
	}
	/**
	 * 列出某个网站的所有草稿信息
	 * @param ssn
	 * @param site
	 * @return
	 * @throws HibernateException
	 */
	public static List listDrafts(Session ssn, SiteForm site, UserForm loginUser) throws HibernateException{
	    if(loginUser==null || (!loginUser.isAdmin()&&!loginUser.isFriend()))
	        return new ArrayList();
		Criteria crit = ssn.createCriteria(DraftForm.class);
		crit = crit.add(Expression.eq("site.id", new Integer(site.getId())));
		//if(loginUser.isFriend())
		crit = crit.add(Expression.eq("owner.id",new Integer(loginUser.getId())));
	    crit = crit.addOrder(Order.desc("logTime"));
	    return crit.list();
	}
	
	/**
	 * 列出某个分类下的日志
	 * @param ssn
	 * @param site
	 * @param cat_id
	 * @param orderField
	 * @return
	 * @throws HibernateException
	 */
	public static List listLogs(Session ssn, SiteForm site, UserForm loginUser, int cat_id, int userid,int from, int count, String orderField, int year, int month, int date)
		throws HibernateException {
	    String hql = "FROM " + LogForm.class.getName() + " AS log WHERE log.site.id=? AND log.status=?";
	    if(cat_id!=-1)
	        hql += " AND log.category.id=?";
	    else
	        hql += " AND log.category.id<>?";
	    if(userid>0)
	        hql += " AND log.owner.id="+userid;
	    
	    if(loginUser!=null && loginUser.getUserRole()==DlogRole.ROLE_BUDDY){
	    	int[] cats = loginUser.getOwnerCatids();
	    	if(cats.length==0)
		        hql += " AND log.category.type<>" + CategoryForm.TYPE_OWNER;
	    	else{
		        hql += " AND (log.category.type<>" + CategoryForm.TYPE_OWNER;
		        for(int i=0;i<cats.length;i++){
		        	hql += " OR log.category.id=" + cats[i];
		        }
		        hql += ")";
	    	}
	    }
	    else
	    if(loginUser==null||!loginUser.isAdmin()) 
	        hql += " AND log.category.type<>" + CategoryForm.TYPE_OWNER;
	    
	    Calendar begin = null;
	    Calendar end = null;
	    boolean hasTime = false;
		if(year!=-1&&month!=-1&&date!=-1){//查询某天
			begin = buildCalendar(year,month,date,true);
			end = (Calendar)begin.clone();
			end.add(Calendar.DATE,1);
			hql += "  AND log.logTime>=? AND log.logTime<?";
			hasTime = true;
		}
		else
		if(year!=-1&&month!=-1){//查询某月
			begin = buildCalendar(year,month,1,true);			
			end = (Calendar)begin.clone();
			end.add(Calendar.MONTH,1);
			hql += "  AND log.logTime>=? AND log.logTime<?";
			hasTime = true;
		}
		else
		if(year!=-1){//查询某年
			begin = buildCalendar(year,1,1,true);			
			end = (Calendar)begin.clone();
			end.add(Calendar.YEAR,1);
			hql += "  AND log.logTime>=? AND log.logTime<?";
			hasTime = true;
		}		
		if(StringUtils.isEmpty(orderField))
			orderField = "logTime"; 
		hql += " ORDER BY log." + orderField + " DESC";
		Query query = ssn.createQuery(hql);
		query.setInteger(0,site.getId());
		query.setInteger(1,LogForm.STATUS_NORMAL);
		query.setInteger(2,cat_id);
		if(hasTime){
		    query.setCalendar(3,begin);
		    query.setCalendar(4,end);
		}
		query.setFirstResult(from);
		query.setMaxResults(count);
		return query.list();
	    
	}
	
	/**
	 * 获取某个日记分类下的日记数
	 * @param ssn
	 * @param cat_id
	 * @return
	 * @throws HibernateException
	 */
	public static int getLogCount(Session ssn, int cat_id) throws HibernateException{
		Query q2 = ssn.createQuery("SELECT COUNT(*) FROM "+LogForm.class.getName()+" AS log WHERE log.category.id=?");
		q2.setInteger(0, cat_id);
		List res = q2.list();
		return (res.size()>0)?((Integer)res.get(0)).intValue():0;
	}
	
	/**
	 * 获取日记总数
	 * @param ssn
	 * @param site
	 * @param cat_id 指定某个日记分类
	 * @return
	 */
	public static int getLogCount(Session ssn, SiteForm site, UserForm loginUser, int cat_id, int userid, int year, int month, int date)
		throws HibernateException {
	    String hql = "SELECT COUNT(*) FROM " + LogForm.class.getName() + " AS log WHERE log.site.id=? AND log.status=?";
	    if(cat_id!=-1)
	        hql += " AND log.category.id=?";
	    else
	        hql += " AND log.category.id<>?";
	    if(userid>0)
	        hql += " AND log.owner.id="+userid;
	    
	    if(loginUser!=null && loginUser.getUserRole()==DlogRole.ROLE_BUDDY){
	    	int[] cats = loginUser.getOwnerCatids();
	    	if(cats.length==0)
		        hql += " AND log.category.type<>" + CategoryForm.TYPE_OWNER;
	    	else{
		        hql += " AND (log.category.type<>" + CategoryForm.TYPE_OWNER;
		        for(int i=0;i<cats.length;i++){
		        	hql += " OR log.category.id=" + cats[i];
		        }
		        hql += ")";
	    	}
	    }
	    else
	    if(loginUser==null||!loginUser.isAdmin()) 
	        hql += " AND log.category.type<>" + CategoryForm.TYPE_OWNER;
	    
	    
	    Calendar begin = null;
	    Calendar end = null;
	    boolean hasTime = false;
		if(year!=-1&&month!=-1&&date!=-1){//查询某天
			begin = buildCalendar(year,month,date,true);
			end = (Calendar)begin.clone();
			end.add(Calendar.DATE,1);
			hql += "  AND log.logTime>=? AND log.logTime<?";
			hasTime = true;
		}
		else
		if(year!=-1&&month!=-1){//查询某月
			begin = buildCalendar(year,month,1,true);			
			end = (Calendar)begin.clone();
			end.add(Calendar.MONTH,1);
			hql += "  AND log.logTime>=? AND log.logTime<?";
			hasTime = true;
		}
		else
		if(year!=-1){//查询某年
			begin = buildCalendar(year,1,1,true);			
			end = (Calendar)begin.clone();
			end.add(Calendar.YEAR,1);
			hql += "  AND log.logTime>=? AND log.logTime<?";
			hasTime = true;
		}		
		Query query = ssn.createQuery(hql);
		query.setInteger(0,site.getId());
		query.setInteger(1,LogForm.STATUS_NORMAL);
		query.setInteger(2,cat_id);
		if(hasTime){
		    query.setCalendar(3,begin);
		    query.setCalendar(4,end);
		}
		List res = query.list();
		int logcount = (res.size() > 0) ? ((Integer) res.get(0)).intValue() : 0;
	    return logcount;
	}
}
