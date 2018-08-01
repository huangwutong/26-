
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.Position;

public interface PositionService {
	public void add(Position position);
	public void del(int id);
	public void update(Position position);
	public Position load(int id);
	public List<Position> loadList(Position position);
	public List<Position> loadPositions(int deptId);
	
	//查看职位信息 LEO
	public List<Position> findAllPosition();
	public void insertPosition(Position position);
}



