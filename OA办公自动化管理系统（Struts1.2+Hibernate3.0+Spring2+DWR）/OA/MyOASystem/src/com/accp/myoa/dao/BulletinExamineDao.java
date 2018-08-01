

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.BulletinExamine;

public interface BulletinExamineDao {
	public void add(BulletinExamine bulletinExamine);
	public void del(int id);
	public void update(BulletinExamine bulletinExamine);
	public BulletinExamine load(int id);
	public List<BulletinExamine> loadList(BulletinExamine bulletinExamine);
}



