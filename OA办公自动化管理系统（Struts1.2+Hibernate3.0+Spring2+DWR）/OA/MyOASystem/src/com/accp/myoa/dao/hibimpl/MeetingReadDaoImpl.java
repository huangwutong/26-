
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.MeetingReadDao;
import com.accp.myoa.entity.MeetingRead;

@SuppressWarnings("unchecked")
public class MeetingReadDaoImpl extends BaseHibernateDao implements MeetingReadDao {

	@Override
	public void add(MeetingRead meetingRead) {
		super.getHibernateTemplate().save(meetingRead);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public MeetingRead load(int id) {
		return (MeetingRead)getHibernateTemplate().load(MeetingRead.class, id);
	}

	@Override
	public List<MeetingRead> loadList(MeetingRead meetingRead) {
		if (meetingRead!=null) {
			return getHibernateTemplate().findByExample(meetingRead);
		}
		return getHibernateTemplate().loadAll(MeetingRead.class);
	}	

	@Override
	public void update(MeetingRead meetingRead) {
		getHibernateTemplate().update(meetingRead);

	}

}






