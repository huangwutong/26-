package com.dao;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Resfun;

/**
 * A data access object (DAO) providing persistence and search support for
 * Resfun entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.java.Resfun
 * @author MyEclipse Persistence Tools
 */

public class ResfunDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ResfunDAO.class);
	// property constants
	public static final String PNAME = "pname";
	public static final String CNAME = "cname";
	public static final String CACTION = "caction";

	protected void initDao() {
		// do nothing
	}

	public void save(Resfun transientInstance) {
		log.debug("saving Resfun instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Resfun persistentInstance) {
		log.debug("deleting Resfun instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Resfun findById(java.lang.Long id) {
		log.debug("getting Resfun instance with id: " + id);
		try {
			Resfun instance = (Resfun) getHibernateTemplate().get(
					"com.java.Resfun", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Resfun instance) {
		log.debug("finding Resfun instance by example");
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
		log.debug("finding Resfun instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Resfun as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPname(Object pname) {
		return findByProperty(PNAME, pname);
	}

	public List findByCname(Object cname) {
		return findByProperty(CNAME, cname);
	}

	public List findByCaction(Object caction) {
		return findByProperty(CACTION, caction);
	}

	public List findAll() {
		log.debug("finding all Resfun instances");
		try {
			String queryString = "from Resfun";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Resfun merge(Resfun detachedInstance) {
		log.debug("merging Resfun instance");
		try {
			Resfun result = (Resfun) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Resfun instance) {
		log.debug("attaching dirty Resfun instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Resfun instance) {
		log.debug("attaching clean Resfun instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ResfunDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ResfunDAO) ctx.getBean("ResfunDAO");
	}
}