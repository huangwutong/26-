package com.xdf.exams.bo;

import java.util.List;

import com.xdf.exams.bean.Result;

public interface IExamService {
	public List findinitExam(Long subjectid);
	public boolean findcanExam(Long studentid,Long subjectid);
	public Result submit(Result r,List recordlist);
	public List findExamable(Long studentid);
}
