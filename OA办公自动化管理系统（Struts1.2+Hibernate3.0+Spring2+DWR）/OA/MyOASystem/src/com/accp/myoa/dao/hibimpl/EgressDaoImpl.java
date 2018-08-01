
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.EgressDao;
import com.accp.myoa.entity.Egress;

@SuppressWarnings("unchecked")
public class EgressDaoImpl extends BaseHibernateDao implements EgressDao {

	@Override
	public void add(Egress egress) {
		super.getHibernateTemplate().save(egress);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Egress load(int id) {
		return (Egress)getHibernateTemplate().load(Egress.class, id);
	}

	@Override
	public List<Egress> loadList(Egress egress) {
		if (egress!=null) {
			return getHibernateTemplate().findByExample(egress);
		}
		return getHibernateTemplate().loadAll(Egress.class);
	}	

	@Override
	public void update(Egress egress) {
		getHibernateTemplate().update(egress);

	}

}






