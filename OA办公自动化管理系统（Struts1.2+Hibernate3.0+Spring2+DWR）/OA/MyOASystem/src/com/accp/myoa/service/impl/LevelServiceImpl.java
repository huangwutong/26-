
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.LevelDao;
import com.accp.myoa.entity.Level;
import com.accp.myoa.service.LevelService;

public class LevelServiceImpl implements LevelService {
	private LevelDao levelDao;
	
	
	
	public void setLevelDao(LevelDao levelDao) {
		this.levelDao = levelDao;
	}

	public void add(Level level) {
		levelDao.add(level);

	}

	public void del(int id) {
		levelDao.del(id);

	}

	public Level load(int id) {
		return levelDao.load(id);
	}

	public List<Level> loadList(Level level) {
		return levelDao.loadList(level);
	}

	public void update(Level level) {
		levelDao.update(level);

	}

}

