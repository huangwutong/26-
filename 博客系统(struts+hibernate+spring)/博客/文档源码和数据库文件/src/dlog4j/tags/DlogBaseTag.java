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

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.TagSupport;
import javax.sql.DataSource;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.SessionFactory;

import org.apache.struts.Globals;

import dlog4j.SiteManager;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;

/**
 * 所有用于操作数据的标签库的基类
 * @author Liudong
 */
public class DlogBaseTag extends TagSupport {

	protected String id = null;
	
	public String getParameter(String param) {
	    return pageContext.getRequest().getParameter(param);
	}
	
	public boolean isPost() {
	    HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
	    return "POST".equalsIgnoreCase(req.getMethod());
	}

	public String getId() {
		return (this.id);
	}

	public void setId(String id) {
		this.id = id;
	}
	/**
	 * 获取参数，没有没有指定该参数则使用缺省值
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	protected String getParameter(String param,String defaultValue) {
	    String value = getParameter(param);
	    if(value==null)
	        value = defaultValue;
	    return value;
	}
	/**
	 * 获取当前正在访问的子站点
	 * @return
	 */
	protected SiteForm getCurrentSite(){
		return SiteManager.getCurrentSite(pageContext.getRequest());
	}
	/**
	 * 返回当前的登录用户实例
	 * @param request
	 * @return
	 */
	protected UserForm getLoginUser(){
		return UserForm.getLoginUser((HttpServletRequest)pageContext.getRequest());	
	}
	/**
	 * 提交Hibernate操作
	 * @param session
	 * @throws SQLException
	 * @throws HibernateException
	 */
	protected void commitSession(Session session, boolean close) throws SQLException, HibernateException{
		session.flush();
		session.connection().commit();
		if(close){
			session.connection().close();
			session.close();
		}			
	}
	/**
	 * 返回Hibernate操作的实例
	 * @return
	 * @throws SQLException
	 */
	protected Session getSession() throws SQLException{
		ServletContext context = pageContext.getServletContext();
		SessionFactory sessions = (SessionFactory)context.getAttribute(dlog4j.Globals.HIBERNATE_SESSIONS_KEY);
		return sessions.openSession(getConnection());
	}
	/**
	 * 获取数据库连接
	 * @return
	 * @throws SQLException
	 */
	public Connection getConnection() throws SQLException{
		ServletContext context = pageContext.getServletContext();
		DataSource dataSource = (DataSource)context.getAttribute(Globals.DATA_SOURCE_KEY);
		return dataSource.getConnection();		
	}
	/**
	 * 关闭session
	 * @param session
	 */
	protected void close(Session session){
	    try {
	        session.connection().close();
	    }catch(Exception e) {}
	    try {
	        session.close();
	    }catch(Exception e) {}
	}
	/**
	 * 关闭session
	 * @param session
	 * @throws SQLException
	 * @throws HibernateException
	 */
	protected void closeSession(Session session) throws SQLException,HibernateException{
		session.connection().close();
		session.close();
	}

	public static void close(Object obj1,Object obj2,Object obj3){
		close(obj1);close(obj2);close(obj3);
	}
	/**
	 * 资源释放
	 * @param obj
	 */
	public static void close(Object obj){
		if(obj==null)
			return;
		try{
			if(obj instanceof Connection)
				((Connection)obj).close();
			if(obj instanceof Statement)
				((Statement)obj).close();
			if(obj instanceof ResultSet)
				((ResultSet)obj).close();
		}catch(Exception e){}
		obj = null;
	}
}
