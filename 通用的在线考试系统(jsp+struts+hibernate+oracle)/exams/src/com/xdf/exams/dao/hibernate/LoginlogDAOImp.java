package com.xdf.exams.dao.hibernate;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.xdf.exams.bean.Loginlog;
import com.xdf.exams.dao.ILoginlogDAO;

public class LoginlogDAOImp extends BaseDAO implements ILoginlogDAO{

	public List findLog(Date start, Date end, int isteacher,int pageno,int pagesize) {
		Criteria c = getSession().createCriteria(Loginlog.class);
		if(start!=null) {
			c.add(Restrictions.ge("logtime",start));
		}
		if(end!=null) {
			c.add(Restrictions.le("logtime",end));
		}
		if(isteacher>=0) {
			c.add(Restrictions.eq("isteacher",isteacher));
		}
		c.addOrder(Order.desc("loginlogid"));
		c.setFirstResult((pageno-1)*pagesize);
		c.setMaxResults(pagesize);
		return c.list();
	}

	public int findLognum(Date start, Date end, int isteacher) {
		Criteria c = getSession().createCriteria(Loginlog.class);
		if(start!=null) {
			c.add(Restrictions.ge("logtime",start));
		}
		if(end!=null) {
			c.add(Restrictions.le("logtime",end));
		}
		if(isteacher>=0) {
			c.add(Restrictions.eq("isteacher",isteacher));
		}
		c.setProjection(Projections.rowCount());
		Integer a = (Integer)c.list().get(0);
		return a.intValue();
	}

}
