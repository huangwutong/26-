package com.xdf.exams.dao;

import com.xdf.exams.dao.hibernate.ExamrecordDAOImp;
import com.xdf.exams.dao.hibernate.LoginlogDAOImp;
import com.xdf.exams.dao.hibernate.OptionsDAOImp;
import com.xdf.exams.dao.hibernate.QuestionDAOImp;
import com.xdf.exams.dao.hibernate.ResultDAOImp;
import com.xdf.exams.dao.hibernate.StudentDAOImp;
import com.xdf.exams.dao.hibernate.SubjectDAOImp;
import com.xdf.exams.dao.hibernate.TeacherDAOImp;


public class DAOFactory {
	
	public static IExamrecordDAO getExamrecordDAO() {
		return new ExamrecordDAOImp();
	}
	public static ILoginlogDAO getLoginlogDAO() {
		return new LoginlogDAOImp();
	}
	public static IOptionsDAO getOptionsDAO() {
		return new OptionsDAOImp();
	}
	public static IQuestionDAO getQuestionDAO() {
		return new QuestionDAOImp();
	}
	public static IResultDAO getResultDAO() {
		return new ResultDAOImp();
	}
	public static IStudentDAO getStudentDAO() {
		return new StudentDAOImp();
	}
	public static ISubjectDAO getSubjectDAO() {
		return new SubjectDAOImp();
	}
	public static ITeacherDAO getTeacherDAO() {
		return new TeacherDAOImp();
	}	
}
