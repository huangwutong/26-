
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.TurnOutForWorkDao;
import com.accp.myoa.entity.TurnOutForWork;

@SuppressWarnings("unchecked")
public class TurnOutForWorkDaoImpl extends BaseHibernateDao implements TurnOutForWorkDao {

	@Override
	public void add(TurnOutForWork turnOutForWork) {
		super.getHibernateTemplate().save(turnOutForWork);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public TurnOutForWork load(int id) {
		return (TurnOutForWork)getHibernateTemplate().load(TurnOutForWork.class, id);
	}

	@Override
	public List<TurnOutForWork> loadList(TurnOutForWork turnOutForWork) {
		if (turnOutForWork!=null) {
			return getHibernateTemplate().findByExample(turnOutForWork);
		}
		return getHibernateTemplate().loadAll(TurnOutForWork.class);
	}	

	@Override
	public void update(TurnOutForWork turnOutForWork) {
		getHibernateTemplate().update(turnOutForWork);

	}

}






