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

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.sql.DataSource;

import dlog4j.formbean.ParamForm;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;
import dlog4j.security.DlogRole;

import web.struts.ActionServletExtend;

import net.sf.hibernate.Criteria;
import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.SessionFactory;
import net.sf.hibernate.cfg.Configuration;

/**
 * DLOG4J系统扩展的ActionServlet
 * @author Liudong
 */
public class DlogActionServlet extends ActionServletExtend{

	/* (non-Javadoc)
	 * @see javax.servlet.GenericServlet#init()
	 */
	public void init() throws ServletException {
		//初始化Hibernate,先初始化Hibernate的目的是为了让PlugIn类可以访问数据库
		if(getServletContext().getAttribute(Globals.HIBERNATE_SESSIONS_KEY)==null){
			URL hibernate_cfg_url = null;
			String hibernate_cfg = getInitParameter("hibernate-config");
			if(hibernate_cfg!=null&&hibernate_cfg.trim().length()>0){
				String webapp_path = getServletContext().getRealPath(ROOT_PATH);
				if(!webapp_path.endsWith(File.separator))
					webapp_path += File.separator;
				if(hibernate_cfg.startsWith(File.separator))
					hibernate_cfg = hibernate_cfg.substring(1);
				File f = new File(webapp_path + hibernate_cfg);
				try{			
					hibernate_cfg_url = f.toURL();
				}catch(MalformedURLException e){}
			}
			else
				hibernate_cfg_url = DlogActionServlet.class.getResource("/hibernate.cfg.xml");
			//初始化Hibernate
			try{
				Configuration cfg = new Configuration().configure(hibernate_cfg_url);
				SessionFactory sessions = cfg.buildSessionFactory();
				getServletContext().setAttribute(Globals.HIBERNATE_SESSIONS_KEY,sessions);
				//初始化ManagerBase类
				ManagerBase.init(getServletContext());
			}catch(Exception e){
				log.fatal("initialize hibernate failed, cfg is " + hibernate_cfg_url, e);
			}
		}
		//执行Struts的初始化
		super.init(); 
		//初始化数据
		try{
			buildDlogData();
		}catch(Exception e){
			log.fatal("Initialize DLOG data failed.",e);
		}
	}

	/**
	 * 初始化DLOG数据
	 * @return 如果已经初始化则返回false
	 * @throws SQLException
	 * @throws HibernateException
	 * @throws IOException
	 */
	protected boolean buildDlogData() throws HibernateException, SQLException, IOException{
		Session ssn = getSession();
		try{
			Criteria crit = ssn.createCriteria(SiteForm.class);
			if(crit.list().size()>0)
				return false;
			//1. 初始化dlog_site
			SiteForm site = new SiteForm();
			site.setName("dlog");
			site.setDisplayName("MY BLOG...");
			site.setDetail("MY BLOG...");
			site.setCreateTime(new Date());
			ssn.save(site);
			//2. 初始化dlog_user
			UserForm user = new UserForm();
			user.setDisplayName("ADMIN");
			user.setLoginName("admin");
			user.setPassword("admin");
			user.setPortrait("faces/face1.gif");
			user.setSite(site);
			user.setUserRole(DlogRole.ROLE_MANAGER);
			user.setRegTime(new Date());
			ssn.save(user);
			//3. 初始化dlog_param
			ParamForm param = new ParamForm();
			param.setSite(site);
			param.setName("LOGS_PER_PAGE");
			param.setType(ParamForm.TYPE_INTEGER);
			param.setValue("5");
			ssn.save(param);
			ParamForm param1 = new ParamForm();
			param1.setSite(site);
			param1.setName("USERS_PER_PAGE");
			param1.setType(ParamForm.TYPE_INTEGER);
			param1.setValue("30");
			ssn.save(param1);
			ParamForm param2 = new ParamForm();
			param2.setSite(site);
			param2.setName("TOP_COMMENT_COUNT");
			param2.setType(ParamForm.TYPE_INTEGER);
			param2.setValue("5");
			ssn.save(param2);
			ParamForm param3 = new ParamForm();
			param3.setSite(site);
			param3.setName("REPLIES_PER_PAGE");
			param3.setType(ParamForm.TYPE_INTEGER);
			param3.setValue("20");
			ssn.save(param3);
			ParamForm param4 = new ParamForm();
			param4.setSite(site);
			param4.setName("SHOW_TOP_INFO");
			param4.setType(ParamForm.TYPE_BOOLEAN);
			param4.setValue("0");
			ssn.save(param4);
			ManagerBase.commitSession(ssn, false);
			log.info("DLOG data initialized.");
		}finally{
			ManagerBase.closeSession(ssn);
		}
		return true;
	}
		
    /**
     * 获取Hibernate的Session实例
     */
    protected Session getSession() throws SQLException {
    	SessionFactory sessions = (SessionFactory)(
    			getServletContext().getAttribute(Globals.HIBERNATE_SESSIONS_KEY));
        return sessions.openSession(getConnection());
    }
	/**
	 * 获取到数据库的连接句柄
	 * @return
	 * @throws SQLException
	 */
	protected Connection getConnection() throws SQLException{
		ServletContext context = this.getServletContext();
		DataSource dataSource = (DataSource)context.getAttribute(
				org.apache.struts.Globals.DATA_SOURCE_KEY);
		return dataSource.getConnection();		
	}
	
}
