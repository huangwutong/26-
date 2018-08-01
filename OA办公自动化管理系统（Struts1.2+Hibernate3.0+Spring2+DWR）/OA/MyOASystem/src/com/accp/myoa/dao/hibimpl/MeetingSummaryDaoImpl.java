
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.MeetingSummaryDao;
import com.accp.myoa.entity.MeetingSummary;

@SuppressWarnings("unchecked")
public class MeetingSummaryDaoImpl extends BaseHibernateDao implements MeetingSummaryDao {

	@Override
	public void add(MeetingSummary meetingSummary) {
		super.getHibernateTemplate().save(meetingSummary);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public MeetingSummary load(int id) {
		return (MeetingSummary)getHibernateTemplate().load(MeetingSummary.class, id);
	}

	@Override
	public List<MeetingSummary> loadList(MeetingSummary meetingSummary) {
		if (meetingSummary!=null) {
			return getHibernateTemplate().findByExample(meetingSummary);
		}
		return getHibernateTemplate().loadAll(MeetingSummary.class);
	}	

	@Override
	public void update(MeetingSummary meetingSummary) {
		getHibernateTemplate().update(meetingSummary);

	}

}






