
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.CarApplyDao;
import com.accp.myoa.entity.CarApply;

@SuppressWarnings("unchecked")
public class CarApplyDaoImpl extends BaseHibernateDao implements CarApplyDao {

	@Override
	public void add(CarApply carApply) {
		super.getHibernateTemplate().save(carApply);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public CarApply load(int id) {
		return (CarApply)getHibernateTemplate().load(CarApply.class, id);
	}

	@Override
	public List<CarApply> loadList(CarApply carApply) {
		if (carApply!=null) {
			return getHibernateTemplate().findByExample(carApply);
		}
		return getHibernateTemplate().loadAll(CarApply.class);
	}	

	@Override
	public void update(CarApply carApply) {
		getHibernateTemplate().update(carApply);

	}

}






