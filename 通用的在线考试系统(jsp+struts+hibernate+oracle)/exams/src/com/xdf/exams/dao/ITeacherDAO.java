package com.xdf.exams.dao;

import java.util.List;

import com.xdf.exams.bean.Teacher;

public interface ITeacherDAO extends IDAO{
	public List findAllTeacher();
	public List findAllTeacher(int pageno,int pagesize);
	public int findTeachernum();
	public Teacher teacherlogin(String username,String password);

}
