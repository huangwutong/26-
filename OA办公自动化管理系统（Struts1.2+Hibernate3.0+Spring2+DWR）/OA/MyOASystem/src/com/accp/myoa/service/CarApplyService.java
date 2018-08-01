
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.CarApply;

public interface CarApplyService {
	public void add(CarApply carApply);
	public void del(int id);
	public void update(CarApply carApply);
	public CarApply load(int id);
	public List<CarApply> loadList(CarApply carApply);
}



