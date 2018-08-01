package com.xdf.exams.bo;

import java.util.List;

import com.xdf.exams.bean.Teacher;

public interface ITeacherService {
	public List findAllTeacher();
	public List findAllTeacher(int pageno,int pagesize);
	public int findTeachernum();
	
	
	public Teacher findTeacher(Long id);
	public void addTeacher(Teacher s);
	public void deleteTeacher(Teacher s);
	public void updateTeacher(Teacher s);

}
