package com.xdf.exams.bo.service;

import java.util.ArrayList;
import java.util.List;

import com.xdf.exams.bean.Examrecord;
import com.xdf.exams.bean.Question;
import com.xdf.exams.bean.Result;
import com.xdf.exams.bo.IExamService;
import com.xdf.exams.dao.IExamrecordDAO;
import com.xdf.exams.dao.IQuestionDAO;
import com.xdf.exams.dao.IResultDAO;
import com.xdf.exams.dao.ISubjectDAO;

public class ExamServiceImp extends BaseService implements IExamService{
	private IExamrecordDAO examrecorddao = null;	
	private IQuestionDAO questiondao = null;
	private IResultDAO resultdao = null;
	private ISubjectDAO subjectdao = null;
	
	public IExamrecordDAO getExamrecorddao() {
		return examrecorddao;
	}

	public void setExamrecorddao(IExamrecordDAO examrecorddao) {
		this.examrecorddao = examrecorddao;
	}

	public IQuestionDAO getQuestiondao() {
		return questiondao;
	}

	public void setQuestiondao(IQuestionDAO questiondao) {
		this.questiondao = questiondao;
	}

	public IResultDAO getResultdao() {
		return resultdao;
	}

	public void setResultdao(IResultDAO resultdao) {
		this.resultdao = resultdao;
	}

	public ISubjectDAO getSubjectdao() {
		return subjectdao;
	}

	public void setSubjectdao(ISubjectDAO subjectdao) {
		this.subjectdao = subjectdao;
	}

	public List findExamable(Long studentid) {
		return subjectdao.findExamable(studentid);
	}

	public List findinitExam(Long subjectid) {
		List list = questiondao.findQuestionBySubject(subjectid);
		List recordlist = new ArrayList();
		for (int i=0;i<list.size();i++) {
			Question q = (Question)list.get(i);
			Examrecord er = new Examrecord();
			er.setQuestion(q);
			recordlist.add(er);
		}
		return recordlist;
	}

	public boolean findcanExam(Long studentid, Long subjectid) {
		return resultdao.findcanExam(studentid,subjectid);
	}

	public Result submit(Result r, List recordlist) {
		try {
			beginTransaction();
			for (int i=0;i<recordlist.size();i++) {
				Examrecord er = (Examrecord)recordlist.get(i);
				if (er.getAnswer()!=null&&er.getAnswer().equals(er.getQuestion().getRightanswer())) {
					r.setScore(r.getScore() + er.getQuestion().getScore());
				}
			}
			resultdao.add(r);
			for (int i=0;i<recordlist.size();i++) {
				Examrecord er = (Examrecord)recordlist.get(i);
				er.setResult(r);				
				examrecorddao.add(er);
			}
			commitTransaction();
		} catch (RuntimeException e) {
			rollbackTransaction();
			e.printStackTrace();
			throw e;
		}
		return r;
	}

}
