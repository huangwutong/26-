
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.EgressExamineDao;
import com.accp.myoa.entity.EgressExamine;

@SuppressWarnings("unchecked")
public class EgressExamineDaoImpl extends BaseHibernateDao implements EgressExamineDao {

	@Override
	public void add(EgressExamine egressExamine) {
		super.getHibernateTemplate().save(egressExamine);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public EgressExamine load(int id) {
		return (EgressExamine)getHibernateTemplate().load(EgressExamine.class, id);
	}

	@Override
	public List<EgressExamine> loadList(EgressExamine egressExamine) {
		if (egressExamine!=null) {
			return getHibernateTemplate().findByExample(egressExamine);
		}
		return getHibernateTemplate().loadAll(EgressExamine.class);
	}	

	@Override
	public void update(EgressExamine egressExamine) {
		getHibernateTemplate().update(egressExamine);

	}

}






