
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.ReadStateDao;
import com.accp.myoa.entity.ReadState;

@SuppressWarnings("unchecked")
public class ReadStateDaoImpl extends BaseHibernateDao implements ReadStateDao {

	@Override
	public void add(ReadState readState) {
		super.getHibernateTemplate().save(readState);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public ReadState load(int id) {
		return (ReadState)getHibernateTemplate().load(ReadState.class, id);
	}

	@Override
	public List<ReadState> loadList(ReadState readState) {
		if (readState!=null) {
			return getHibernateTemplate().findByExample(readState);
		}
		return getHibernateTemplate().loadAll(ReadState.class);
	}	

	@Override
	public void update(ReadState readState) {
		getHibernateTemplate().update(readState);

	}

}






