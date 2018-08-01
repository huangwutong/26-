
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.ReadStateDao;
import com.accp.myoa.entity.ReadState;
import com.accp.myoa.service.ReadStateService;

public class ReadStateServiceImpl implements ReadStateService {
	private ReadStateDao readStateDao;
	
	
	
	public void setReadStateDao(ReadStateDao readStateDao) {
		this.readStateDao = readStateDao;
	}

	public void add(ReadState readState) {
		readStateDao.add(readState);

	}

	public void del(int id) {
		readStateDao.del(id);

	}

	public ReadState load(int id) {
		return readStateDao.load(id);
	}

	public List<ReadState> loadList(ReadState readState) {
		return readStateDao.loadList(readState);
	}

	public void update(ReadState readState) {
		readStateDao.update(readState);

	}

}

