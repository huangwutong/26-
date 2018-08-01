

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Position;

public interface PositionDao {
	public void add(Position position);
	public void del(int id);
	public void update(Position position);
	public Position load(int id);
	public List<Position> loadList(Position position);
	
	//查看职位信息 LEO
	public List<Position> loadAll();
}



