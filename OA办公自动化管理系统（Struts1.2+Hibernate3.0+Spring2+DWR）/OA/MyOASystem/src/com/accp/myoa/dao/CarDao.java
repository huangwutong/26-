

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Car;

public interface CarDao {
	public void add(Car car);
	public void del(int id);
	public void update(Car car);
	public Car load(int id);
	public List<Car> loadList(Car car);
}



