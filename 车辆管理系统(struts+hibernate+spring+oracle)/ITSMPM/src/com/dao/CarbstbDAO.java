package com.dao;

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Carbstb;

/**
 * A data access object (DAO) providing persistence and search support for
 * Carbstb entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.java.Carbstb
 * @author MyEclipse Persistence Tools
 */

public class CarbstbDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CarbstbDAO.class);
	// property constants
	public static final String CARNUM = "carnum";
	public static final String BRAND = "brand";
	public static final String CMODE = "cmode";
	public static final String CARKIND = "carkind";
	public static final String FCONSU = "fconsu";
	public static final String ENGINUM = "enginum";
	public static final String FRAMENUM = "framenum";
	public static final String CARLOAD = "carload";
	public static final String SEATNUM = "seatnum";
	public static final String DRIVER = "driver";
	public static final String BUYUNIT = "buyunit";
	public static final String BUYPRICE = "buyprice";
	public static final String INITMILE = "initmile";
	public static final String MAINMILE = "mainmile";
	public static final String MAINCYCLE = "maincycle";
	public static final String DEPARTM = "departm";
	public static final String CARSTATS = "carstats";
	public static final String CARDES = "cardes";

	protected void initDao() {
		// do nothing
	}

	public void save(Carbstb transientInstance) {
		log.debug("saving Carbstb instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Carbstb persistentInstance) {
		log.debug("deleting Carbstb instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Carbstb findById(java.lang.Long id) {
		log.debug("getting Carbstb instance with id: " + id);
		try {
			Carbstb instance = (Carbstb) getHibernateTemplate().get(
					"com.java.Carbstb", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Carbstb instance) {
		log.debug("finding Carbstb instance by example");
		try {
			//返回一个集合
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
		log.debug("finding Carbstb instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Carbstb as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCarnum(Object carnum) {
		return findByProperty(CARNUM, carnum);
	}

	public List findByBrand(Object brand) {
		return findByProperty(BRAND, brand);
	}

	public List findByCmode(Object cmode) {
		return findByProperty(CMODE, cmode);
	}

	public List findByCarkind(Object carkind) {
		return findByProperty(CARKIND, carkind);
	}

	public List findByFconsu(Object fconsu) {
		return findByProperty(FCONSU, fconsu);
	}

	public List findByEnginum(Object enginum) {
		return findByProperty(ENGINUM, enginum);
	}

	public List findByFramenum(Object framenum) {
		return findByProperty(FRAMENUM, framenum);
	}

	public List findByCarload(Object carload) {
		return findByProperty(CARLOAD, carload);
	}

	public List findBySeatnum(Object seatnum) {
		return findByProperty(SEATNUM, seatnum);
	}

	public List findByDriver(Object driver) {
		return findByProperty(DRIVER, driver);
	}

	public List findByBuyunit(Object buyunit) {
		return findByProperty(BUYUNIT, buyunit);
	}

	public List findByBuyprice(Object buyprice) {
		return findByProperty(BUYPRICE, buyprice);
	}

	public List findByInitmile(Object initmile) {
		return findByProperty(INITMILE, initmile);
	}

	public List findByMainmile(Object mainmile) {
		return findByProperty(MAINMILE, mainmile);
	}

	public List findByMaincycle(Object maincycle) {
		return findByProperty(MAINCYCLE, maincycle);
	}

	public List findByDepartm(Object departm) {
		return findByProperty(DEPARTM, departm);
	}

	public List findByCarstats(Object carstats) {
		return findByProperty(CARSTATS, carstats);
	}

	public List findByCardes(Object cardes) {
		return findByProperty(CARDES, cardes);
	}

	public List findAll() {
		log.debug("finding all Carbstb instances");
		try {
			String queryString = "from Carbstb";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Carbstb merge(Carbstb detachedInstance) {
		log.debug("merging Carbstb instance");
		try {
			Carbstb result = (Carbstb) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Carbstb instance) {
		log.debug("attaching dirty Carbstb instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Carbstb instance) {
		log.debug("attaching clean Carbstb instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	//根据标签还有id找到所有的汽车信息
	public List findAllByCarnm(Long id,String tab) {
		log.debug("finding all Carbstb instances");
		try {
			if(id==null){
				String queryString = "from "+tab+" ";
				return getHibernateTemplate().find(queryString);
			}
			else{
				String queryString = "from "+tab+" as model where model.carbstb.carbstbid="+id+"";
				return getHibernateTemplate().find(queryString);
			}
			
			
			
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	public static CarbstbDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CarbstbDAO) ctx.getBean("CarbstbDAO");
	}
}