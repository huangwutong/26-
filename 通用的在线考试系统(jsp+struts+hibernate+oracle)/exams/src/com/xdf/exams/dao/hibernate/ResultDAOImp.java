package com.xdf.exams.dao.hibernate;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.xdf.exams.bean.Result;
import com.xdf.exams.dao.IResultDAO;

public class ResultDAOImp extends BaseDAO implements IResultDAO {

	public void deleteResultbyStudent(Long studentid) {
		Query q = getSession().createQuery(
				"delete Result r where r.student.studentid=?");
		q.setLong(0, studentid);
		q.executeUpdate();
	}

	public void deleteResultbySubject(Long subjectid) {
		Query q = getSession().createQuery(
				"delete Result r where r.subject.subjectid=?");
		q.setLong(0, subjectid);
		q.executeUpdate();
	}

	public boolean findcanExam(Long studentid, Long subjectid) {
		Query q = getSession()
				.createQuery(
						"from Result r where r.student.studentid=? and r.subject.subjectid=?");
		q.setLong(0, studentid);
		q.setLong(1, subjectid);
		List list = q.list();
		if (list.size() == 0) {
			Query q2 = getSession()
			.createQuery(
					"from Subject s where s.subjectid=? and s.state=1 and s.totalnum>0");
			q2.setLong(0,subjectid);
			List list2 = q2.list();
			if(list2.size()==0) {
				return false;
			}
			else {
				return true;
			}
		} else {
			return false;
		}
	}

	public List findRecord(Long resultid) {
		return getSession()
				.createQuery(
						"from Examrecord e where e.result.resultid=? order by e.examrecordid")
				.setLong(0, resultid).list();
	}

	public List findResult(Long subjectid, String username, String name,
			Date startdate, Date enddate, String order, int pageno, int pagesize) {
		Criteria c = getSession().createCriteria(Result.class).createAlias(
				"subject", "s").createAlias("student", "st");

		if (subjectid != null && !subjectid.equals(new Long(0))) {
			c.add(Restrictions.eq("s.subjectid", subjectid));
		}
		if (username != null && !username.equals("")) {
			c.add(Restrictions.like("st.username", "%" + username + "%"));
		}

		if (name != null && !name.equals("")) {
			c.add(Restrictions.like("st.name", "%" + name + "%"));
		}
		if (startdate != null) {
			c.add(Restrictions.ge("starttime", startdate));
		}
		if (enddate != null) {
			c.add(Restrictions.le("endtime", enddate));
		}
		if (order == null||order.equals("")) {
			order = "resultid";
		}
		c.addOrder(Order.asc(order));
		c.setFirstResult((pageno - 1) * pagesize);
		c.setMaxResults(pagesize);
		return c.list();
	}

	public List findResultByUserid(Long id) {
		return getSession()
				.createQuery(
						"from Result e where e.student.studentid=? order by e.resultid desc")
				.setLong(0, id).list();
	}

	public int findResultnum(Long subjectid, String username, String name,
			Date startdate, Date enddate) {

		Criteria c = getSession().createCriteria(Result.class).createAlias(
				"subject", "s").createAlias("student", "st");

		if (subjectid != null && !subjectid.equals(new Long(0))) {
			c.add(Restrictions.eq("s.subjectid", subjectid));
		}
		if (username != null && !username.equals("")) {
			c.add(Restrictions.like("st.username", "%" + username + "%"));
		}

		if (name != null && !name.equals("")) {
			c.add(Restrictions.like("st.name", "%" + name + "%"));
		}
		if (startdate != null) {
			c.add(Restrictions.ge("starttime", startdate));
		}
		if (enddate != null) {
			c.add(Restrictions.le("endtime", enddate));
		}
		c.setProjection(Projections.rowCount());
		List list = c.list();
		Integer num = (Integer) list.get(0);
		return num.intValue();
	}
}
