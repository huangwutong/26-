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
package dlog4j.tags;

import java.util.List;

import javax.servlet.jsp.JspException;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import dlog4j.Globals;
import dlog4j.LogManager;
import dlog4j.formbean.CategoryForm;
import dlog4j.formbean.LogForm;
import dlog4j.formbean.ReplyForm;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.TrackBackForm;
import dlog4j.formbean.UserForm;

/**
 * @author Liudong
 * 用于查询日志的详细信息
 */
public class LogTag extends DlogBaseTag {

	private boolean withReplies = false;
	private int logId = -1;
	private String nextid = null;
	private String previd = null;

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		int log_id = logId;
		if (log_id == -1)
			try {
				String sLogid = pageContext.getRequest().getParameter(Globals.PARAM_LOG);
				int idx = sLogid.indexOf('#');
				if(idx!=-1)
					sLogid = sLogid.substring(0,idx);
				log_id = Integer.parseInt(sLogid);
			} catch (Exception e) {}
		int cat_id = -1;
		try {
		    cat_id = Integer.parseInt(pageContext.getRequest().getParameter(Globals.PARAM_CATEGORYID));
		}catch(Exception e) {}
		
		if (log_id >= 0) {
			SiteForm site = getCurrentSite();
			Session ssn = null;
			try {
				ssn = getSession();
				
				UserForm loginUser = getLoginUser();				
				LogForm log = LogManager.getLogForm(ssn,site,loginUser,log_id);
				if (log != null){
					//读取TrackBacks
					Query q = ssn.createQuery("FROM "+TrackBackForm.class.getName()+" AS t WHERE t.log.id=? ORDER BY t.refTime DESC");
					q.setInteger(0,log_id);
					log.setTrackBacks(q.list());
				}
				if (log != null && withReplies) {
					if(getToken(log_id)==null){
						saveToken(log_id);
						log.setViewCount(log.getViewCount()+1);
						ssn.update(log);
					}
				    Query q = ssn.createQuery("FROM " + ReplyForm.class.getName() + " AS r WHERE r.log.id=? ORDER BY r.writeTime");
				    q.setInteger(0,log_id);
					log.setReplies(q.list());
					//加载前一个日志
					String hql = "FROM "+LogForm.class.getName()+" AS log WHERE log.id<? AND log.status=? AND log.site.id=?";					
					hql += " AND log.category.type<>?";
					if(cat_id!=-1)
					    hql += " AND log.category.id=?";
					hql += " ORDER BY log.logTime DESC";
					Query q1 = ssn.createQuery(hql);
					q1.setInteger(0,log_id);
					q1.setInteger(1,LogForm.STATUS_NORMAL);
					q1.setInteger(2,site.getId());
					if(loginUser==null||!loginUser.isAdmin())
					    q1.setInteger(3, CategoryForm.TYPE_OWNER);
					else
					    q1.setInteger(3, Integer.MIN_VALUE);
					if(cat_id!=-1)
					    q1.setInteger(4, cat_id);
					q1.setMaxResults(1);
					List pls = q1.list();
					//List pls = ssn.createCriteria(LogForm.class).add(Expression.lt("id",new Integer(log_id))).add(Expression.not(Expression.eq("status",new Integer(LogForm.STATUS_DELETED)))).addOrder(Order.desc("logTime")).setMaxResults(1).list();
					if(pls.size()>0)
						pageContext.setAttribute(previd, pls.get(0));
					//加载后一个日志
					hql = "FROM "+LogForm.class.getName()+" AS log WHERE log.id>? AND log.status=? AND log.site.id=?";					
					hql += " AND log.category.type<>?";
					if(cat_id!=-1)
					    hql += " AND log.category.id=?";
					hql += " ORDER BY log.logTime";
					Query q2 = ssn.createQuery(hql);
					q2.setInteger(0,log_id);
					q2.setInteger(1,LogForm.STATUS_NORMAL);
					q2.setInteger(2,site.getId());
					if(loginUser==null||!loginUser.isAdmin())
					    q2.setInteger(3, CategoryForm.TYPE_OWNER);
					else
					    q2.setInteger(3, Integer.MIN_VALUE);
					if(cat_id!=-1)
					    q2.setInteger(4, cat_id);
					q2.setMaxResults(1);
					List nls = q2.list();
					//List nls = ssn.createCriteria(LogForm.class).add(Expression.gt("id",new Integer(log_id))).add(Expression.not(Expression.eq("status",new Integer(LogForm.STATUS_DELETED)))).addOrder(Order.asc("logTime")).setMaxResults(1).list();
					if(nls.size()>0)
						pageContext.setAttribute(nextid, nls.get(0));
				}
				if (log != null)
					pageContext.setAttribute(id, log);
				
			} catch (HibernateException e) {
				throw new JspException(e);
			} catch (Exception e) {
				throw new JspException(e);
			} finally {
				try {
					commitSession(ssn,true);
				} catch (Exception e) {}
			}
		}
		return SKIP_BODY;
	}
	
	protected void saveToken(int log_id){
		pageContext.getSession().setAttribute("VIEW_LOG_"+log_id, String.valueOf(log_id));
	}
	
	protected String getToken(int log_id){
		return (String)pageContext.getSession().getAttribute("VIEW_LOG_"+log_id);
	}

    public int doEndTag() throws JspException {
        release();
        return EVAL_PAGE;
    }
    public void release() {
    	withReplies = false;
    	logId = -1;
    	nextid = null;
    	previd = null;
    }
	/**
	 * @return
	 */
	public boolean isWithReplies() {
		return withReplies;
	}

	/**
	 * @param b
	 */
	public void setWithReplies(boolean b) {
		withReplies = b;
	}

	/**
	 * @return
	 */
	public int getLogId() {
		return logId;
	}

	/**
	 * @param i
	 */
	public void setLogId(int i) {
		logId = i;
	}

	/**
	 * @return
	 */
	public String getNextid() {
		return nextid;
	}

	/**
	 * @return
	 */
	public String getPrevid() {
		return previd;
	}

	/**
	 * @param string
	 */
	public void setNextid(String string) {
		nextid = string;
	}

	/**
	 * @param string
	 */
	public void setPrevid(String string) {
		previd = string;
	}

}
