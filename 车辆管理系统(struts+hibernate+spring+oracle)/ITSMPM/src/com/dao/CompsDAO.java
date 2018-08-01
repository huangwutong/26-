package com.dao;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Comps;

/**
 * A data access object (DAO) providing persistence and search support for Comps
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.java.Comps
 * @author MyEclipse Persistence Tools
 */

public class CompsDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CompsDAO.class);
	// property constants
	public static final String COMNAME = "comname";
	public static final String COMDES = "comdes";

	protected void initDao() {
		// do nothing
	}

	public void save(Comps transientInstance) {
		log.debug("saving Comps instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Comps persistentInstance) {
		log.debug("deleting Comps instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Comps findById(java.lang.Long id) {
		log.debug("getting Comps instance with id: " + id);
		try {
			Comps instance = (Comps) getHibernateTemplate().get(
					"com.java.Comps", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Comps instance) {
		log.debug("finding Comps instance by example");
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
		log.debug("finding Comps instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Comps as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByComname(Object comname) {
		return findByProperty(COMNAME, comname);
	}

	public List findByComdes(Object comdes) {
		return findByProperty(COMDES, comdes);
	}

	public List findAll() {
		log.debug("finding all Comps instances");
		try {
			String queryString = "from Comps";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Comps merge(Comps detachedInstance) {
		log.debug("merging Comps instance");
		try {
			Comps result = (Comps) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Comps instance) {
		log.debug("attaching dirty Comps instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Comps instance) {
		log.debug("attaching clean Comps instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
 
	
	
	public static CompsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CompsDAO) ctx.getBean("CompsDAO");
	}
}