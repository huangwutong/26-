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

import java.sql.SQLException;
import java.util.List;

import javax.servlet.jsp.JspException;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import dlog4j.ParamManager;
import dlog4j.SiteManager;
import dlog4j.UserManager;
import dlog4j.formbean.SiteForm;

/**
 * @author Liudong
 * 最新注册成员列表
 */
public class MemberTag extends DlogBaseTag {

    public final static String USERS_PER_PAGE = "USERS_PER_PAGE";
    
	int count = -1;
	int page = -1;	//当前页
	int role = -2;
	String usersPageId = MemberTei.PER_COUNT;
	String pageCountId = MemberTei.PAGE_COUNT;
	String userCountId = MemberTei.USER_COUNT;
	String curPageId = MemberTei.CUR_PAGE_COUNT;
	boolean query = true;

    public int doEndTag() throws JspException {
        release();
        return EVAL_PAGE;
    }
    public void release() {
    	count = -1;
    	page = -1;	//当前页
    	role = -2;
    }
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
    public int doStartTag() throws JspException {
		Session session = null;
		List users = null;
		String query_key = null;	
		if(query)
			query_key = getParameter("query"); 
		try {
			session = getSession();
			SiteForm site = SiteManager.getCurrentSite(pageContext.getRequest());
			//用户总数
			int userCount = UserManager.getUserCount(session,site,role,query_key);
			pageContext.setAttribute(userCountId,new Integer(userCount));
			//每页用户数
			int usersPage = ParamManager.getIntParam(session,site,USERS_PER_PAGE,10);
			pageContext.setAttribute(usersPageId,new Integer(usersPage));
			//页数
			int pageCount = (userCount / usersPage) + (((userCount % usersPage)>0)?1:0);
			pageContext.setAttribute(pageCountId,new Integer(pageCount));
			//当前页
			pageContext.setAttribute(curPageId, new Integer(page));
			//读取用户列表
			int from = page-1;
			if(from<0)
			    from = 0;
			if(from>pageCount)
			    from = pageCount;
			from *= usersPage;
			int uc = (count==-1)?usersPage:count;
			users = UserManager.listUsers(session,site,from,uc,query_key);
			pageContext.setAttribute(id, users);
		} catch (SQLException e) {
			throw new JspException(e);
		} catch (HibernateException e) {
			throw new JspException(e);
		} finally {
			try {
				closeSession(session);
			} catch (Exception e) {
			}
		}
		return SKIP_BODY;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int i) {
		count = i;
	}

    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public void setPage(String page) {        
        this.page = Integer.parseInt(page);
    }
    public void setPage(Integer page) {
        this.page = page.intValue();
    }
    public String getPageCountId() {
        return pageCountId;
    }
    public void setPageCountId(String pageCountId) {
        this.pageCountId = pageCountId;
    }
    public String getUserCountId() {
        return userCountId;
    }
    public void setUserCountId(String userCountId) {
        this.userCountId = userCountId;
    }
    public String getUsersPageId() {
        return usersPageId;
    }
    public void setUsersPageId(String usersPageId) {
        this.usersPageId = usersPageId;
    }
    public int getRole() {
        return role;
    }
    public void setRole(int role) {
        this.role = role;
    }
    public String getCurPageId() {
        return curPageId;
    }
    public void setCurPageId(String curPageId) {
        this.curPageId = curPageId;
    }
	public boolean isQuery() {
		return query;
	}
	public void setQuery(boolean query) {
		this.query = query;
	}
}
