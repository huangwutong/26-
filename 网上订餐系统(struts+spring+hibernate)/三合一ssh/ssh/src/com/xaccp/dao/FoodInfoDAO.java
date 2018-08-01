package com.xaccp.dao;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xaccp.po.FoodInfo;

/**
 * Data access object (DAO) for domain model class FoodInfo.
 * @see com.xaccp.dao.FoodInfo
 * @author MyEclipse - Hibernate Tools
 */
public class FoodInfoDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(FoodInfoDAO.class);

	//property constants
	public static final String _FNAME = "FName";
	public static final String _FPRICE = "FPrice";
	public static final String _FFROM = "FFrom";
	public static final String _FIMAGE = "FImage";

	protected void initDao() {
		//do nothing
	}
    
    public void save(FoodInfo transientInstance) {
        log.debug("saving FoodInfo instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(FoodInfo persistentInstance) {
        log.debug("deleting FoodInfo instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public FoodInfo findById( java.lang.Integer id) {
        log.debug("getting FoodInfo instance with id: " + id);
        try {
            FoodInfo instance = (FoodInfo) getHibernateTemplate()
                    .get("com.xaccp.dao.FoodInfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(FoodInfo instance) {
        log.debug("finding FoodInfo instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding FoodInfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from FoodInfo as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByFName(Object FName) {
		return findByProperty(_FNAME, FName);
	}
	
	public List findByFPrice(Object FPrice) {
		return findByProperty(_FPRICE, FPrice);
	}
	
	public List findByFFrom(Object FFrom) {
		return findByProperty(_FFROM, FFrom);
	}
	
	public List findByFImage(Object FImage) {
		return findByProperty(_FIMAGE, FImage);
	}
	
    public FoodInfo merge(FoodInfo detachedInstance) {
        log.debug("merging FoodInfo instance");
        try {
            FoodInfo result = (FoodInfo) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(FoodInfo instance) {
        log.debug("attaching dirty FoodInfo instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(FoodInfo instance) {
        log.debug("attaching clean FoodInfo instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static FoodInfoDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (FoodInfoDAO) ctx.getBean("FoodInfoDAO");
	}
	
	/**
	 * 查询所有餐饮
	 * @return
	 */
	public List findAllFoodInfo(){
		String hql="FROM FoodInfo as food order by food.FDate desc";
		return getHibernateTemplate().find(hql);
	}
	
	/**
	 * 按企业查询餐饮
	 * @param enterid
	 * @return
	 */
	public List findFoodInfoByEnterprise(int enterid){
		String hql="FROM FoodInfo as food WHERE food.enterpriseInfo.EId=? order by food.FDate desc";
		return getHibernateTemplate().find(hql,enterid);
	}
	
	/**
	 * 按类型查询餐饮
	 * @param typeid
	 * @return
	 */
	public List findFoodByType(int typeid){
		String hql="FROM FoodInfo as food WHERE food.foodSmallType.fstId=? order by food.FDate desc";
		return getHibernateTemplate().find(hql,typeid);
	}
	
	/**
	 * 按状态查询餐饮
	 * @param fstate
	 * @return
	 */
	public List findFoodByState(int fstate){
		String hql="FROM FoodInfo as food WHERE food.FState=? order by food.FDate desc";
		return getHibernateTemplate().find(hql,fstate);
	}
	
	public List findFoodByTerm(String hql,List args){
		Object []obj=new Object[args.size()];
		for (int i = 0; i < args.size(); i++) {
			obj[i]=args.get(i);
		}
		return getHibernateTemplate().find(hql,args);
	}
}