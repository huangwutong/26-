package com.xdf.exams.dao;

import java.util.List;

public interface ISubjectDAO extends IDAO{
	public List findAllSubjects();
	public List findAllSubjects(int pageno,int pagesize);
	public int findAllSubjectsnum();
	public List findExamable(Long studentid);
}
