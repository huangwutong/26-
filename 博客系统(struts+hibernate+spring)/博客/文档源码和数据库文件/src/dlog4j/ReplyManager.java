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
import dlog4j.formbean.LogForm;
import dlog4j.formbean.ReplyForm;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;
import dlog4j.search.SearchProxy;
/**
 * @author Liudong 评论管理
 */
public class ReplyManager {

    public final static String FIELD_WRITETIME = "writeTime";
	/**
	 * 读取指定的评论信息
	 * @param ssn
	 * @param site
	 * @param loginUser
	 * @param log_id
	 * @return
	 */
	public static ReplyForm getLogForm(Session ssn, SiteForm site, UserForm loginUser, int log_id)
	{
		ReplyForm reply = null;
		try{
			reply = (ReplyForm)ssn.load(ReplyForm.class, new Integer(log_id));
			if(reply!=null && reply.getSite().getId()!=site.getId())
				reply = null;
			if(reply!=null)
				reply = null;
		}catch(HibernateException e){}
		return reply;
	}
	
	/**
	 * 统计出指定月份每天的评论篇数
	 * @param ssn
	 * @param site
	 * @param year
	 * @param month (1-12)
	 * @return
	 * @throws HibernateException
	 */
	public static int[] statReplies(Session ssn, SiteForm site, UserForm loginUser, int year, int month) throws HibernateException
	{
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		return statReplies(ssn,site,loginUser,cal);
	}
	
	public static int[] statReplies(Session ssn, SiteForm site, UserForm loginUser, Calendar month) throws HibernateException{
		
		Calendar firstDate = (Calendar)month.clone();
		firstDate.set(Calendar.DATE,1);
		resetCalendar(firstDate);
		Calendar nextMonthFirstDate = (Calendar)firstDate.clone();
		nextMonthFirstDate.add(Calendar.MONTH,1);
		
		//计算指定月份有多少天
		Calendar tempCal = (Calendar)nextMonthFirstDate.clone();
		tempCal.add(Calendar.DATE,-1);
		int dateCount = tempCal.get(Calendar.DATE);
		
		int[] replyCounts = new int[dateCount];
		
		//查询出当月的所有日记进行统计

		Criteria crit = ssn.createCriteria(ReplyForm.class).add(Expression.eq("site.id", new Integer(site.getId())));
		crit = crit.addOrder(Order.asc(FIELD_WRITETIME)); 
		crit = crit.add(Expression.ge(FIELD_WRITETIME,firstDate.getTime()));
		crit = crit.add(Expression.lt(FIELD_WRITETIME,nextMonthFirstDate.getTime()));
		
		Iterator replyies = crit.list().iterator();
		while(replyies.hasNext()){
			ReplyForm reply = (ReplyForm)replyies.next();
			if(loginUser==null)
				continue;
			tempCal.setTime(reply.getWriteTime());
			int date = tempCal.get(Calendar.DATE) - 1;
			replyCounts[date]++;
		}
		
		return replyCounts;
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
     * 搜索符合条件的所有评论
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
    public static List searchAllReplies(Session ssn, SiteForm site, UserForm loginUser, int cat_id, String search, String orderField) throws HibernateException, IOException, ParseException
    {        
        List logs = new ArrayList();
        SearchProxy proxy = SearchProxy.getReplyQuery();
        List ids = proxy.searchFor(site.getId(),cat_id,search,0,-1);
        if(ids.size()>0) {
            Criteria crit = ssn.createCriteria(ReplyForm.class).add(Expression.eq("site.id", new Integer(site.getId())));
            crit = crit.add(Expression.in("id",ids));
    		if(StringUtils.isEmpty(orderField))
    			orderField = "writeTime"; 
    		crit = crit.addOrder(Order.desc(orderField));
            logs = crit.list();
            //过滤掉没有权限的日记分类
            Iterator ls = logs.iterator();
            while(ls.hasNext()) {
                ReplyForm reply = (ReplyForm)ls.next();
                if(reply.getLog().getStatus()!=LogForm.STATUS_NORMAL)
                    ls.remove();
                if(loginUser==null||!loginUser.isAdmin()) {
                    if(reply.getLog().getCategory().getType()==CategoryForm.TYPE_OWNER) {
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
	 * 获取查询到的评论信息的总数,用于分页
	 * @deprecated 由searchAllReplies替换
	 * @param ssn
	 * @param site
	 * @param loginUser
	 * @param cat_id
	 * @param userid
	 * @param search
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 * @throws HibernateException
	 */
	public static int getSearchReplyCount(Session ssn, SiteForm site, UserForm loginUser, int cat_id, int userid, String search) throws IOException, ParseException, HibernateException {
        SearchProxy proxy = SearchProxy.getReplyQuery();
        List ids = proxy.searchFor(site.getId(),cat_id,search,0,-1);
        if(ids.size()==0)
            return 0;
        Criteria crit = ssn.createCriteria(ReplyForm.class).add(Expression.eq("site.id", new Integer(site.getId())));
        crit = crit.add(Expression.in("id",ids));
        List replies = crit.list();
        //过滤掉没有权限的日记分类
        Iterator ls = replies.iterator();
        while(ls.hasNext()) {
            ReplyForm reply = (ReplyForm)ls.next();
    	    if(loginUser==null||!loginUser.isAdmin()) {
    	        if(reply.getLog().getCategory().getType()==CategoryForm.TYPE_OWNER)
    	            ls.remove();
    	    }
        }
        int rc = replies.size();
        replies.clear();
        return rc;
	}
	/**
	 * 搜索评论信息
	 * @deprecated 由searchAllReplies替换
	 * @param ssn
	 * @param site
	 * @param loginUser
	 * @param cat_id
	 * @param userid
	 * @param search
	 * @param orderField
	 * @param from
	 * @param count
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 * @throws HibernateException
	 */
	public static List searchReplies(Session ssn, SiteForm site, UserForm loginUser, int cat_id, int userid, String search, String orderField,int from,int count) throws IOException, ParseException, HibernateException {
        SearchProxy proxy = SearchProxy.getReplyQuery();
        List ids = proxy.searchFor(site.getId(),cat_id,search,from,count);
        if(ids.size()==0)
            return new ArrayList();
        Criteria crit = ssn.createCriteria(ReplyForm.class).add(Expression.eq("site.id", new Integer(site.getId())));
        crit = crit.add(Expression.in("id",ids));
		if(StringUtils.isEmpty(orderField))
			orderField = FIELD_WRITETIME; 
        crit = crit.addOrder(Order.desc(orderField));
        /*
        if(from>=0)
            crit.setFirstResult(from);
        if(count>=0)
            crit.setMaxResults(count);
        */
        List replies = crit.list();
        //过滤掉没有权限的日记分类
        Iterator ls = replies.iterator();
        while(ls.hasNext()) {
            ReplyForm reply = (ReplyForm)ls.next();
    	    if(loginUser==null||!loginUser.isAdmin()) {
    	        if(reply.getLog().getCategory().getType()==CategoryForm.TYPE_OWNER)
    	            ls.remove();
    	    }
        }
        return replies;
	}
	/**
	 * 列出某个分类下的评论
	 * @param ssn
	 * @param site
	 * @param cat_id
	 * @param orderField
	 * @return
	 * @throws HibernateException
	 */
	public static List listReplies(Session ssn, SiteForm site, UserForm loginUser, int cat_id, int userid,  int from, int count, String orderField, int year, int month, int date)
		throws HibernateException {
	    String hql = "FROM " + ReplyForm.class.getName() + " AS reply WHERE reply.site.id=? ";
	    if(cat_id!=-1)
	        hql += " AND reply.log.category.id=?";
	    else
	        hql += " AND reply.log.category.id<>?";
	    if(userid>0)
	        hql += " AND reply.author.id="+userid;
	    if(loginUser==null||!loginUser.isAdmin()) 
	        hql += " AND reply.log.category.type<>" + CategoryForm.TYPE_OWNER;

		hql += " AND reply.log.status=?";
		
	    Calendar begin = null;
	    Calendar end = null;
	    boolean hasTime = false;
		if(year!=-1&&month!=-1&&date!=-1){//查询某天
			begin = buildCalendar(year,month,date,true);
			end = (Calendar)begin.clone();
			end.add(Calendar.DATE,1);
			hql += "  AND reply.writeTime>=? AND reply.writeTime<?";
			hasTime = true;
		}
		else
		if(year!=-1&&month!=-1){//查询某月
			begin = buildCalendar(year,month,1,true);			
			end = (Calendar)begin.clone();
			end.add(Calendar.MONTH,1);
			hql += "  AND reply.writeTime>=? AND reply.writeTime<?";
			hasTime = true;
		}
		else
		if(year!=-1){//查询某年
			begin = buildCalendar(year,1,1,true);			
			end = (Calendar)begin.clone();
			end.add(Calendar.YEAR,1);
			hql += "  AND reply.writeTime>=? AND reply.writeTime<?";
			hasTime = true;
		}		
		if(StringUtils.isEmpty(orderField))
			orderField = FIELD_WRITETIME; 
		hql += " ORDER BY reply." + orderField + " DESC";
		Query query = ssn.createQuery(hql);
		query.setInteger(0,site.getId());
		query.setInteger(1,cat_id);
		query.setInteger(2,LogForm.STATUS_NORMAL);
		if(hasTime){
		    query.setCalendar(3,begin);
		    query.setCalendar(4,end);
		}
		query.setFirstResult(from);
		if ( count > 0 ) {
			query.setMaxResults(count);
		}
		return query.list();
	    
	}
	
	
    /**
     * 列出最新的评论信息
     * 
     * @param ssn
     * @param site
     * @param count
     * @return @throws
     *         SQLException
     * @throws HibernateException
     */
    public static List listReplies(Session ssn, SiteForm site,
            UserForm loginUser, int count) throws HibernateException {
        String hql = "FROM " + ReplyForm.class.getName()
                + " AS r WHERE r.site.id=? AND r.log.status=?";
        if (loginUser == null || !loginUser.isAdmin())
                hql += " AND r.log.category.type<>?";
        hql += " ORDER BY r.writeTime DESC";
        Query query = ssn.createQuery(hql);
        query.setInteger(0, site.getId());
        query.setInteger(1, LogForm.STATUS_NORMAL);
        if (loginUser == null || !loginUser.isAdmin())
                query.setInteger(2, CategoryForm.TYPE_OWNER);
        if (count > 0) query.setMaxResults(count);
        return query.list();
    }
    
	/**
	 * 获取日记总数
	 * @param ssn
	 * @param site
	 * @param cat_id 指定某个日记分类
	 * @return
	 */
	public static int getRepliesCount(Session ssn, SiteForm site, UserForm loginUser, int cat_id, int userid ,  int year, int month, int date)
		throws HibernateException {
	    String hql = "SELECT COUNT(*) FROM " + ReplyForm.class.getName() + " AS reply WHERE reply.site.id=? ";
	    if(cat_id!=-1)
	        hql += " AND reply.log.category.id=?";
	    else
	        hql += " AND reply.log.category.id<>?";
	    if(userid>0)
	        hql += " AND reply.author.id="+userid;
	    if(loginUser==null||!loginUser.isAdmin()) 
	        hql += " AND reply.log.category.type<>" + CategoryForm.TYPE_OWNER;

		hql += " AND reply.log.status=?";
		
	    Calendar begin = null;
	    Calendar end = null;
	    boolean hasTime = false;
		if(year!=-1&&month!=-1&&date!=-1){//查询某天
			begin = buildCalendar(year,month,date,true);
			end = (Calendar)begin.clone();
			end.add(Calendar.DATE,1);
			hql += "  AND reply.writeTime>=? AND reply.writeTime<?";
			hasTime = true;
		}
		else
		if(year!=-1&&month!=-1){//查询某月
			begin = buildCalendar(year,month,1,true);			
			end = (Calendar)begin.clone();
			end.add(Calendar.MONTH,1);
			hql += "  AND reply.writeTime>=? AND reply.writeTime<?";
			hasTime = true;
		}
		else
		if(year!=-1){//查询某年
			begin = buildCalendar(year,1,1,true);			
			end = (Calendar)begin.clone();
			end.add(Calendar.YEAR,1);
			hql += "  AND reply.writeTime>=? AND reply.writeTime<?";
			hasTime = true;
		}		
		Query query = ssn.createQuery(hql);
		query.setInteger(0,site.getId());
		query.setInteger(1,cat_id);
		query.setInteger(2,LogForm.STATUS_NORMAL);
		if(hasTime){
		    query.setCalendar(3,begin);
		    query.setCalendar(4,end);
		}
		List res = query.list();
		int Replycount = (res.size() > 0) ? ((Integer) res.get(0)).intValue() : 0;
	    return Replycount;
	}
}
