package com.xdf.exams.bo.service;

import java.util.List;

import com.xdf.exams.bean.Teacher;
import com.xdf.exams.bo.ITeacherService;
import com.xdf.exams.dao.ITeacherDAO;

public class TeacherServiceImp extends BaseService implements ITeacherService{
	private ITeacherDAO teacherdao = null;
	
	public ITeacherDAO getTeacherdao() {
		return teacherdao;
	}

	public void setTeacherdao(ITeacherDAO teacherdao) {
		this.teacherdao = teacherdao;
	}
	
	public void addTeacher(Teacher s) {
		beginTransaction();
		teacherdao.add(s);
		commitTransaction();
	}

	public void deleteTeacher(Teacher s) {
		beginTransaction();
		teacherdao.delete(s);
		commitTransaction();
	}

	public List findAllTeacher() {
		return teacherdao.findAllTeacher();
	}

	public List findAllTeacher(int pageno, int pagesize) {
		return teacherdao.findAllTeacher(pageno,pagesize);
	}

	public Teacher findTeacher(Long id) {
		return (Teacher)teacherdao.load(Teacher.class,id);
	}

	public int findTeachernum() {
		return teacherdao.findTeachernum();
	}

	public void updateTeacher(Teacher s) {
		beginTransaction();
		teacherdao.update(s);
		commitTransaction();
	}



}
