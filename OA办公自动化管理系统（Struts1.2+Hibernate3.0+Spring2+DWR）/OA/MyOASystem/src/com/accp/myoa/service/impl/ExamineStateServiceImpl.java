
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.ExamineStateDao;
import com.accp.myoa.entity.ExamineState;
import com.accp.myoa.service.ExamineStateService;

public class ExamineStateServiceImpl implements ExamineStateService {
	private ExamineStateDao examineStateDao;
	
	
	
	public void setExamineStateDao(ExamineStateDao examineStateDao) {
		this.examineStateDao = examineStateDao;
	}

	public void add(ExamineState examineState) {
		examineStateDao.add(examineState);

	}

	public void del(int id) {
		examineStateDao.del(id);

	}

	public ExamineState load(int id) {
		return examineStateDao.load(id);
	}

	public List<ExamineState> loadList(ExamineState examineState) {
		return examineStateDao.loadList(examineState);
	}

	public void update(ExamineState examineState) {
		examineStateDao.update(examineState);

	}

}

