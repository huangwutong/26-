
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.UnitDao;
import com.accp.myoa.entity.Unit;
import com.accp.myoa.service.UnitService;

public class UnitServiceImpl implements UnitService {
	private UnitDao unitDao;
	
	
	
	public void setUnitDao(UnitDao unitDao) {
		this.unitDao = unitDao;
	}

	public void add(Unit unit) {
		unitDao.add(unit);

	}

	public void del(int id) {
		unitDao.del(id);

	}

	public Unit load(int id) {
		return unitDao.load(id);
	}

	public List<Unit> loadList(Unit unit) {
		return unitDao.loadList(unit);
	}

	public void update(Unit unit) {
		unitDao.update(unit);

	}
	
	
	//查看单位信息 LEO
	public List<Unit> findAllUnit(){
		return unitDao.loadAll();
	}
	public void insertUnit(Unit unit) {
		unitDao.add(unit);

	}
}

