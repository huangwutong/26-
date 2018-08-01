package com.xdf.exams.dao;

import java.util.Date;
import java.util.List;

public interface ILoginlogDAO extends IDAO{
	public List findLog(Date start,Date end,int isteacher,int pageno,int pagesize);
	public int findLognum(Date start,Date end,int isteacher);

}
