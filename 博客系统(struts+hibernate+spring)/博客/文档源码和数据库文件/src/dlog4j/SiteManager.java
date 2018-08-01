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

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import net.sf.hibernate.Criteria;
import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.expression.Expression;
import net.sf.hibernate.expression.Order;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import dlog4j.formbean.LogForm;
import dlog4j.formbean.ReplyForm;
import dlog4j.formbean.SiteForm;

/**
 * @author Liudong
 * 用于管理子站点的类,例如通过它来获取当前正在访问的站点
 */
public class SiteManager extends ManagerBase{

    final static Log log = LogFactory.getLog(SiteManager.class);
    /**
     * 列出所有的个人Dlog,注意:不包括id=0的dlogcn这条记录
     * @param ssn
     * @param status 只列出status值为该参数值的个人Dlog,如果该值为-1则列出所有的个人Dlog
     * @return
     * @throws HibernateException
     */
    public static List listSites(Session ssn, int status, int count) throws HibernateException{
        List sites = new ArrayList();
        String hql = "FROM "+SiteForm.class.getName()+" AS s WHERE s.id>0";
        if(status!=-1)
            hql += " AND s.status=" + status;
        Query q = ssn.createQuery(hql);
        if(count>0)
            q.setMaxResults(count);
        return q.list();
    }
    /**
     * 读取一个网站的详细信息
     * @param ssn
     * @param sitename
     * @return
     * @throws HibernateException
     */
    public static SiteForm loadSite(String sitename) throws HibernateException, SQLException{
	    SiteForm site = null;
        Session ssn = null;
        try {
            ssn = ManagerBase.getSession();
            return loadSite(ssn,sitename);
        }finally {
            close(ssn);
        }
    }
    /**
     * 读取一个网站的详细信息
     * @param ssn
     * @param sitename
     * @return
     * @throws HibernateException
     */
    public static SiteForm loadSite(Session ssn, String sitename) throws HibernateException{
	    Criteria crit = ssn.createCriteria(SiteForm.class);
	    crit = crit.add(Expression.eq("name",sitename));
	    Iterator sites = crit.list().iterator();
	    SiteForm site = null;
	    if(sites.hasNext())
	        site = (SiteForm)sites.next();
	    return site;
    }
    /**
     * 读取一个网站的详细信息
     * @param ssn
     * @param id
     * @return
     * @throws HibernateException
     */
    public static SiteForm loadSite(int id) throws HibernateException, SQLException{
	    SiteForm site = null;
        Session ssn = null;
        try {
            ssn = ManagerBase.getSession();
            return loadSite(ssn,id);
        }finally {
            close(ssn);
        }
    }
    /**
     * 读取一个网站的详细信息
     * @param ssn
     * @param id
     * @return
     * @throws HibernateException
     */
    public static SiteForm loadSite(Session ssn, int id) throws HibernateException{
	    Criteria crit = ssn.createCriteria(SiteForm.class);
	    crit = crit.add(Expression.eq("id",new Integer(id)));
	    Iterator sites = crit.list().iterator();
	    SiteForm site = null;
	    if(sites.hasNext())
	        site = (SiteForm)sites.next();
	    return site;
    }
	/**
	 * 获取当前正在访问的站点信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public static SiteForm getCurrentSite(ServletRequest request){	    
	    HttpServletRequest req = (HttpServletRequest)request;
        SiteForm site = (SiteForm)req.getSession().getAttribute(SiteForm.class.getName());
		if(site==null){
		    //如果指定了log_id参数则读取该log对应的site
		    Session ssn = null;
		    try {
				site = SiteManager.loadSite(1);
				if(site!=null)
					req.getSession().setAttribute(SiteForm.class.getName(), site);
		    }catch(SQLException e) {
		        log.error("获取当前访问的SiteForm实例失败",e);
		    }catch(HibernateException e) {
		        log.error("获取当前访问的SiteForm实例失败",e);		        
		    }finally {
		        if(ssn!=null)
		            close(ssn);
		    }
		}
		return site;
	}
	public static int[] statSiteLogs(ServletRequest req, int year, int month) throws HibernateException, SQLException{
	    Session ssn = null;
	    try {
	        ssn = getSession();
	        return statSiteLogs(ssn,getCurrentSite(req),year,month);
	    }finally {
	        close(ssn);
	    }
	}
	protected static Calendar getFirstDate(Calendar cal) {
	    Calendar month = null;
	    if(cal==null)
	        month = Calendar.getInstance();
	    else
	        month = (Calendar)cal.clone();
	    month.set(Calendar.HOUR_OF_DAY,0);
	    month.set(Calendar.MINUTE,0);
	    month.set(Calendar.SECOND,0);
	    month.set(Calendar.MILLISECOND,0);
	    month.set(Calendar.DATE,1);
	    return month;
	}
	protected static Calendar getLastDate(Calendar cal) {
	    Calendar month = null;
	    if(cal==null)
	        month = Calendar.getInstance();
	    else
	        month = (Calendar)cal.clone();
	    month.add(Calendar.MONTH,1);
	    month.set(Calendar.DATE,1);
	    month.set(Calendar.HOUR_OF_DAY,0);
	    month.set(Calendar.MINUTE,0);
	    month.set(Calendar.SECOND,0);
	    month.set(Calendar.MILLISECOND,0);
	    return month;
	}
	/**
	 * 某年某月的网站日记数统计
	 * @param ssn
	 * @param site
	 * @param year
	 * @param month
	 * @return
	 * @throws HibernateException
	 */
	public static int[] statSiteLogs(Session ssn, SiteForm site, int year, int month) throws HibernateException{
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.YEAR,year);
	    cal.set(Calendar.MONTH,month-1);
	    Calendar from = getFirstDate(cal);
	    Calendar to = getLastDate(cal);
	    Criteria crit = ssn.createCriteria(LogForm.class);
	    if(site!=null)
	        crit = crit.add(Expression.eq("site.id",new Integer(site.getId())));
	    crit = crit.add(Expression.between("logTime",from.getTime(),to.getTime()));
	    crit = crit.add(Expression.lt("logTime",to.getTime()));
	    crit = crit.addOrder(Order.asc("logTime"));
	    List datas = crit.list();
	    int dc = from.getActualMaximum(Calendar.DAY_OF_MONTH);
	    int[] logs = new int[dc];
	    for(int i=0;i<datas.size();i++) {
	        LogForm sb = (LogForm)datas.get(i);
	        cal.setTime(sb.getLogTime());
	        logs[cal.get(Calendar.DATE)-1] ++;
	    }
	    return logs;
	}
	public static int[] statSiteReplies(ServletRequest req, int year, int month) throws HibernateException, SQLException{
	    Session ssn = null;
	    try {
	        ssn = getSession();
	        return statSiteReplies(ssn,getCurrentSite(req),year,month);
	    }finally {
	        close(ssn);
	    }
	}
	/**
	 * 某年某月的网站评论数统计
	 * @param ssn
	 * @param site
	 * @param year
	 * @param month
	 * @return
	 * @throws HibernateException
	 */
	public static int[] statSiteReplies(Session ssn, SiteForm site, int year, int month) throws HibernateException{
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.YEAR,year);
	    cal.set(Calendar.MONTH,month-1);
	    Calendar from = getFirstDate(cal);
	    Calendar to = getLastDate(cal);
	    Criteria crit = ssn.createCriteria(ReplyForm.class);
	    if(site!=null)
	        crit = crit.add(Expression.eq("site.id",new Integer(site.getId())));
	    crit = crit.add(Expression.between("writeTime",from.getTime(),to.getTime()));
	    crit = crit.add(Expression.lt("writeTime",to.getTime()));
	    crit = crit.addOrder(Order.asc("writeTime"));
	    List datas = crit.list();
	    int dc = from.getActualMaximum(Calendar.DAY_OF_MONTH);
	    int[] replies = new int[dc];
	    for(int i=0;i<datas.size();i++) {
	        ReplyForm sb = (ReplyForm)datas.get(i);
	        cal.setTime(sb.getWriteTime());
	        replies[cal.get(Calendar.DATE)-1] ++;
	    }
	    return replies;
	}
	public static void main(String[] args) throws Exception{
	    Calendar cal = Calendar.getInstance();
	    System.out.println(getFirstDate(cal).getTime());
	    System.out.println(getLastDate(cal).getTime());
	}

}
