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
package dlog4j.formbean;

import java.io.Serializable;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;

import web.struts.ActionFormExtend;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.SessionFactory;

/**
 * Dlog系统的扩展ActioForm
 * Dlog系统中的所有的formBean都必须扩展该类而不是ActionForm
 * 2004-2-29 21:23 修正了时间显示12小时制为24小时制
 * @author Liudong
 */
public abstract class DlogActionForm extends ActionFormExtend implements Serializable{

	public final static DateFormat df1 = new SimpleDateFormat("yyyy-M-d H:mm:ss");
	public final static DateFormat df2 = new SimpleDateFormat("yyyy-M-d");
	public final static DateFormat df3 = new SimpleDateFormat("H:mm:ss");

	protected boolean isToday(Date date){
		return df2.format(new Date()).equals(df2.format(date));
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
        if(close)
            session.close();			
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
	
	public static void main(String[] args) {
	    System.out.println(df1.format(new Date()));
	    System.out.println(df2.format(new Date()));
	    System.out.println(df3.format(new Date()));
	}
	
}
