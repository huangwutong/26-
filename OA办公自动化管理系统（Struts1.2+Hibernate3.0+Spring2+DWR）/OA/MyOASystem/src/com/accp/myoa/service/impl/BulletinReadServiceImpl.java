
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.BulletinReadDao;
import com.accp.myoa.entity.BulletinRead;
import com.accp.myoa.service.BulletinReadService;

public class BulletinReadServiceImpl implements BulletinReadService {
	private BulletinReadDao bulletinReadDao;
	
	
	
	public void setBulletinReadDao(BulletinReadDao bulletinReadDao) {
		this.bulletinReadDao = bulletinReadDao;
	}

	public void add(BulletinRead bulletinRead) {
		bulletinReadDao.add(bulletinRead);

	}

	public void del(int id) {
		bulletinReadDao.del(id);

	}

	public BulletinRead load(int id) {
		return bulletinReadDao.load(id);
	}

	public List<BulletinRead> loadList(BulletinRead bulletinRead) {
		return bulletinReadDao.loadList(bulletinRead);
	}

	public void update(BulletinRead bulletinRead) {
		bulletinReadDao.update(bulletinRead);

	}

}

