package com.xdf.exams.bo.service;

import java.util.Date;
import java.util.List;

import com.xdf.exams.bean.Result;
import com.xdf.exams.bo.IResultService;
import com.xdf.exams.dao.IExamrecordDAO;
import com.xdf.exams.dao.IResultDAO;

public class ResultServiceImp extends BaseService implements IResultService {
	private IExamrecordDAO examrecorddao = null;

	private IResultDAO resultdao = null;

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

	public void deleteResult(Long id) {
		try {
			beginTransaction();
			examrecorddao.deleteExamrecordbyResult(id);
			resultdao.delete(resultdao.load(Result.class, id));
			commitTransaction();
		} catch (RuntimeException e) {
			rollbackTransaction();
			e.printStackTrace();
			throw e;
		}
	}

	public List findRecord(Long resultid) {
		return resultdao.findRecord(resultid);
	}

	public List findResult(Long subjectid, String username, String name,
			Date startdate, Date enddate, String order, int pageno, int pagesize) {
		return resultdao.findResult(subjectid, username, name, startdate,
				enddate, order, pageno, pagesize);
	}

	public List findResultByUserid(Long id) {
		return resultdao.findResultByUserid(id);
	}

	public int findResultnum(Long subjectid, String username, String name,
			Date startdate, Date enddate) {
		return resultdao.findResultnum(subjectid, username, name, startdate,
				enddate);
	}
	public Result findResult(Long resultid) {
		return (Result)resultdao.load(Result.class,resultid);
	}

}
