
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.MeetingDao;
import com.accp.myoa.entity.Meeting;

@SuppressWarnings("unchecked")
public class MeetingDaoImpl extends BaseHibernateDao implements MeetingDao {

	@Override
	public int add(Meeting meeting) {
		return  (Integer)super.getHibernateTemplate().save(meeting);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Meeting load(int id) {
		return (Meeting)getHibernateTemplate().load(Meeting.class, id);
	}

	@Override
	public List<Meeting> loadList(Meeting meeting) {
		if (meeting!=null) {
			return getHibernateTemplate().findByExample(meeting);
		}
		return getHibernateTemplate().loadAll(Meeting.class);
	}	

	@Override
	public void update(Meeting meeting) {
		getHibernateTemplate().update(meeting);

	}
	@Override
	public boolean isExists(String beginTime, String endTime,int boardRoomId) {
		String hql="from Meeting where startTime between "+beginTime+
			" and "+endTime+" and endTime between "+beginTime+" and "+endTime+" and boardRoom.boardRoomId="+boardRoomId;
		return getHibernateTemplate().find(hql).size()!=0;
	}

	@Override
	public List<Meeting> findByPage(int pageNum, int pageSize) {
		int firstResult=pageSize*(pageNum-1);
		String hql="from Meeting";
		return super.findByPage(hql, firstResult, pageSize);
	}
	public int getCount() {
		String hql="from Meeting";
		return super.getCount(hql);
	}

}






