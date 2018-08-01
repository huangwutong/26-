

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.PositionPopedom;

public interface PositionPopedomDao {
	public void add(PositionPopedom positionPopedom);
	public void del(int id);
	public void update(PositionPopedom positionPopedom);
	public PositionPopedom load(int id);
	public List<PositionPopedom> loadList(PositionPopedom positionPopedom);
	
	//查看权限信息 LEO
	public List<PositionPopedom> findByPage(int firstResult, int pageSize);
	public int getCount();
	public PositionPopedom get(int id);
	public List<PositionPopedom> loadAll();
}



