package com.service.intface.car;

import java.util.List;

import com.java.Carbstb;
import com.java.Outcm;

public interface CarService {
	
	public List getCarbstbAll();
	public void saveCar(Carbstb car);
	public Carbstb QueryCarbstbById(Long id);
	public void deleCarbstb(Carbstb car);
	public void upCar(Carbstb car);
	public Outcm QueryOutcmById(Long id);
	public List QueryById(Long id,String tab);
}
