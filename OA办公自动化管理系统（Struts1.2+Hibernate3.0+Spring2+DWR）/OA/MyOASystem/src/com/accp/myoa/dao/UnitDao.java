

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Unit;

public interface UnitDao {
	public void add(Unit unit);
	public void del(int id);
	public void update(Unit unit);
	public Unit load(int id);
	public List<Unit> loadList(Unit unit);
	
	//查看单位信息 LEO
	public List<Unit> loadAll();
}



