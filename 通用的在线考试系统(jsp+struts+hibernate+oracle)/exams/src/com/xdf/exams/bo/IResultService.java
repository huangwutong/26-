package com.xdf.exams.bo;

import java.util.Date;
import java.util.List;

import com.xdf.exams.bean.Result;

public interface IResultService {
	public List findResultByUserid(Long id);
	
	public List findResult(Long subjectid,String username,String name,Date startdate,Date enddate,String order,int pageno,int pagesize);
	public int findResultnum(Long subjectid,String username,String name,Date startdate,Date enddate);
	
	public void deleteResult(Long id);
	
	public List findRecord(Long resultid);
	public Result findResult(Long resultid);
	
	
}
