
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.MeetingstateDao;
import com.accp.myoa.entity.Meetingstate;

@SuppressWarnings("unchecked")
public class MeetingstateDaoImpl extends BaseHibernateDao implements MeetingstateDao {

	@Override
	public void add(Meetingstate meetingstate) {
		super.getHibernateTemplate().save(meetingstate);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Meetingstate load(int id) {
		return (Meetingstate)getHibernateTemplate().load(Meetingstate.class, id);
	}

	@Override
	public List<Meetingstate> loadList(Meetingstate meetingstate) {
		if (meetingstate!=null) {
			return getHibernateTemplate().findByExample(meetingstate);
		}
		return getHibernateTemplate().loadAll(Meetingstate.class);
	}	

	@Override
	public void update(Meetingstate meetingstate) {
		getHibernateTemplate().update(meetingstate);

	}

}






