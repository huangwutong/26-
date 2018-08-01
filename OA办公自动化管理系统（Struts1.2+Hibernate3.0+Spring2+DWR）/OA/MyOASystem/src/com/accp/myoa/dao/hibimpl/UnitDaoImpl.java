
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.UnitDao;
import com.accp.myoa.entity.Unit;

@SuppressWarnings("unchecked")
public class UnitDaoImpl extends BaseHibernateDao implements UnitDao {

	@Override
	public void add(Unit unit) {
		super.getHibernateTemplate().save(unit);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Unit load(int id) {
		return (Unit)getHibernateTemplate().load(Unit.class, id);
	}

	@Override
	public List<Unit> loadList(Unit unit) {
		if (unit!=null) {
			return getHibernateTemplate().findByExample(unit);
		}
		return getHibernateTemplate().loadAll(Unit.class);
	}	

	@Override
	public void update(Unit unit) {
		getHibernateTemplate().update(unit);

	}
	
	//查看单位信息 LEO
	@Override
	public List<Unit> loadAll(){
		return this.getHibernateTemplate().loadAll(Unit.class);
	}
}






