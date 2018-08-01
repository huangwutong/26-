
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.CarDao;
import com.accp.myoa.entity.Car;
import com.accp.myoa.service.CarService;

public class CarServiceImpl implements CarService {
	private CarDao carDao;
	
	
	
	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}

	public void add(Car car) {
		carDao.add(car);

	}

	public void del(int id) {
		carDao.del(id);

	}

	public Car load(int id) {
		return carDao.load(id);
	}

	public List<Car> loadList(Car car) {
		return carDao.loadList(car);
	}

	public void update(Car car) {
		carDao.update(car);

	}

}

