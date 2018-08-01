package com.xdf.exams.bo.service;

import java.util.Date;
import java.util.List;

import com.xdf.exams.bean.Loginlog;
import com.xdf.exams.bean.Student;
import com.xdf.exams.bean.Teacher;
import com.xdf.exams.bo.ILogService;
import com.xdf.exams.dao.ILoginlogDAO;
import com.xdf.exams.dao.IStudentDAO;
import com.xdf.exams.dao.ITeacherDAO;

public class LogServiceImp extends BaseService implements ILogService{
	private ILoginlogDAO loginlogdao = null;
	private IStudentDAO studentdao = null;
	private ITeacherDAO teacherdao = null;
	
	public ILoginlogDAO getLoginlogdao() {
		return loginlogdao;
	}

	public void setLoginlogdao(ILoginlogDAO loginlogdao) {
		this.loginlogdao = loginlogdao;
	}

	public IStudentDAO getStudentdao() {
		return studentdao;
	}

	public void setStudentdao(IStudentDAO studentdao) {
		this.studentdao = studentdao;
	}

	public ITeacherDAO getTeacherdao() {
		return teacherdao;
	}

	public void setTeacherdao(ITeacherDAO teacherdao) {
		this.teacherdao = teacherdao;
	}

	public void addlog(Loginlog log) {
		beginTransaction();
		loginlogdao.add(log);
		commitTransaction();
	}

	public List findLog(Date start, Date end, int isteacher,int pageno,int pagesize) {
		return loginlogdao.findLog(start,end,isteacher,pageno,pagesize);
	}

	public int findLognum(Date start, Date end, int isteacher) {
		return loginlogdao.findLognum(start,end,isteacher);
	}

	public Student studentlogin(String username, String password) {
		return studentdao.studentlogin(username,password);
	}

	public Teacher teacherlogin(String username, String password) {
		return teacherdao.teacherlogin(username,password);
	}

}
