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
 * CargoInfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.po.CargoInfo
 * @author MyEclipse Persistence Tools
 */

public class CargoInfoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CargoInfoDAO.class);
	// property constants
	public static final String CARGO_NAME = "cargoName";
	public static final String CARGO_WEIGHT = "cargoWeight";
	public static final String CARGO_BULK = "cargoBulk";
	public static final String CARGO_NUM = "cargoNum";
	public static final String CARGO_UNIT = "cargoUnit";
	public static final String CARGO_VALUE = "cargoValue";
	public static final String CARGO_FREIGHT = "cargoFreight";
	public static final String CARGO_AMENDS = "cargoAmends";
	public static final String CARGO_MEMO = "cargoMemo";
	public static final String CARGO_STATE = "cargoState";
	public static final String CARGO_START_DATA = "cargoStartData";
	public static final String CARGO_END_DATA = "cargoEndData";

	protected void initDao() {
		// do nothing
	}

	public void save(CargoInfo transientInstance) {
		log.debug("saving CargoInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CargoInfo persistentInstance) {
		log.debug("deleting CargoInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CargoInfo findById(java.lang.Integer id) {
		log.debug("getting CargoInfo instance with id: " + id);
		try {
			CargoInfo instance = (CargoInfo) getHibernateTemplate().get(
					"com.po.CargoInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CargoInfo instance) {
		log.debug("finding CargoInfo instance by example");
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
		log.debug("finding CargoInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CargoInfo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCargoName(Object cargoName) {
		return findByProperty(CARGO_NAME, cargoName);
	}

	public List findByCargoWeight(Object cargoWeight) {
		return findByProperty(CARGO_WEIGHT, cargoWeight);
	}

	public List findByCargoBulk(Object cargoBulk) {
		return findByProperty(CARGO_BULK, cargoBulk);
	}

	public List findByCargoNum(Object cargoNum) {
		return findByProperty(CARGO_NUM, cargoNum);
	}

	public List findByCargoUnit(Object cargoUnit) {
		return findByProperty(CARGO_UNIT, cargoUnit);
	}

	public List findByCargoValue(Object cargoValue) {
		return findByProperty(CARGO_VALUE, cargoValue);
	}

	public List findByCargoFreight(Object cargoFreight) {
		return findByProperty(CARGO_FREIGHT, cargoFreight);
	}

	public List findByCargoAmends(Object cargoAmends) {
		return findByProperty(CARGO_AMENDS, cargoAmends);
	}

	public List findByCargoMemo(Object cargoMemo) {
		return findByProperty(CARGO_MEMO, cargoMemo);
	}

	public List findByCargoState(Object cargoState) {
		return findByProperty(CARGO_STATE, cargoState);
	}

	public List findByCargoStartData(Object cargoStartData) {
		return findByProperty(CARGO_START_DATA, cargoStartData);
	}

	public List findByCargoEndData(Object cargoEndData) {
		return findByProperty(CARGO_END_DATA, cargoEndData);
	}

	public List findAll() {
		log.debug("finding all CargoInfo instances");
		try {
			String queryString = "from CargoInfo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CargoInfo merge(CargoInfo detachedInstance) {
		log.debug("merging CargoInfo instance");
		try {
			CargoInfo result = (CargoInfo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CargoInfo instance) {
		log.debug("attaching dirty CargoInfo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CargoInfo instance) {
		log.debug("attaching clean CargoInfo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CargoInfoDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CargoInfoDAO) ctx.getBean("CargoInfoDAO");
	}

	/**
	 * 查询指定公司的所有货物信息
	 * @param int 公司编号
	 * @return List 货物信息
	 * */
	public List findByBranchID(int branchID){
		String hql = "from CargoInfo where branchInfo=?";
		Query qy = this.getSession(true).createQuery(hql);
		
		qy.setInteger(0, branchID);
		
		List li = qy.list();
		
		return li;
	}
}