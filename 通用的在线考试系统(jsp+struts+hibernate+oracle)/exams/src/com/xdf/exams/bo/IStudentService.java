package com.xdf.exams.bo;

import java.util.List;

import com.xdf.exams.bean.Student;

public interface IStudentService {
	public List findAllStudent();
	public List findAllStudent(int pageno,int pagesize);
	public int findStudentnum();
	

	public List findStudentByName(String name,int pageno,int pagesize);
	public int findStudentnumByName(String name);
	
	public Student findStudent(Long id);
	public void addStudent(Student s);
	public void deleteStudent(Student s);
	public void updateStudent(Student s);
	
	public boolean checkStudentNameExists(String name,Long id);
}
