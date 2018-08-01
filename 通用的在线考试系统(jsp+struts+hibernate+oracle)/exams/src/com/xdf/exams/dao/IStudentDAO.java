package com.xdf.exams.dao;

import java.util.List;

import com.xdf.exams.bean.Student;

public interface IStudentDAO extends IDAO{
	public List findAllStudent();
	public List findAllStudent(int pageno,int pagesize);
	public int findStudentnum();
	

	public List findStudentByName(String name,int pageno,int pagesize);
	public int findStudentnumByName(String name);
	public Student studentlogin(String username,String password);
	public boolean checkStudentNameExists(String name,Long id);	
}
