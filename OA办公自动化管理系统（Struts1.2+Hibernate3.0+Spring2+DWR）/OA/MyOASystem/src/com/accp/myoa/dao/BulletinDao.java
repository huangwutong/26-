

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Bulletin;

public interface BulletinDao {
	public void add(Bulletin bulletin);
	public void del(int id);
	public void update(Bulletin bulletin);
	public Bulletin load(int id);
	public List<Bulletin> loadList(Bulletin bulletin);
	public List<Bulletin> findByPage(int pageSize,int pageNum);
	public int getCount();
}



