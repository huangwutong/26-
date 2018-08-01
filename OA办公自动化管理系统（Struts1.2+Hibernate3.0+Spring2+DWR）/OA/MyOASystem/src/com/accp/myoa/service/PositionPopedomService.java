
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.PositionPopedom;

public interface PositionPopedomService {
	public void add(PositionPopedom positionPopedom);
	public void del(int id);
	public void update(PositionPopedom positionPopedom);
	public PositionPopedom load(int id);
	public List<PositionPopedom> loadList(PositionPopedom positionPopedom);
	
	//查看权限信息 LEO
	public List<PositionPopedom> findPositionPopedomByPage(int page);
	public int getPositionPopedomMaxPage();
	public PositionPopedom getPositionPopedom(int id);
	public List<PositionPopedom> loadAll();
	public void insertPositionPopedom(PositionPopedom positionPopedom);
}



