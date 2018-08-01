

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Level;

public interface LevelDao {
	public void add(Level level);
	public void del(int id);
	public void update(Level level);
	public Level load(int id);
	public List<Level> loadList(Level level);
}



