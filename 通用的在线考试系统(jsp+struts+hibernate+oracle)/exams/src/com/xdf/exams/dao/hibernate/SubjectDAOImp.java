package com.xdf.exams.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.xdf.exams.dao.ISubjectDAO;

public class SubjectDAOImp extends BaseDAO implements ISubjectDAO{

	public List findAllSubjects() {
		return getSession()
			.createQuery("from Subject order by id")
			.list();
	}

	public List findAllSubjects(int pageno, int pagesize) {
		return getSession()
		.createQuery("from Subject order by id")
		.setFirstResult((pageno-1)*pagesize)
		.setMaxResults(pagesize)
		.list();
	}

	public int findAllSubjectsnum() {
		Query q = getSession().createQuery("select count(*) from Subject");
		List list = q.list();
		Integer a = (Integer)list.get(0);
		return a.intValue();
	}
	
	public List findExamable(Long studentid) {
		Query q = getSession().createQuery(
			"from Subject s where s.state=1 and s.subjectid not in(select r.subject.subjectid from Result r where r.student.studentid=?) order by s.subjectid");
		q.setLong(0,studentid);
		return q.list();
	}
}
