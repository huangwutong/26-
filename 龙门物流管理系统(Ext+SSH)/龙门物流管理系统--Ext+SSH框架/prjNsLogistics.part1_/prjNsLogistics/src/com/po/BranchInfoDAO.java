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
 * BranchInfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.po.BranchInfo
 * @author MyEclipse Persistence Tools
 */

public class BranchInfoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(BranchInfoDAO.class);
	// property constants
	public static final String BRANCH_NAME = "branchName";
	public static final String BRANCH_LINK_MAN = "branchLinkMan";
	public static final String BRANCH_PHONE = "branchPhone";
	public static final String BRANCH_ADDRESS = "branchAddress";
	public static final String BRANCH_EMAIL = "branchEmail";

	protected void initDao() {
		// do nothing
	}

	public void save(BranchInfo transientInstance) {
		log.debug("saving BranchInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(BranchInfo persistentInstance) {
		log.debug("deleting BranchInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public BranchInfo findById(java.lang.Integer id) {
		log.debug("getting BranchInfo instance with id: " + id);
		try {
			BranchInfo instance = (BranchInfo) getHibernateTemplate().get(
					"com.po.BranchInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(BranchInfo instance) {
		log.debug("finding BranchInfo instance by example");
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
		log.debug("finding BranchInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from BranchInfo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByBranchName(Object branchName) {
		return findByProperty(BRANCH_NAME, branchName);
	}

	public List findByBranchLinkMan(Object branchLinkMan) {
		return findByProperty(BRANCH_LINK_MAN, branchLinkMan);
	}

	public List findByBranchPhone(Object branchPhone) {
		return findByProperty(BRANCH_PHONE, branchPhone);
	}

	public List findByBranchAddress(Object branchAddress) {
		return findByProperty(BRANCH_ADDRESS, branchAddress);
	}

	public List findByBranchEmail(Object branchEmail) {
		return findByProperty(BRANCH_EMAIL, branchEmail);
	}

	public List findAll() {
		log.debug("finding all BranchInfo instances");
		try {
			String queryString = "from BranchInfo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public BranchInfo merge(BranchInfo detachedInstance) {
		log.debug("merging BranchInfo instance");
		try {
			BranchInfo result = (BranchInfo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(BranchInfo instance) {
		log.debug("attaching dirty BranchInfo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(BranchInfo instance) {
		log.debug("attaching clean BranchInfo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BranchInfoDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BranchInfoDAO) ctx.getBean("BranchInfoDAO");
	}
}