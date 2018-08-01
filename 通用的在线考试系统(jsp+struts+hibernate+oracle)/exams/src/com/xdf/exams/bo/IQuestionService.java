package com.xdf.exams.bo;

import java.util.List;

import com.xdf.exams.bean.Question;
import com.xdf.exams.bean.Subject;

public interface IQuestionService {
	public List findAllSubjects();
	public List findAllSubjects(int pageno,int pagesize);
	public int findAllSubjectsnum();
	
	public List findQuestionBySubjects(Long subjectid);
	public List findQuestionBySubjects(Long subjectid,int pageno,int pagesize);
	public int findQuestionnumBySubjects(Long subjectid);	
	
	public void addSubject(Subject sub);
	public void deleteSubject(Subject sub);
	public void updateSubject(Subject sub);
	public Subject findSubject(Long id);
	
	public void addQuestion(Question que,List options);
	public void deleteQuestion(Question que);
	public void updateQuestion(Question que,List options);
	public Question findQuestion(Long id);
	
	 
}
