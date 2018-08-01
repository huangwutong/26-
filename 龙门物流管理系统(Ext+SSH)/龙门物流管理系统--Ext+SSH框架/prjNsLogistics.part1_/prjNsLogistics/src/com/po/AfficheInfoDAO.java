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
 * AfficheInfo entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.po.AfficheInfo
 * @author MyEclipse Persistence Tools
 */

public class AfficheInfoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(AfficheInfoDAO.class);
	// property constants
	public static final String AFFICHE_TITLE = "afficheTitle";
	public static final String AFFICHE_CONTENT = "afficheContent";
	public static final String AFFICHE_DATA = "afficheData";

	protected void initDao() {
		// do nothing
	}

	public void save(AfficheInfo transientInstance) {
		log.debug("saving AfficheInfo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(AfficheInfo persistentInstance) {
		log.debug("deleting AfficheInfo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AfficheInfo findById(java.lang.Integer id) {
		log.debug("getting AfficheInfo instance with id: " + id);
		try {
			AfficheInfo instance = (AfficheInfo) getHibernateTemplate().get(
					"com.po.AfficheInfo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(AfficheInfo instance) {
		log.debug("finding AfficheInfo instance by example");
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
		log.debug("finding AfficheInfo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from AfficheInfo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAfficheTitle(Object afficheTitle) {
		return findByProperty(AFFICHE_TITLE, afficheTitle);
	}

	public List findByAfficheContent(Object afficheContent) {
		return findByProperty(AFFICHE_CONTENT, afficheContent);
	}

	public List findByAfficheData(Object afficheData) {
		return findByProperty(AFFICHE_DATA, afficheData);
	}

	public List findAll() {
		log.debug("finding all AfficheInfo instances");
		try {
			String queryString = "from AfficheInfo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public AfficheInfo merge(AfficheInfo detachedInstance) {
		log.debug("merging AfficheInfo instance");
		try {
			AfficheInfo result = (AfficheInfo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(AfficheInfo instance) {
		log.debug("attaching dirty AfficheInfo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(AfficheInfo instance) {
		log.debug("attaching clean AfficheInfo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AfficheInfoDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (AfficheInfoDAO) ctx.getBean("AfficheInfoDAO");
	}
	//========按公司ID查================
	public List findByBranchID(int branchID){
		String hql = "from AfficheInfo where branchInfo=?";
		Query qy = this.getSession(true).createQuery(hql);
		
		qy.setInteger(0, branchID);
		
		List li = qy.list();
		
		return li;
	}
	//========================
}