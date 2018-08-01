
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.Unit;

public interface UnitService {
	public void add(Unit unit);
	public void del(int id);
	public void update(Unit unit);
	public Unit load(int id);
	public List<Unit> loadList(Unit unit);
	
	//查看单位信息 LEO
	public List<Unit> findAllUnit();
	public void insertUnit(Unit unit);
}



