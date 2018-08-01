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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.sql.DataSource;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.SessionFactory;

/**
 * ����Manager��Ļ���,���ڷ�װ���з���Hibernate�Լ����ݿ�ķ���
 * ������DlogActionServlet��init�����б���ʼ��
 * @author Liudong
 */
public class ManagerBase {
    
    private static ServletContext context;
    
    protected static void init(ServletContext servletContext) {
        if(servletContext!=null)
            context = servletContext;
    }
    /**
     * ��ȡHibernate�־ò�Ĳ���ʵ��
     * @return
     */
    public static Session getSession() throws SQLException{
        SessionFactory sessions = (SessionFactory)context.getAttribute(dlog4j.Globals.HIBERNATE_SESSIONS_KEY);
        return sessions.openSession(getConnection());
    }
	/**
	 * ��ȡ�����ݿ�����Ӿ��
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException{
		DataSource dataSource = (DataSource)context.getAttribute(org.apache.struts.Globals.DATA_SOURCE_KEY);
		return dataSource.getConnection();		
	}
    /**
     * �ύHibernate����
     * @param session
     * @throws SQLException
     * @throws HibernateException
     */
    public static void commitSession(Session session, boolean close) throws SQLException, HibernateException{
        session.flush();
        session.connection().commit();
        if(close){
        	session.connection().close();
            session.close();
        }	
    }
    /**
     * �ر�session
     * @param session
     * @throws SQLException
     * @throws HibernateException
     */
    public static void closeSession(Session session) throws SQLException,HibernateException{
    	session.connection().close();
    	session.close();
    }
	public static void close(Object obj1,Object obj2,Object obj3){
		close(obj1);close(obj2);close(obj3);
	}
	/**
	 * ��Դ�ͷ�
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
			if(obj instanceof Session)
			    closeSession((Session)obj);
		}catch(Exception e){}
		obj = null;
	}

}
