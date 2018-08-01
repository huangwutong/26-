package com.xdf.exams.dao;

public interface IExamrecordDAO extends IDAO{
	public void deleteExamrecordbyResult(Long resultid);
	public void deleteExamrecordbyQuestion(Long qid);
}
