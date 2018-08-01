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
 * RoleInfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.po.RoleInfo
 * @author MyEclipse Persistence Tools
 */

public class RoleInfoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(RoleInfoDAO.class);
	// property constants
	public static final String ROLE_NAME = "roleName";
	public static final String ROLE_CLIENT = "roleClient";
	public static final String ROLE_TICKET = "roleTicket";
	public static final String ROLE_BRANCH = "roleBranch";
	public static final String ROLE_TRAFFIC = "roleTraffic";
	public static final String ROLE_QUERY = "roleQuery";
	public static final String ROLE_BASIC_INFO = "roleBasicInfo";

	protected void initDao() {
		// do nothing
	}

	public void save(RoleInfo transientInstance) {
		log.debug("saving RoleInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(RoleInfo persistentInstance) {
		log.debug("deleting RoleInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public RoleInfo findById(java.lang.Integer id) {
		log.debug("getting RoleInfo instance with id: " + id);
		try {
			RoleInfo instance = (RoleInfo) getHibernateTemplate().get(
					"com.po.RoleInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(RoleInfo instance) {
		log.debug("finding RoleInfo instance by example");
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
		log.debug("finding RoleInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from RoleInfo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByRoleName(Object roleName) {
		return findByProperty(ROLE_NAME, roleName);
	}

	public List findByRoleClient(Object roleClient) {
		return findByProperty(ROLE_CLIENT, roleClient);
	}

	public List findByRoleTicket(Object roleTicket) {
		return findByProperty(ROLE_TICKET, roleTicket);
	}

	public List findByRoleBranch(Object roleBranch) {
		return findByProperty(ROLE_BRANCH, roleBranch);
	}

	public List findByRoleTraffic(Object roleTraffic) {
		return findByProperty(ROLE_TRAFFIC, roleTraffic);
	}

	public List findByRoleQuery(Object roleQuery) {
		return findByProperty(ROLE_QUERY, roleQuery);
	}

	public List findByRoleBasicInfo(Object roleBasicInfo) {
		return findByProperty(ROLE_BASIC_INFO, roleBasicInfo);
	}

	public List findAll() {
		log.debug("finding all RoleInfo instances");
		try {
			String queryString = "from RoleInfo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public RoleInfo merge(RoleInfo detachedInstance) {
		log.debug("merging RoleInfo instance");
		try {
			RoleInfo result = (RoleInfo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(RoleInfo instance) {
		log.debug("attaching dirty RoleInfo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(RoleInfo instance) {
		log.debug("attaching clean RoleInfo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RoleInfoDAO getFromApplicationContext(ApplicationContext ctx) {
		return (RoleInfoDAO) ctx.getBean("RoleInfoDAO");
	}
}