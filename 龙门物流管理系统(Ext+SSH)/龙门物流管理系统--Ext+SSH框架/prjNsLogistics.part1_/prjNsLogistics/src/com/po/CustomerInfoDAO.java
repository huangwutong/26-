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
 * CustomerInfo entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.po.CustomerInfo
 * @author MyEclipse Persistence Tools
 */

public class CustomerInfoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CustomerInfoDAO.class);
	// property constants
	public static final String CUSTOMER_NAME = "customerName";
	public static final String CUSTOMER_LINK_MAN = "customerLinkMan";
	public static final String CUSTOMER_SEX = "customerSex";
	public static final String CUSTOMER_PHONE = "customerPhone";
	public static final String CUSTOMER_FAX = "customerFax";
	public static final String CUSTOMER_POST_ID = "customerPostId";
	public static final String CUSTOMER_EMAIL = "customerEmail";
	public static final String CUSTOMER_REG_DATA = "customerRegData";

	protected void initDao() {
		// do nothing
	}

	public void save(CustomerInfo transientInstance) {
		log.debug("saving CustomerInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CustomerInfo persistentInstance) {
		log.debug("deleting CustomerInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CustomerInfo findById(java.lang.Integer id) {
		log.debug("getting CustomerInfo instance with id: " + id);
		try {
			CustomerInfo instance = (CustomerInfo) getHibernateTemplate().get(
					"com.po.CustomerInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CustomerInfo instance) {
		log.debug("finding CustomerInfo instance by example");
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
		log.debug("finding CustomerInfo instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from CustomerInfo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCustomerName(Object customerName) {
		return findByProperty(CUSTOMER_NAME, customerName);
	}

	public List findByCustomerLinkMan(Object customerLinkMan) {
		return findByProperty(CUSTOMER_LINK_MAN, customerLinkMan);
	}

	public List findByCustomerSex(Object customerSex) {
		return findByProperty(CUSTOMER_SEX, customerSex);
	}

	public List findByCustomerPhone(Object customerPhone) {
		return findByProperty(CUSTOMER_PHONE, customerPhone);
	}

	public List findByCustomerFax(Object customerFax) {
		return findByProperty(CUSTOMER_FAX, customerFax);
	}

	public List findByCustomerPostId(Object customerPostId) {
		return findByProperty(CUSTOMER_POST_ID, customerPostId);
	}

	public List findByCustomerEmail(Object customerEmail) {
		return findByProperty(CUSTOMER_EMAIL, customerEmail);
	}

	public List findByCustomerRegData(Object customerRegData) {
		return findByProperty(CUSTOMER_REG_DATA, customerRegData);
	}

	public List findAll() {
		log.debug("finding all CustomerInfo instances");
		try {
			String queryString = "from CustomerInfo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CustomerInfo merge(CustomerInfo detachedInstance) {
		log.debug("merging CustomerInfo instance");
		try {
			CustomerInfo result = (CustomerInfo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CustomerInfo instance) {
		log.debug("attaching dirty CustomerInfo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CustomerInfo instance) {
		log.debug("attaching clean CustomerInfo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CustomerInfoDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (CustomerInfoDAO) ctx.getBean("CustomerInfoDAO");
	}

	//========按公司ID查================
	public List findByAll(String str) {
		log.debug("finding all CustomerInfo instances");
		try {
			String queryString = "from CustomerInfo where BranchID="+str;
			System.out.println("公司id-------->"+str);
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	//========================
}