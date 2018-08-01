
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.ComleteDegressDao;
import com.accp.myoa.entity.ComleteDegress;

@SuppressWarnings("unchecked")
public class ComleteDegressDaoImpl extends BaseHibernateDao implements ComleteDegressDao {

	@Override
	public void add(ComleteDegress comleteDegress) {
		super.getHibernateTemplate().save(comleteDegress);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public ComleteDegress load(int id) {
		return (ComleteDegress)getHibernateTemplate().load(ComleteDegress.class, id);
	}

	@Override
	public List<ComleteDegress> loadList(ComleteDegress comleteDegress) {
		if (comleteDegress!=null) {
			return getHibernateTemplate().findByExample(comleteDegress);
		}
		return getHibernateTemplate().loadAll(ComleteDegress.class);
	}	

	@Override
	public void update(ComleteDegress comleteDegress) {
		getHibernateTemplate().update(comleteDegress);

	}

}






