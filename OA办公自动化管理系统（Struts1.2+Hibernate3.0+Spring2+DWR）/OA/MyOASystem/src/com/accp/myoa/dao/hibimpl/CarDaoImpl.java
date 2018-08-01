
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.CarDao;
import com.accp.myoa.entity.Car;

@SuppressWarnings("unchecked")
public class CarDaoImpl extends BaseHibernateDao implements CarDao {

	@Override
	public void add(Car car) {
		super.getHibernateTemplate().save(car);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Car load(int id) {
		return (Car)getHibernateTemplate().load(Car.class,id);
	}

	@Override
	public List<Car> loadList(Car car) {
		if (car!=null) {
			return getHibernateTemplate().findByExample(car);
		}
		return getHibernateTemplate().loadAll(Car.class);
	}	

	@Override
	public void update(Car car) {
		getHibernateTemplate().update(car);

	}

}






