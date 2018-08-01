package com.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
 
import com.java.ResP;
import com.java.Xxuser;
import org.hibernate.Session;
/**
 * A data access object (DAO) providing persistence and search support for
 * Xxuser entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.java.Xxuser
 * @author MyEclipse Persistence Tools
 */

public class XxuserDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(XxuserDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String PASSWORD = "password";
	public static final String DES = "des";

	protected void initDao() {
		// do nothing
	}

	public void save(Xxuser transientInstance) {
		log.debug("saving Xxuser instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Xxuser persistentInstance) {
		log.debug("deleting Xxuser instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Xxuser findById(java.lang.Long id) {
		log.debug("getting Xxuser instance with id: " + id);
		try {
			Xxuser instance = (Xxuser) getHibernateTemplate().get(
					"com.java.Xxuser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Xxuser instance) {
		log.debug("finding Xxuser instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Xxuser instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Xxuser as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByDes(Object des) {
		return findByProperty(DES, des);
	}

	public List findAll() {
		log.debug("finding all Xxuser instances");
		try {
			String queryString = "from Xxuser";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Xxuser merge(Xxuser detachedInstance) {
		log.debug("merging Xxuser instance");
		try {
			Xxuser result = (Xxuser) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Xxuser instance) {
		log.debug("attaching dirty Xxuser instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Xxuser instance) {
		log.debug("attaching clean Xxuser instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	// /wsw
	public List findBynmpass(String username, Long password) {
		try {
			String queryString = "from Xxuser as mod where mod.name='"
					+ username + "' and mod.password=" + password + "";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public String seleComid(String username) throws SQLException {
		try {
			 
			String procedure = "{call seleComid(?,?) }"; 
			Session s = getHibernateTemplate().getSessionFactory().openSession();
			s.beginTransaction().begin();
			Connection con=s.connection(); 
			CallableStatement cs=con.prepareCall(procedure);
			cs.setString(1, username);
			cs.registerOutParameter(2, Types.VARCHAR);
			cs.execute();
			String lo=cs.getString(2);
			s.close();
			System.out.println("aaaaaa+="+lo);
			return lo;
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}	
	
	public List findBycompsid(Long id) {
		try {
			String queryString = "from ResP as mod where mod.comps.compsid="+id+" order by resfun.pname";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	///////
	public List findByTab(String tab,String tabstr,String str) {
		try {
			String queryString = "from "+tab+" as mod where mod."+tabstr+"='"+str.trim()+"'";
			//String queryString = "from Xxuser as model where model.name='www'";
			System.out.println(queryString);
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findByTabId(String tab,String tabstr,Long id) {
		try {
			String queryString = "from "+tab+" as mod where mod."+tabstr+"="+id+"";
			//String queryString = "from Xxuser as model where model.name='www'";
			System.out.println(queryString);
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findByTabother(String tab,String tabstr1,Long str1,String tabstr2,Long str2) {
		try {
			String queryString = "from "+tab+" as mod where mod."+tabstr1+"="+str1+" and mod."+tabstr2+"="+str2+"";
			//String queryString = "from Xxuser as model where model.name='www'";
			System.out.println(queryString);
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findByTabPC(String tab, String tabstr1, String str1,
			String tabstr2, String str2, String tabstr3, String str3) {
		try {
			String queryString = "from "+tab+" as mod where mod."+tabstr1+"='"+str1+"' and mod."+tabstr2+"='"+str2+"' and mod."+tabstr3+"='"+str3+"'";
			//String queryString = "from Xxuser as model where model.name='www'";
			System.out.println(queryString);
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	

	public static XxuserDAO getFromApplicationContext(ApplicationContext ctx) {
		return (XxuserDAO) ctx.getBean("XxuserDAO");
	}
}