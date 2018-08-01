
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.ExamineStateDao;
import com.accp.myoa.entity.ExamineState;

@SuppressWarnings("unchecked")
public class ExamineStateDaoImpl extends BaseHibernateDao implements ExamineStateDao {

	@Override
	public void add(ExamineState examineState) {
		super.getHibernateTemplate().save(examineState);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public ExamineState load(int id) {
		return (ExamineState)getHibernateTemplate().load(ExamineState.class, id);
	}

	@Override
	public List<ExamineState> loadList(ExamineState examineState) {
		if (examineState!=null) {
			return getHibernateTemplate().findByExample(examineState);
		}
		return getHibernateTemplate().loadAll(ExamineState.class);
	}	

	@Override
	public void update(ExamineState examineState) {
		getHibernateTemplate().update(examineState);

	}

}






