package com.xdf.exams.bo.service;

import java.util.List;

import com.xdf.exams.bean.Result;
import com.xdf.exams.bean.Student;
import com.xdf.exams.bo.IStudentService;
import com.xdf.exams.dao.IExamrecordDAO;
import com.xdf.exams.dao.IResultDAO;
import com.xdf.exams.dao.IStudentDAO;

public class StudentServiceImp extends BaseService implements IStudentService{
	private IExamrecordDAO examrecorddao = null;	
	private IResultDAO resultdao = null;
	private IStudentDAO studentdao = null;
	
	public IExamrecordDAO getExamrecorddao() {
		return examrecorddao;
	}

	public void setExamrecorddao(IExamrecordDAO examrecorddao) {
		this.examrecorddao = examrecorddao;
	}

	public IResultDAO getResultdao() {
		return resultdao;
	}

	public void setResultdao(IResultDAO resultdao) {
		this.resultdao = resultdao;
	}

	public IStudentDAO getStudentdao() {
		return studentdao;
	}

	public void setStudentdao(IStudentDAO studentdao) {
		this.studentdao = studentdao;
	}

	public void addStudent(Student s) {
		beginTransaction();
		studentdao.add(s);
		commitTransaction();
	}

	public void deleteStudent(Student s) {
		try {
			beginTransaction();
			List list = resultdao.findResultByUserid(s.getStudentid());
			for (int i=0;i<list.size();i++) {
				Result r = (Result)list.get(i);
				examrecorddao.deleteExamrecordbyResult(r.getResultid());
			}
			resultdao.deleteResultbyStudent(s.getStudentid());
			studentdao.delete(s);
			commitTransaction();
		} catch (RuntimeException e) {
			rollbackTransaction();
			e.printStackTrace();
			throw e;
		}
	}

	public List findAllStudent() {
		return studentdao.findAllStudent();
	}

	public List findAllStudent(int pageno,int pagesize ) {
		return studentdao.findAllStudent(pageno,pagesize);
	}

	public Student findStudent(Long id) {
		return (Student)studentdao.load(Student.class,id);
	}

	public List findStudentByName(String name, int pageno, int pagesize) {
		return studentdao.findStudentByName(name,pageno,pagesize);
	}

	public int findStudentnum() {
		return studentdao.findStudentnum();
	}

	public int findStudentnumByName(String name) {
		return studentdao.findStudentnumByName(name);
	}

	public void updateStudent(Student s) {
		beginTransaction();
		studentdao.update(s);
		commitTransaction();
	}
	public boolean checkStudentNameExists(String name,Long id) {
		return studentdao.checkStudentNameExists(name,id);
	}
}
