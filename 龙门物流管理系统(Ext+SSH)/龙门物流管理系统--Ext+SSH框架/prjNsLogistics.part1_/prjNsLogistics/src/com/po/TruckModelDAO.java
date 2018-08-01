package com.po;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * TruckModel entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.po.TruckModel
 * @author MyEclipse Persistence Tools
 */

public class TruckModelDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TruckModelDAO.class);
	// property constants
	public static final String TMNAME = "tmname";
	public static final String TMWEIGHT = "tmweight";
	public static final String TMCUBAGE = "tmcubage";
	public static final String TMPASSENGER = "tmpassenger";

	protected void initDao() {
		// do nothing
	}

	public void save(TruckModel transientInstance) {
		log.debug("saving TruckModel instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TruckModel persistentInstance) {
		log.debug("deleting TruckModel instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TruckModel findById(java.lang.Integer id) {
		log.debug("getting TruckModel instance with id: " + id);
		try {
			TruckModel instance = (TruckModel) getHibernateTemplate().get(
					"com.po.TruckModel", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TruckModel instance) {
		log.debug("finding TruckModel instance by example");
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
		log.debug("finding TruckModel instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TruckModel as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTmname(Object tmname) {
		return findByProperty(TMNAME, tmname);
	}

	public List findByTmweight(Object tmweight) {
		return findByProperty(TMWEIGHT, tmweight);
	}

	public List findByTmcubage(Object tmcubage) {
		return findByProperty(TMCUBAGE, tmcubage);
	}

	public List findByTmpassenger(Object tmpassenger) {
		return findByProperty(TMPASSENGER, tmpassenger);
	}

	public List findAll() {
		log.debug("finding all TruckModel instances");
		try {
			String queryString = "from TruckModel";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TruckModel merge(TruckModel detachedInstance) {
		log.debug("merging TruckModel instance");
		try {
			TruckModel result = (TruckModel) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TruckModel instance) {
		log.debug("attaching dirty TruckModel instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TruckModel instance) {
		log.debug("attaching clean TruckModel instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TruckModelDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TruckModelDAO) ctx.getBean("TruckModelDAO");
	}
}