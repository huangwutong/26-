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
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import dlog4j.CategoryManager;
import dlog4j.Globals;
import dlog4j.LogManager;
import dlog4j.SiteManager;
import dlog4j.formbean.CategoryForm;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;

/**
 * @author Liudong
 * 读取所有日志分类的标签库
 * 如果请求中包含cat_id的参数则读取其对应的日记分类对象并输出
 */
public class CategoryTag extends DlogBaseTag {

	String catid = null;
	/**
	 * 如果指定了security值则需要对用户的权限进行控制,判断那些目录对用户是可见的
	 * 否则只对那些类型为TYPE_OWNER进行控制
	 */
	boolean security = false;
	
	boolean sortByNewest = false;
	
	boolean withLogCount = false;
	
	boolean addLog = false;
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		if(pageContext.getAttribute(id)==null){		
			Session session = null;
			List categories = null;
			try{
				session = getSession();
				SiteForm site = SiteManager.getCurrentSite(pageContext.getRequest());
				UserForm user = UserForm.getLoginUser((HttpServletRequest)pageContext.getRequest());
				if(addLog)
					categories = CategoryManager.listCategoriesForModify(session,site,user);
				else
					categories = CategoryManager.listCategories(session,site,user);
				Iterator cs = categories.iterator();
				while(cs.hasNext()){
					CategoryForm cat = (CategoryForm)cs.next();
					if(withLogCount)
					    cat.setLogCount(LogManager.getLogCount(session,site,user,cat.getId(),-1,-1,-1,-1));
				}
				int categoryId = -1;
				try{
					categoryId = Integer.parseInt(pageContext.getRequest().getParameter(Globals.PARAM_CATEGORYID));
				}catch(Exception e){}
				for(int i=0;catid!=null&&i<categories.size();i++){
					CategoryForm cat = (CategoryForm)categories.get(i);
					if(cat.getId()==categoryId){
						pageContext.setAttribute(catid,cat);
						break;
					}
				}
			}catch(SQLException e){
				throw new JspException(e);
			}catch(HibernateException e){
				throw new JspException(e);
			}finally{		
				try{
					closeSession(session);
				}catch(Exception e){}
			}
			pageContext.setAttribute(id,categories);
		}
		return SKIP_BODY;
	}

    public int doEndTag() throws JspException {
        release();
        return EVAL_PAGE;
    }
    public void release() {
    	catid = null;
    	security = false;
    	
    	withLogCount = false;
    }
	/**
	 * @return
	 */
	public String getCatid() {
		return catid;
	}

	/**
	 * @param string
	 */
	public void setCatid(String string) {
		catid = string;
	}

	/**
	 * @return
	 */
	public boolean isSecurity() {
		return security;
	}

	/**
	 * @param b
	 */
	public void setSecurity(boolean b) {
		security = b;
	}

    public boolean isWithLogCount() {
        return withLogCount;
    }
    public void setWithLogCount(boolean withLogCount) {
        this.withLogCount = withLogCount;
    }
	public boolean isSortByNewest() {
		return sortByNewest;
	}
	public void setSortByNewest(boolean sortByNewest) {
		this.sortByNewest = sortByNewest;
	}
	public boolean isAddLog() {
		return addLog;
	}
	public void setAddLog(boolean addLog) {
		this.addLog = addLog;
	}
}
