package com.xdf.exams.dao;

import java.util.List;

public interface IQuestionDAO extends IDAO{
	public List findQuestionBySubject(Long subjectid);
	public List findQuestionBySubject(Long subjectid,int pageno,int pagesize);
	public int findQuestionnumBySubject(Long subjectid);	
	public void deletebySubject(Long subjectid);
}
