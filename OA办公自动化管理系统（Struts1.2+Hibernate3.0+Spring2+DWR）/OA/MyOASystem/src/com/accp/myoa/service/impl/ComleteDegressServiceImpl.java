
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.ComleteDegressDao;
import com.accp.myoa.entity.ComleteDegress;
import com.accp.myoa.service.ComleteDegressService;

public class ComleteDegressServiceImpl implements ComleteDegressService {
	private ComleteDegressDao comleteDegressDao;
	
	
	
	public void setComleteDegressDao(ComleteDegressDao comleteDegressDao) {
		this.comleteDegressDao = comleteDegressDao;
	}

	public void add(ComleteDegress comleteDegress) {
		comleteDegressDao.add(comleteDegress);

	}

	public void del(int id) {
		comleteDegressDao.del(id);

	}

	public ComleteDegress load(int id) {
		return comleteDegressDao.load(id);
	}

	public List<ComleteDegress> loadList(ComleteDegress comleteDegress) {
		return comleteDegressDao.loadList(comleteDegress);
	}

	public void update(ComleteDegress comleteDegress) {
		comleteDegressDao.update(comleteDegress);

	}

}

