package com.xdf.exams.dao.hibernate;

import org.hibernate.Query;

import com.xdf.exams.dao.IExamrecordDAO;

public class ExamrecordDAOImp extends BaseDAO implements IExamrecordDAO{

	public void deleteExamrecordbyResult(Long resultid) {
		Query q = getSession().createQuery("delete Examrecord r where r.result.resultid=?");
		q.setLong(0,resultid);
		q.executeUpdate();
	}

	public void deleteExamrecordbyQuestion(Long qid) {
		Query q = getSession().createQuery("delete Examrecord r where r.question.questionid=?");
		q.setLong(0,qid);
		q.executeUpdate();		
	}

}
