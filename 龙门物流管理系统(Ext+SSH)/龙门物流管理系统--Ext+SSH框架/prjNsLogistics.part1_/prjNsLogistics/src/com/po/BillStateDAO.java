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
 * BillState entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.po.BillState
 * @author MyEclipse Persistence Tools
 */

public class BillStateDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BillStateDAO.class);
	// property constants
	public static final String BILL_STATE_NAME = "billStateName";

	protected void initDao() {
		// do nothing
	}

	public void save(BillState transientInstance) {
		log.debug("saving BillState instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(BillState persistentInstance) {
		log.debug("deleting BillState instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public BillState findById(java.lang.Integer id) {
		log.debug("getting BillState instance with id: " + id);
		try {
			BillState instance = (BillState) getHibernateTemplate().get(
					"com.po.BillState", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(BillState instance) {
		log.debug("finding BillState instance by example");
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
		log.debug("finding BillState instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from BillState as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByBillStateName(Object billStateName) {
		return findByProperty(BILL_STATE_NAME, billStateName);
	}

	public List findAll() {
		log.debug("finding all BillState instances");
		try {
			String queryString = "from BillState";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public BillState merge(BillState detachedInstance) {
		log.debug("merging BillState instance");
		try {
			BillState result = (BillState) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(BillState instance) {
		log.debug("attaching dirty BillState instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(BillState instance) {
		log.debug("attaching clean BillState instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BillStateDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BillStateDAO) ctx.getBean("BillStateDAO");
	}
}