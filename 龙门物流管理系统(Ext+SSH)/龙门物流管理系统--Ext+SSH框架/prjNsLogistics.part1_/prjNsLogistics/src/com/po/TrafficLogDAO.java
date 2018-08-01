package com.po;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * TrafficLog entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.po.TrafficLog
 * @author MyEclipse Persistence Tools
 */

public class TrafficLogDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TrafficLogDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(TrafficLog transientInstance) {
		log.debug("saving TrafficLog instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TrafficLog persistentInstance) {
		log.debug("deleting TrafficLog instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TrafficLog findById(java.lang.Integer id) {
		log.debug("getting TrafficLog instance with id: " + id);
		try {
			TrafficLog instance = (TrafficLog) getHibernateTemplate().get(
					"com.po.TrafficLog", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TrafficLog instance) {
		log.debug("finding TrafficLog instance by example");
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
		log.debug("finding TrafficLog instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TrafficLog as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all TrafficLog instances");
		try {
			String queryString = "from TrafficLog";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TrafficLog merge(TrafficLog detachedInstance) {
		log.debug("merging TrafficLog instance");
		try {
			TrafficLog result = (TrafficLog) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TrafficLog instance) {
		log.debug("attaching dirty TrafficLog instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TrafficLog instance) {
		log.debug("attaching clean TrafficLog instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TrafficLogDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TrafficLogDAO) ctx.getBean("TrafficLogDAO");
	}

	/**
	 * 根据货票状态查询所有运输记录
	 * @param int 货票状态编号
	 * @return List 运输记录对象集合
	 * */
	public List findByBillStateID(int billstateID){
		String hql = "from TrafficLog where BillStateId()=?";
		Query qy = this.getSession(true).createQuery(hql);
		qy.setInteger(0, billstateID);
		
		List li = qy.list();
		return li;
	}
	
}