

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.CarApply;

public interface CarApplyDao {
	public void add(CarApply carApply);
	public void del(int id);
	public void update(CarApply carApply);
	public CarApply load(int id);
	public List<CarApply> loadList(CarApply carApply);
}



