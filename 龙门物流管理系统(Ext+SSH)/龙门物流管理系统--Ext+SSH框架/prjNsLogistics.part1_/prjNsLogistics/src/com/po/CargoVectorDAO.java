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
 * CargoVector entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.po.CargoVector
 * @author MyEclipse Persistence Tools
 */

public class CargoVectorDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CargoVectorDAO.class);

	// property constants

	protected void initDao() {
		// do nothing
	}

	public void save(CargoVector transientInstance) {
		log.debug("saving CargoVector instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CargoVector persistentInstance) {
		log.debug("deleting CargoVector instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CargoVector findById(java.lang.Integer id) {
		log.debug("getting CargoVector instance with id: " + id);
		try {
			CargoVector instance = (CargoVector) getHibernateTemplate().get(
					"com.po.CargoVector", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CargoVector instance) {
		log.debug("finding CargoVector instance by example");
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
		log.debug("finding CargoVector instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CargoVector as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all CargoVector instances");
		try {
			String queryString = "from CargoVector";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CargoVector merge(CargoVector detachedInstance) {
		log.debug("merging CargoVector instance");
		try {
			CargoVector result = (CargoVector) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CargoVector instance) {
		log.debug("attaching dirty CargoVector instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CargoVector instance) {
		log.debug("attaching clean CargoVector instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CargoVectorDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (CargoVectorDAO) ctx.getBean("CargoVectorDAO");
	}

	/**
	 * 查询指定公司的所有货物集合
	 * @param int 公司编号
	 * @return List 货物信息
	 * */
	public List findByBranchID(int branchID){
		String hql = "from CargoVector where billInfo=?";
		Query qy = this.getSession(true).createQuery(hql);
		
		qy.setInteger(0, branchID);
		
		List li = qy.list();
		
		return li;
	}
}