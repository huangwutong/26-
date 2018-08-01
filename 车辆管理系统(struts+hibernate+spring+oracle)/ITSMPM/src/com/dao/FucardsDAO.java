package com.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Fucards;

/**
 * A data access object (DAO) providing persistence and search support for
 * Fucards entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.java.Fucards
 * @author MyEclipse Persistence Tools
 */

public class FucardsDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(FucardsDAO.class);
	// property constants
	public static final String FUNUM = "funum";
	public static final String FUEMP = "fuemp";
	public static final String FUJE = "fuje";
	public static final String FULOCA = "fuloca";
	public static final String DES = "des";

	protected void initDao() {
		// do nothing
	}

	public void save(Fucards transientInstance) {
		log.debug("saving Fucards instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Fucards persistentInstance) {
		log.debug("deleting Fucards instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Fucards findById(java.lang.Long id) {
		log.debug("getting Fucards instance with id: " + id);
		try {
			Fucards instance = (Fucards) getHibernateTemplate().get(
					"com.java.Fucards", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Fucards instance) {
		log.debug("finding Fucards instance by example");
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
		log.debug("finding Fucards instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Fucards as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByFunum(Object funum) {
		return findByProperty(FUNUM, funum);
	}

	public List findByFuemp(Object fuemp) {
		return findByProperty(FUEMP, fuemp);
	}

	public List findByFuje(Object fuje) {
		return findByProperty(FUJE, fuje);
	}

	public List findByFuloca(Object fuloca) {
		return findByProperty(FULOCA, fuloca);
	}

	public List findByDes(Object des) {
		return findByProperty(DES, des);
	}

	public List findAll() {
		log.debug("finding all Fucards instances");
		try {
			String queryString = "from Fucards";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Fucards merge(Fucards detachedInstance) {
		log.debug("merging Fucards instance");
		try {
			Fucards result = (Fucards) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Fucards instance) {
		log.debug("attaching dirty Fucards instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Fucards instance) {
		log.debug("attaching clean Fucards instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static FucardsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (FucardsDAO) ctx.getBean("FucardsDAO");
	}
}