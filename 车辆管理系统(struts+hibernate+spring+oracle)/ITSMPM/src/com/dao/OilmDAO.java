package com.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Oilm;

/**
 * A data access object (DAO) providing persistence and search support for Oilm
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.java.Oilm
 * @author MyEclipse Persistence Tools
 */

public class OilmDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(OilmDAO.class);
	// property constants
	public static final String OILCNUM = "oilcnum";
	public static final String OILKIND = "oilkind";
	public static final String OPRICE = "oprice";
	public static final String OCOUNT = "ocount";
	public static final String AMOUNT = "amount";
	public static final String HANDNM = "handnm";
	public static final String NOWMILE = "nowmile";
	public static final String LASTMILE = "lastmile";
	public static final String LASTOIL = "lastoil";
	public static final String LASTTRAV = "lasttrav";
	public static final String GASNM = "gasnm";
	public static final String OILDES = "oildes";

	protected void initDao() {
		// do nothing
	}

	public void save(Oilm transientInstance) {
		log.debug("saving Oilm instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Oilm persistentInstance) {
		log.debug("deleting Oilm instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Oilm findById(java.lang.Long id) {
		log.debug("getting Oilm instance with id: " + id);
		try {
			Oilm instance = (Oilm) getHibernateTemplate().get("com.java.Oilm",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Oilm instance) {
		log.debug("finding Oilm instance by example");
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
		log.debug("finding Oilm instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Oilm as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOilcnum(Object oilcnum) {
		return findByProperty(OILCNUM, oilcnum);
	}

	public List findByOilkind(Object oilkind) {
		return findByProperty(OILKIND, oilkind);
	}

	public List findByOprice(Object oprice) {
		return findByProperty(OPRICE, oprice);
	}

	public List findByOcount(Object ocount) {
		return findByProperty(OCOUNT, ocount);
	}

	public List findByAmount(Object amount) {
		return findByProperty(AMOUNT, amount);
	}

	public List findByHandnm(Object handnm) {
		return findByProperty(HANDNM, handnm);
	}

	public List findByNowmile(Object nowmile) {
		return findByProperty(NOWMILE, nowmile);
	}

	public List findByLastmile(Object lastmile) {
		return findByProperty(LASTMILE, lastmile);
	}

	public List findByLastoil(Object lastoil) {
		return findByProperty(LASTOIL, lastoil);
	}

	public List findByLasttrav(Object lasttrav) {
		return findByProperty(LASTTRAV, lasttrav);
	}

	public List findByGasnm(Object gasnm) {
		return findByProperty(GASNM, gasnm);
	}

	public List findByOildes(Object oildes) {
		return findByProperty(OILDES, oildes);
	}

	public List findAll() {
		log.debug("finding all Oilm instances");
		try {
			String queryString = "from Oilm";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Oilm merge(Oilm detachedInstance) {
		log.debug("merging Oilm instance");
		try {
			Oilm result = (Oilm) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Oilm instance) {
		log.debug("attaching dirty Oilm instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Oilm instance) {
		log.debug("attaching clean Oilm instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static OilmDAO getFromApplicationContext(ApplicationContext ctx) {
		return (OilmDAO) ctx.getBean("OilmDAO");
	}
}