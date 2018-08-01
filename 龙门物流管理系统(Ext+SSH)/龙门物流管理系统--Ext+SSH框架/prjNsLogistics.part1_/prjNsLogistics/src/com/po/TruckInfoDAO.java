package com.po;

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
 * TruckInfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.po.TruckInfo
 * @author MyEclipse Persistence Tools
 */

public class TruckInfoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TruckInfoDAO.class);
	// property constants
	public static final String TRUCK_NUM = "truckNum";
	public static final String TRUCK_ENGINE_NUM = "truckEngineNum";
	public static final String TRUCK_RUN_NUM = "truckRunNum";
	public static final String TRUCK_INSURANCE_NUM = "truckInsuranceNum";
	public static final String TRUCK_COLOR = "truckColor";
	public static final String TRUCK_PHOTO = "truckPhoto";
	public static final String TRUCK_BUY_DATA = "truckBuyData";
	public static final String TRUCK_IS_VACANCY = "truckIsVacancy";

	protected void initDao() {
		// do nothing
	}
	public List findByBranchID(int branchID){
		String hql = "from TruckInfo where branchInfo=?";
		Query qy = this.getSession(true).createQuery(hql);
		
		qy.setInteger(0, branchID);
		
		List li = qy.list();
		
		return li;
	}

	public void save(TruckInfo transientInstance) {
		log.debug("saving TruckInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TruckInfo persistentInstance) {
		log.debug("deleting TruckInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TruckInfo findById(java.lang.Integer id) {
		log.debug("getting TruckInfo instance with id: " + id);
		try {
			TruckInfo instance = (TruckInfo) getHibernateTemplate().get(
					"com.po.TruckInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TruckInfo instance) {
		log.debug("finding TruckInfo instance by example");
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
		log.debug("finding TruckInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TruckInfo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTruckNum(Object truckNum) {
		return findByProperty(TRUCK_NUM, truckNum);
	}

	public List findByTruckEngineNum(Object truckEngineNum) {
		return findByProperty(TRUCK_ENGINE_NUM, truckEngineNum);
	}

	public List findByTruckRunNum(Object truckRunNum) {
		return findByProperty(TRUCK_RUN_NUM, truckRunNum);
	}

	public List findByTruckInsuranceNum(Object truckInsuranceNum) {
		return findByProperty(TRUCK_INSURANCE_NUM, truckInsuranceNum);
	}

	public List findByTruckColor(Object truckColor) {
		return findByProperty(TRUCK_COLOR, truckColor);
	}

	public List findByTruckPhoto(Object truckPhoto) {
		return findByProperty(TRUCK_PHOTO, truckPhoto);
	}

	public List findByTruckBuyData(Object truckBuyData) {
		return findByProperty(TRUCK_BUY_DATA, truckBuyData);
	}

	public List findByTruckIsVacancy(Object truckIsVacancy) {
		return findByProperty(TRUCK_IS_VACANCY, truckIsVacancy);
	}

	public List findAll() {
		log.debug("finding all TruckInfo instances");
		try {
			String queryString = "from TruckInfo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TruckInfo merge(TruckInfo detachedInstance) {
		log.debug("merging TruckInfo instance");
		try {
			TruckInfo result = (TruckInfo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TruckInfo instance) {
		log.debug("attaching dirty TruckInfo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TruckInfo instance) {
		log.debug("attaching clean TruckInfo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TruckInfoDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TruckInfoDAO) ctx.getBean("TruckInfoDAO");
	}
}