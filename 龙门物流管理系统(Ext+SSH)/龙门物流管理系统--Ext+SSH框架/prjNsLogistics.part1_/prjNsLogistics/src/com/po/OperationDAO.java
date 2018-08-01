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
 * Operation entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.po.Operation
 * @author MyEclipse Persistence Tools
 */

public class OperationDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(OperationDAO.class);
	// property constants
	public static final String OP_FID = "opFid";
	public static final String OP_NAME = "opName";
	public static final String OP_URL = "opUrl";

	protected void initDao() {
		// do nothing
	}

	public void save(Operation transientInstance) {
		log.debug("saving Operation instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Operation persistentInstance) {
		log.debug("deleting Operation instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Operation findById(java.lang.Integer id) {
		log.debug("getting Operation instance with id: " + id);
		try {
			Operation instance = (Operation) getHibernateTemplate().get(
					"com.po.Operation", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Operation instance) {
		log.debug("finding Operation instance by example");
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
		log.debug("finding Operation instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Operation as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	/**
	 * 指定父权限ID，查询所有符合条件的权限对象
	 * @param Object 父权限ID
	 * @return List 集合对象
	 * */
	public List findByOpFid(Object opFid) {
		String hql = "from Operation where OpFID=?";
		Query qy = this.getSession(true).createQuery(hql);
		qy.setString(0, opFid.toString());
		List li = qy.list();
		return li;
	}

	public List findByOpName(Object opName) {
		return findByProperty(OP_NAME, opName);
	}

	public List findByOpUrl(Object opUrl) {
		return findByProperty(OP_URL, opUrl);
	}

	public List findAll() {
		log.debug("finding all Operation instances");
		try {
			String queryString = "from Operation";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Operation merge(Operation detachedInstance) {
		log.debug("merging Operation instance");
		try {
			Operation result = (Operation) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Operation instance) {
		log.debug("attaching dirty Operation instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Operation instance) {
		log.debug("attaching clean Operation instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static OperationDAO getFromApplicationContext(ApplicationContext ctx) {
		return (OperationDAO) ctx.getBean("OperationDAO");
	}
}