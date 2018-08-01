package com.po;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * TruckLog entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.po.TruckLog
 * @author MyEclipse Persistence Tools
 */

public class TruckLogDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TruckLogDAO.class);
	// property constants
	public static final String TLSTART_DATA = "tlstartData";
	public static final String TLARRIVE = "tlarrive";

	protected void initDao() {
		// do nothing
	}

	public void save(TruckLog transientInstance) {
		log.debug("saving TruckLog instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TruckLog persistentInstance) {
		log.debug("deleting TruckLog instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TruckLog findById(java.lang.Integer id) {
		log.debug("getting TruckLog instance with id: " + id);
		try {
			TruckLog instance = (TruckLog) getHibernateTemplate().get(
					"com.po.TruckLog", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TruckLog instance) {
		log.debug("finding TruckLog instance by example");
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
		log.debug("finding TruckLog instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TruckLog as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	/**
	 * 根据分公司编号查询返回最新一条车次表主键
	 * */
	public String findLastTlID(BranchInfo bi){
		String hql = "from TruckLog where branchInfo= ? Order By tlid DESC";
		Query qy = this.getSession(true).createQuery(hql);
		
		qy.setEntity(0, bi);
		List li = qy.list();
		Iterator it = li.iterator();
		if (it.hasNext()) {
			TruckLog tl = (TruckLog) it.next();
			return tl.getTlid().toString();
		}
		return null;
	}

	public List findByTlstartData(Object tlstartData) {
		return findByProperty(TLSTART_DATA, tlstartData);
	}

	public List findByTlarrive(Object tlarrive) {
		return findByProperty(TLARRIVE, tlarrive);
	}

	public List findAll() {
		log.debug("finding all TruckLog instances");
		try {
			String queryString = "from TruckLog";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TruckLog merge(TruckLog detachedInstance) {
		log.debug("merging TruckLog instance");
		try {
			TruckLog result = (TruckLog) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TruckLog instance) {
		log.debug("attaching dirty TruckLog instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TruckLog instance) {
		log.debug("attaching clean TruckLog instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TruckLogDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TruckLogDAO) ctx.getBean("TruckLogDAO");
	}
}