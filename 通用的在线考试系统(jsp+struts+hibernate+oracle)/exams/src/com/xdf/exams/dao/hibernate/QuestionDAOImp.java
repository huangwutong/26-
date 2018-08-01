package com.xdf.exams.dao.hibernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.xdf.exams.bean.Question;
import com.xdf.exams.dao.IQuestionDAO;

public class QuestionDAOImp extends BaseDAO implements IQuestionDAO{

	public List findQuestionBySubject(Long subjectid, int pageno, int pagesize) {
		Criteria c = getSession()
				.createCriteria(Question.class)
				.createAlias("subject","s")
				.add(Restrictions.eq("s.subjectid",subjectid))
				.addOrder(Order.asc("questionid"))
				.setFirstResult((pageno-1)*pagesize)
				.setMaxResults(pagesize);
		return c.list();
	}

	public List findQuestionBySubject(Long subjectid) {
		Criteria c = getSession()
			.createCriteria(Question.class)
			.createAlias("subject","s")
			.addOrder(Order.asc("questionid"))
			.add(Restrictions.eq("s.subjectid",subjectid));		
		return c.list();
	}

	public int findQuestionnumBySubject(Long subjectid) {
		Criteria c = getSession()
		.createCriteria(Question.class)
		.createAlias("subject","s")
		.add(Restrictions.eq("s.subjectid",subjectid))
		.setProjection(Projections.rowCount());	
		Integer a = (Integer)c.list().get(0);
		return a.intValue();
		
	}

	public void deletebySubject(Long subjectid) {
		Query q = getSession().createQuery("delete Question r where r.subject.subjectid=?");
		q.setLong(0,subjectid);
		q.executeUpdate();
	}
}
