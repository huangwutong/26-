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
package dlog4j.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dlog4j.Globals;
import dlog4j.formbean.UserForm;

import web.struts.ActionExtend;
import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.SessionFactory;

/**
 * DLOG项目的基础Action类
 * @author Liudong
 */
public abstract class DlogActionBase extends ActionExtend {

	/**
	 * 该方法覆盖了父类的功能，主要是为了resin 3.0.x的兼容性做了改进
	 * 对于其他应用服务器并没有影响，同时统一了formbean的自动validate功能
	 * 要求所有的action都必须关闭自动validate功能，而在此处进行统一处理
	 * Action类执行入口
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception 
	{
		ActionForward forward = null;
		//统一validate
		if(form!=null){
			ActionErrors errors = form.validate(mapping, req);
			if(errors!=null && !errors.isEmpty()){
				saveErrors(req, errors);
				forward = mapping.getInputForward();
			}
		}
		if(forward==null)
			forward = super.execute(mapping,form,req,res);
		//处理resin 3.0.x 的兼容性问题 -> jspe小服务程序
		if(!forward.getRedirect()){
			//传递要forward的路径给jspe小服务程序
			req.setAttribute(Globals.ACTION_PATH_KEY, forward.getPath());
		}
		return forward;
	}

	/**
	 * 获取当前操作用户的信息
	 * @param req
	 * @return
	 */
	public static UserForm getLoginUser(HttpServletRequest req){
		return UserForm.getLoginUser(req);
	}
    /**
     * 获取Hibernate持久层的操作实例
     * @return
     */
    protected Session getSession() throws SQLException{
        ServletContext context = servlet.getServletContext();
        SessionFactory sessions = (SessionFactory)context.getAttribute(dlog4j.Globals.HIBERNATE_SESSIONS_KEY);
        return sessions.openSession(getConnection());
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
     * 关闭session
     * @param session
     * @throws SQLException
     * @throws HibernateException
     */
    protected void closeSession(Session session) throws SQLException,HibernateException{
    	session.connection().close();
    	session.close();
    }
    
    /**
     * 一般用于释放数据库资源，例如 close(ps,conn);
     * @param obj1
     * @param obj2
     */
	public static void close(Object obj1,Object obj2){
		close(obj1);
		close(obj2);
	}
	
	/**
	 * 一般用于释放数据库资源，例如 close(rs,ps,conn);
	 * @param obj1
	 * @param obj2
	 * @param obj3
	 */
	public static void close(Object obj1,Object obj2,Object obj3){
		close(obj1);
		close(obj2);
		close(obj3);
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
			else
			if(obj instanceof Statement)
				((Statement)obj).close();
			else
			if(obj instanceof ResultSet)
				((ResultSet)obj).close();
			else
			if(obj instanceof Session){
				Session snn = (Session)obj;
				snn.connection().close();
				snn.close();
			}
		}catch(Exception e){}
		obj = null;
	}

}
