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
 * DepartmentInfo entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.po.DepartmentInfo
 * @author MyEclipse Persistence Tools
 */

public class DepartmentInfoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(DepartmentInfoDAO.class);
	// property constants
	public static final String DEPARTMENT_NAME = "departmentName";

	protected void initDao() {
		// do nothing
	}

	public void save(DepartmentInfo transientInstance) {
		log.debug("saving DepartmentInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(DepartmentInfo persistentInstance) {
		log.debug("deleting DepartmentInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public DepartmentInfo findById(java.lang.Integer id) {
		log.debug("getting DepartmentInfo instance with id: " + id);
		try {
			DepartmentInfo instance = (DepartmentInfo) getHibernateTemplate()
					.get("com.po.DepartmentInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(DepartmentInfo instance) {
		log.debug("finding DepartmentInfo instance by example");
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
		log.debug("finding DepartmentInfo instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from DepartmentInfo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByDepartmentName(Object departmentName) {
		return findByProperty(DEPARTMENT_NAME, departmentName);
	}

	public List findAll() {
		log.debug("finding all DepartmentInfo instances");
		try {
			String queryString = "from DepartmentInfo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public DepartmentInfo merge(DepartmentInfo detachedInstance) {
		log.debug("merging DepartmentInfo instance");
		try {
			DepartmentInfo result = (DepartmentInfo) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(DepartmentInfo instance) {
		log.debug("attaching dirty DepartmentInfo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(DepartmentInfo instance) {
		log.debug("attaching clean DepartmentInfo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static DepartmentInfoDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (DepartmentInfoDAO) ctx.getBean("DepartmentInfoDAO");
	}
}