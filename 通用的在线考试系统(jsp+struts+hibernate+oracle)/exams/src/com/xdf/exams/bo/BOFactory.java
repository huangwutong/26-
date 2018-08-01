package com.xdf.exams.bo;

import com.xdf.exams.bo.service.ExamServiceImp;
import com.xdf.exams.bo.service.LogServiceImp;
import com.xdf.exams.bo.service.QuestionServiceImp;
import com.xdf.exams.bo.service.ResultServiceImp;
import com.xdf.exams.bo.service.StudentServiceImp;
import com.xdf.exams.bo.service.TeacherServiceImp;
import com.xdf.exams.dao.DAOFactory;

public class BOFactory {
	public static IExamService getExamService() {
		ExamServiceImp ser = new ExamServiceImp();
		ser.setExamrecorddao(DAOFactory.getExamrecordDAO());
		ser.setQuestiondao(DAOFactory.getQuestionDAO());
		ser.setResultdao(DAOFactory.getResultDAO());
		ser.setSubjectdao(DAOFactory.getSubjectDAO());
		return ser;
	}
	public static ILogService getLogService() {
		LogServiceImp ser = new LogServiceImp();
		ser.setLoginlogdao(DAOFactory.getLoginlogDAO());
		ser.setStudentdao(DAOFactory.getStudentDAO());
		ser.setTeacherdao(DAOFactory.getTeacherDAO());
		return ser;
	}
	public static IQuestionService getQuestionService() {
		QuestionServiceImp ser = new QuestionServiceImp();
		ser.setExamrecorddao(DAOFactory.getExamrecordDAO());
		ser.setQuestiondao(DAOFactory.getQuestionDAO());
		ser.setResultdao(DAOFactory.getResultDAO());
		ser.setSubjectdao(DAOFactory.getSubjectDAO());
		ser.setOptionsdao(DAOFactory.getOptionsDAO());
		return ser;
	}

	public static IResultService getResultService() {
		ResultServiceImp ser = new ResultServiceImp();
		ser.setExamrecorddao(DAOFactory.getExamrecordDAO());
		ser.setResultdao(DAOFactory.getResultDAO());
		return ser;
	}
	
	public static IStudentService getStudentService() {
		StudentServiceImp ser = new StudentServiceImp();
		ser.setExamrecorddao(DAOFactory.getExamrecordDAO());
		ser.setStudentdao(DAOFactory.getStudentDAO());
		ser.setResultdao(DAOFactory.getResultDAO());
		return ser;
	}
	
	public static ITeacherService getTeacherService() {
		TeacherServiceImp ser = new TeacherServiceImp();
		ser.setTeacherdao(DAOFactory.getTeacherDAO());
		return ser;
	}
}
