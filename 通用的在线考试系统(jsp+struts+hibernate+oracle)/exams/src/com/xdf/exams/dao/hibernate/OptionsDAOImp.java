package com.xdf.exams.dao.hibernate;

import org.hibernate.Query;

import com.xdf.exams.dao.IOptionsDAO;

public class OptionsDAOImp extends BaseDAO implements IOptionsDAO {

	public void deletebyquestion(Long qid) {
		Query q = getSession().createQuery("delete Options o where o.question.questionid=?");
		q.setLong(0,qid);
		q.executeUpdate();
	}

}
