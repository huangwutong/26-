
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.BulletinExamineDao;
import com.accp.myoa.entity.BulletinExamine;
import com.accp.myoa.service.BulletinExamineService;

public class BulletinExamineServiceImpl implements BulletinExamineService {
	private BulletinExamineDao bulletinExamineDao;
	
	
	
	public void setBulletinExamineDao(BulletinExamineDao bulletinExamineDao) {
		this.bulletinExamineDao = bulletinExamineDao;
	}

	public void add(BulletinExamine bulletinExamine) {
		bulletinExamineDao.add(bulletinExamine);

	}

	public void del(int id) {
		bulletinExamineDao.del(id);

	}

	public BulletinExamine load(int id) {
		return bulletinExamineDao.load(id);
	}

	public List<BulletinExamine> loadList(BulletinExamine bulletinExamine) {
		return bulletinExamineDao.loadList(bulletinExamine);
	}

	public void update(BulletinExamine bulletinExamine) {
		bulletinExamineDao.update(bulletinExamine);

	}

}

