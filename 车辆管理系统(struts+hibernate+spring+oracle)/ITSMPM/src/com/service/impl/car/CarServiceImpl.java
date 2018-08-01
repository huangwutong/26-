package com.service.impl.car;

import java.util.List;

import com.dao.CarbstbDAO;
import com.dao.OutcmDAO;
import com.java.Carbstb;
import com.java.Outcm;
import com.service.intface.car.CarService;

public class CarServiceImpl implements CarService {
   private CarbstbDAO carbstbDAO;
   private OutcmDAO outcmDAO;
//   获得所有的carbstb的信息
	public List getCarbstbAll() {
		return carbstbDAO.findAll();
	}
	
	public CarbstbDAO getCarbstbDAO() {
		return carbstbDAO;
	}
	public void setCarbstbDAO(CarbstbDAO carbstbDAO) {
		this.carbstbDAO = carbstbDAO;
	}

	
	public void saveCar(Carbstb car) {
		// TODO Auto-generated method stub
		carbstbDAO.save(car);
	}

	public void deleCarbstb(Carbstb car) {
		// TODO Auto-generated method stub
		carbstbDAO.delete(car);
	}

	public Carbstb QueryCarbstbById(Long id) {
		// TODO Auto-generated method stub
		return carbstbDAO.findById(id);
	}

	public void upCar(Carbstb car) {
		// TODO Auto-generated method stub
		carbstbDAO.merge(car);
	}
	////

	public Outcm QueryOutcmById(Long id) {
		// TODO Auto-generated method stub
		return outcmDAO.findById(id);
	}

	public List QueryById(Long id, String tab) {
		// TODO Auto-generated method stub
		return outcmDAO.getByid(id, tab);
	}

	public OutcmDAO getOutcmDAO() {
		return outcmDAO;
	}

	public void setOutcmDAO(OutcmDAO outcmDAO) {
		this.outcmDAO = outcmDAO;
	}

	 
	

}
