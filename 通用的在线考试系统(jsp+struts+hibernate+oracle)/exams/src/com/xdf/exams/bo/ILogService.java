package com.xdf.exams.bo;

import java.util.Date;
import java.util.List;

import com.xdf.exams.bean.Loginlog;
import com.xdf.exams.bean.Student;
import com.xdf.exams.bean.Teacher;

public interface ILogService {
	public Teacher teacherlogin(String username,String password);
	public Student studentlogin(String username,String password);
	public void addlog(Loginlog log);
	public List findLog(Date start,Date end,int isteacher,int pageno,int pagesize);
	public int findLognum(Date start,Date end,int isteacher);
}
