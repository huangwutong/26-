
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.TurnOutForWorkDao;
import com.accp.myoa.entity.TurnOutForWork;
import com.accp.myoa.service.TurnOutForWorkService;

public class TurnOutForWorkServiceImpl implements TurnOutForWorkService {
	private TurnOutForWorkDao turnOutForWorkDao;
	
	
	
	public void setTurnOutForWorkDao(TurnOutForWorkDao turnOutForWorkDao) {
		this.turnOutForWorkDao = turnOutForWorkDao;
	}

	public void add(TurnOutForWork turnOutForWork) {
		turnOutForWorkDao.add(turnOutForWork);

	}

	public void del(int id) {
		turnOutForWorkDao.del(id);

	}

	public TurnOutForWork load(int id) {
		return turnOutForWorkDao.load(id);
	}

	public List<TurnOutForWork> loadList(TurnOutForWork turnOutForWork) {
		return turnOutForWorkDao.loadList(turnOutForWork);
	}

	public void update(TurnOutForWork turnOutForWork) {
		turnOutForWorkDao.update(turnOutForWork);

	}

}

