

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.BulletinRead;

public interface BulletinReadDao {
	public void add(BulletinRead bulletinRead);
	public void del(int id);
	public void update(BulletinRead bulletinRead);
	public BulletinRead load(int id);
	public List<BulletinRead> loadList(BulletinRead bulletinRead);
}



