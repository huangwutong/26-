package com.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Feesm;

/**
 * A data access object (DAO) providing persistence and search support for Feesm
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.java.Feesm
 * @author MyEclipse Persistence Tools
 */

public class FeesmDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(FeesmDAO.class);
	// property constants
	public static final String FEESKID = "feeskid";
	public static final String FEESJE = "feesje";
	public static final String FEESEMP = "feesemp";
	public static final String FEESDEP = "feesdep";
	public static final String FEESZQ = "feeszq";
	public static final String DES = "des";

	protected void initDao() {
		// do nothing
	}

	public void save(Feesm transientInstance) {
		log.debug("saving Feesm instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Feesm persistentInstance) {
		log.debug("deleting Feesm instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Feesm findById(java.lang.Long id) {
		log.debug("getting Feesm instance with id: " + id);
		try {
			Feesm instance = (Feesm) getHibernateTemplate().get(
					"com.java.Feesm", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Feesm instance) {
		log.debug("finding Feesm instance by example");
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
		log.debug("finding Feesm instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Feesm as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByFeeskid(Object feeskid) {
		return findByProperty(FEESKID, feeskid);
	}

	public List findByFeesje(Object feesje) {
		return findByProperty(FEESJE, feesje);
	}

	public List findByFeesemp(Object feesemp) {
		return findByProperty(FEESEMP, feesemp);
	}

	public List findByFeesdep(Object feesdep) {
		return findByProperty(FEESDEP, feesdep);
	}

	public List findByFeeszq(Object feeszq) {
		return findByProperty(FEESZQ, feeszq);
	}

	public List findByDes(Object des) {
		return findByProperty(DES, des);
	}

	public List findAll() {
		log.debug("finding all Feesm instances");
		try {
			String queryString = "from Feesm";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Feesm merge(Feesm detachedInstance) {
		log.debug("merging Feesm instance");
		try {
			Feesm result = (Feesm) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Feesm instance) {
		log.debug("attaching dirty Feesm instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Feesm instance) {
		log.debug("attaching clean Feesm instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static FeesmDAO getFromApplicationContext(ApplicationContext ctx) {
		return (FeesmDAO) ctx.getBean("FeesmDAO");
	}
}