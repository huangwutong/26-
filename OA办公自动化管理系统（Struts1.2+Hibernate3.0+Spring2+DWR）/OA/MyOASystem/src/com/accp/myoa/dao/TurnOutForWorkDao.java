

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.TurnOutForWork;

public interface TurnOutForWorkDao {
	public void add(TurnOutForWork turnOutForWork);
	public void del(int id);
	public void update(TurnOutForWork turnOutForWork);
	public TurnOutForWork load(int id);
	public List<TurnOutForWork> loadList(TurnOutForWork turnOutForWork);
}



