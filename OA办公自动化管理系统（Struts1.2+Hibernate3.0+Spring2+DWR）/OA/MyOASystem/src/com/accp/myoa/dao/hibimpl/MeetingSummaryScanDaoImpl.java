
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.MeetingSummaryScanDao;
import com.accp.myoa.entity.MeetingSummaryScan;

@SuppressWarnings("unchecked")
public class MeetingSummaryScanDaoImpl extends BaseHibernateDao implements MeetingSummaryScanDao {

	@Override
	public void add(MeetingSummaryScan meetingSummaryScan) {
		super.getHibernateTemplate().save(meetingSummaryScan);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public MeetingSummaryScan load(int id) {
		return (MeetingSummaryScan)getHibernateTemplate().load(MeetingSummaryScan.class, id);
	}

	@Override
	public List<MeetingSummaryScan> loadList(MeetingSummaryScan meetingSummaryScan) {
		if (meetingSummaryScan!=null) {
			return getHibernateTemplate().findByExample(meetingSummaryScan);
		}
		return getHibernateTemplate().loadAll(MeetingSummaryScan.class);
	}	

	@Override
	public void update(MeetingSummaryScan meetingSummaryScan) {
		getHibernateTemplate().update(meetingSummaryScan);

	}

}






