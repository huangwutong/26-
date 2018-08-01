package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Grareg;

/**
 * A data access object (DAO) providing persistence and search support for
 * Grareg entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.java.Grareg
 * @author MyEclipse Persistence Tools
 */

public class GraregDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(GraregDAO.class);
	// property constants
	public static final String GRANUM = "granum";
	public static final String LOCAL = "local";
	public static final String AREAS = "areas";
	public static final String RELSHIP = "relship";

	protected void initDao() {
		// do nothing
	}

	public void save(Grareg transientInstance) {
		log.debug("saving Grareg instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Grareg persistentInstance) {
		log.debug("deleting Grareg instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Grareg findById(java.lang.Long id) {
		log.debug("getting Grareg instance with id: " + id);
		try {
			Grareg instance = (Grareg) getHibernateTemplate().get(
					"com.java.Grareg", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Grareg instance) {
		log.debug("finding Grareg instance by example");
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
		log.debug("finding Grareg instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Grareg as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGranum(Object granum) {
		return findByProperty(GRANUM, granum);
	}

	public List findByLocal(Object local) {
		return findByProperty(LOCAL, local);
	}

	public List findByAreas(Object areas) {
		return findByProperty(AREAS, areas);
	}

	public List findByRelship(Object relship) {
		return findByProperty(RELSHIP, relship);
	}

	public List findAll() {
		log.debug("finding all Grareg instances");
		try {
			String queryString = "from Grareg";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Grareg merge(Grareg detachedInstance) {
		log.debug("merging Grareg instance");
		try {
			Grareg result = (Grareg) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Grareg instance) {
		log.debug("attaching dirty Grareg instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Grareg instance) {
		log.debug("attaching clean Grareg instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GraregDAO getFromApplicationContext(ApplicationContext ctx) {
		return (GraregDAO) ctx.getBean("GraregDAO");
	}
}