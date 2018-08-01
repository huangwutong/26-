
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.CarApplyDao;
import com.accp.myoa.entity.CarApply;
import com.accp.myoa.service.CarApplyService;

public class CarApplyServiceImpl implements CarApplyService {
	private CarApplyDao carApplyDao;
	
	
	
	public void setCarApplyDao(CarApplyDao carApplyDao) {
		this.carApplyDao = carApplyDao;
	}

	public void add(CarApply carApply) {
		carApplyDao.add(carApply);

	}

	public void del(int id) {
		carApplyDao.del(id);

	}

	public CarApply load(int id) {
		return carApplyDao.load(id);
	}

	public List<CarApply> loadList(CarApply carApply) {
		return carApplyDao.loadList(carApply);
	}

	public void update(CarApply carApply) {
		carApplyDao.update(carApply);

	}

}

