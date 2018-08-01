package com.xdf.exams.dao;

import java.util.Date;
import java.util.List;

public interface IResultDAO extends IDAO {
	public List findResultByUserid(Long id);

	public List findResult(Long subjectid, String username, String name,
			Date startdate, Date enddate, String order, int pageno, int pagesize);

	public int findResultnum(Long subjectid, String username, String name,
			Date startdate, Date enddate);

	public List findRecord(Long resultid);

	public boolean findcanExam(Long studentid, Long subjectid);

	public void deleteResultbyStudent(Long studentid);

	public void deleteResultbySubject(Long subjectid);

}
