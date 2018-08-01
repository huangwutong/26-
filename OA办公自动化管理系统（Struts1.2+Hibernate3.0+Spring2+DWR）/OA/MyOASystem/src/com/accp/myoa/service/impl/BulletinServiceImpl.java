
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.BulletinDao;
import com.accp.myoa.entity.Bulletin;
import com.accp.myoa.service.BulletinService;

public class BulletinServiceImpl implements BulletinService {
	private BulletinDao bulletinDao;
	
	
	
	public void setBulletinDao(BulletinDao bulletinDao) {
		this.bulletinDao = bulletinDao;
	}

	public void add(Bulletin bulletin) {
		bulletinDao.add(bulletin);

	}

	public void del(int id) {
		bulletinDao.del(id);

	}

	public Bulletin load(int id) {
		return bulletinDao.load(id);
	}

	public List<Bulletin> loadList(Bulletin bulletin) {
		return bulletinDao.loadList(bulletin);
	}

	public void update(Bulletin bulletin) {
		bulletinDao.update(bulletin);

	}
	
	@Override
	public List<Bulletin> findByPage(int pageSize, int pageNum) {
		return bulletinDao.findByPage(pageSize, pageNum);
	}

	@Override
	public int getCount() {
		return bulletinDao.getCount();
	}

}

