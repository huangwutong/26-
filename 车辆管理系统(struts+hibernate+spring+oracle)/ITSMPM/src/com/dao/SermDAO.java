package com.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Serm;

/**
 * A data access object (DAO) providing persistence and search support for Serm
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.java.Serm
 * @author MyEclipse Persistence Tools
 */

public class SermDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(SermDAO.class);
	// property constants
	public static final String SEREMP = "seremp";
	public static final String SERSHOP = "sershop";
	public static final String SERRON = "serron";
	public static final String SERJE = "serje";

	protected void initDao() {
		// do nothing
	}

	public void save(Serm transientInstance) {
		log.debug("saving Serm instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Serm persistentInstance) {
		log.debug("deleting Serm instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Serm findById(java.lang.Long id) {
		log.debug("getting Serm instance with id: " + id);
		try {
			Serm instance = (Serm) getHibernateTemplate().get("com.java.Serm",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Serm instance) {
		log.debug("finding Serm instance by example");
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
		log.debug("finding Serm instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Serm as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySeremp(Object seremp) {
		return findByProperty(SEREMP, seremp);
	}

	public List findBySershop(Object sershop) {
		return findByProperty(SERSHOP, sershop);
	}

	public List findBySerron(Object serron) {
		return findByProperty(SERRON, serron);
	}

	public List findBySerje(Object serje) {
		return findByProperty(SERJE, serje);
	}

	public List findAll() {
		log.debug("finding all Serm instances");
		try {
			String queryString = "from Serm";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Serm merge(Serm detachedInstance) {
		log.debug("merging Serm instance");
		try {
			Serm result = (Serm) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Serm instance) {
		log.debug("attaching dirty Serm instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Serm instance) {
		log.debug("attaching clean Serm instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SermDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SermDAO) ctx.getBean("SermDAO");
	}
}