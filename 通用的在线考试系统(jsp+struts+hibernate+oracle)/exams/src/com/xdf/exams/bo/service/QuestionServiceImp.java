package com.xdf.exams.bo.service;

import java.util.List;

import com.xdf.exams.bean.Options;
import com.xdf.exams.bean.Question;
import com.xdf.exams.bean.Subject;
import com.xdf.exams.bo.IQuestionService;
import com.xdf.exams.dao.IExamrecordDAO;
import com.xdf.exams.dao.IOptionsDAO;
import com.xdf.exams.dao.IQuestionDAO;
import com.xdf.exams.dao.IResultDAO;
import com.xdf.exams.dao.ISubjectDAO;

public class QuestionServiceImp extends BaseService implements IQuestionService{
	private IExamrecordDAO examrecorddao = null;	
	private IOptionsDAO  optionsdao= null;
	private IQuestionDAO questiondao = null;
	private IResultDAO resultdao = null;
	private ISubjectDAO subjectdao = null;
	
	public IExamrecordDAO getExamrecorddao() {
		return examrecorddao;
	}

	public void setExamrecorddao(IExamrecordDAO examrecorddao) {
		this.examrecorddao = examrecorddao;
	}

	public IOptionsDAO getOptionsdao() {
		return optionsdao;
	}

	public void setOptionsdao(IOptionsDAO optionsdao) {
		this.optionsdao = optionsdao;
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

	public void addQuestion(Question que,List options) {
		try {
			beginTransaction();
			questiondao.add(que);
			for (int i=0;i<options.size();i++) {
				Options op = (Options)options.get(i);
				op.setQuestion(que);
				optionsdao.add(op);
			}
			commitTransaction();
		} catch (RuntimeException e) {
			e.printStackTrace();
			rollbackTransaction();
			throw e;
		}
	}

	public void addSubject(Subject sub) {
		beginTransaction();
		subjectdao.add(sub);
		commitTransaction();
	}

	public void deleteQuestion(Question que) {
		try {
			beginTransaction();
			optionsdao.deletebyquestion(que.getQuestionid());
			examrecorddao.deleteExamrecordbyQuestion(que.getQuestionid());
			questiondao.delete(que);
			commitTransaction();
		} catch (RuntimeException e) {
			rollbackTransaction();
			e.printStackTrace();
			throw e;
		}
	}

	public void deleteSubject(Subject sub) {
		try {
			beginTransaction();
			List list = questiondao.findQuestionBySubject(sub.getSubjectid());
			for (int i=0;i<list.size();i++) {
				Question q = (Question)list.get(i);
				optionsdao.deletebyquestion(q.getQuestionid());
				examrecorddao.deleteExamrecordbyQuestion(q.getQuestionid());
			}
			questiondao.deletebySubject(sub.getSubjectid());
			resultdao.deleteResultbySubject(sub.getSubjectid());
			subjectdao.delete(sub);
			commitTransaction();
		} catch (RuntimeException e) {
			rollbackTransaction();
			e.printStackTrace();
			throw e;
		}
	}

	public List findAllSubjects() {
		return subjectdao.findAllSubjects();
	}

	public List findAllSubjects(int pageno, int pagesize) {
		return subjectdao.findAllSubjects(pageno,pagesize);
	}

	public int findAllSubjectsnum() {
		return subjectdao.findAllSubjectsnum();
	}

	public Question findQuestion(Long id) {
		return (Question)questiondao.load(Question.class,id);
	}

	public List findQuestionBySubjects(Long subjectid, int pageno, int pagesize) {
		return questiondao.findQuestionBySubject(subjectid,pageno,pagesize);
	}

	public List findQuestionBySubjects(Long subjectid) {
		return questiondao.findQuestionBySubject(subjectid);
	}

	public int findQuestionnumBySubjects(Long subjectid) {
		return questiondao.findQuestionnumBySubject(subjectid);
	}

	public Subject findSubject(Long id) {
		return (Subject)subjectdao.load(Subject.class,id);
	}

	public void updateQuestion(Question que,List options) {
		try {
			beginTransaction();
			questiondao.update(que);
			optionsdao.deletebyquestion(que.getQuestionid());
			for (int i=0;i<options.size();i++) {
				Options op = (Options)options.get(i);
				op.setQuestion(que);
				optionsdao.add(op);
			}
			commitTransaction();
		} catch (RuntimeException e) {
			e.printStackTrace();
			rollbackTransaction();
			throw e;
		}
	}

	public void updateSubject(Subject sub) {
		beginTransaction();
		subjectdao.update(sub);
		commitTransaction();
	}

}
