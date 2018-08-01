package com.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Mainm;

/**
 * A data access object (DAO) providing persistence and search support for Mainm
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.java.Mainm
 * @author MyEclipse Persistence Tools
 */

public class MainmDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(MainmDAO.class);
	// property constants
	public static final String MAINKIND = "mainkind";
	public static final String MAINEMP = "mainemp";
	public static final String MLOCA = "mloca";
	public static final String MJE = "mje";
	public static final String MAMILE = "mamile";
	public static final String MAXM = "maxm";
	public static final String MADES = "mades";

	protected void initDao() {
		// do nothing
	}

	public void save(Mainm transientInstance) {
		log.debug("saving Mainm instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Mainm persistentInstance) {
		log.debug("deleting Mainm instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Mainm findById(java.lang.Long id) {
		log.debug("getting Mainm instance with id: " + id);
		try {
			Mainm instance = (Mainm) getHibernateTemplate().get(
					"com.java.Mainm", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Mainm instance) {
		log.debug("finding Mainm instance by example");
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
		log.debug("finding Mainm instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Mainm as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMainkind(Object mainkind) {
		return findByProperty(MAINKIND, mainkind);
	}

	public List findByMainemp(Object mainemp) {
		return findByProperty(MAINEMP, mainemp);
	}

	public List findByMloca(Object mloca) {
		return findByProperty(MLOCA, mloca);
	}

	public List findByMje(Object mje) {
		return findByProperty(MJE, mje);
	}

	public List findByMamile(Object mamile) {
		return findByProperty(MAMILE, mamile);
	}

	public List findByMaxm(Object maxm) {
		return findByProperty(MAXM, maxm);
	}

	public List findByMades(Object mades) {
		return findByProperty(MADES, mades);
	}

	public List findAll() {
		log.debug("finding all Mainm instances");
		try {
			String queryString = "from Mainm";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Mainm merge(Mainm detachedInstance) {
		log.debug("merging Mainm instance");
		try {
			Mainm result = (Mainm) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Mainm instance) {
		log.debug("attaching dirty Mainm instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Mainm instance) {
		log.debug("attaching clean Mainm instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MainmDAO getFromApplicationContext(ApplicationContext ctx) {
		return (MainmDAO) ctx.getBean("MainmDAO");
	}
}