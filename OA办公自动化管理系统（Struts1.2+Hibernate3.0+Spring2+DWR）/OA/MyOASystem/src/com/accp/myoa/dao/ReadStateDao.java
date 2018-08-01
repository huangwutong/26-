

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.ReadState;

public interface ReadStateDao {
	public void add(ReadState readState);
	public void del(int id);
	public void update(ReadState readState);
	public ReadState load(int id);
	public List<ReadState> loadList(ReadState readState);
}



