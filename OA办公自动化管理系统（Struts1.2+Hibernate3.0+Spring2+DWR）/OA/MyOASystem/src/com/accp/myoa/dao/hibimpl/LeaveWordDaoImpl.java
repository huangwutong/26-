
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.LeaveWordDao;
import com.accp.myoa.entity.LeaveWord;

@SuppressWarnings("unchecked")
public class LeaveWordDaoImpl extends BaseHibernateDao implements LeaveWordDao {

	@Override
	public void add(LeaveWord leaveWord) {
		super.getHibernateTemplate().save(leaveWord);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public LeaveWord load(int id) {
		return (LeaveWord)getHibernateTemplate().load(LeaveWord.class, id);
	}

	@Override
	public List<LeaveWord> loadList(LeaveWord leaveWord) {
		
		if (leaveWord!=null) {
			System.out.println(leaveWord.getUser().getUserId());
			return getHibernateTemplate().findByExample(leaveWord);
		}
		return getHibernateTemplate().loadAll(LeaveWord.class);
	}	

	@Override
	public void update(LeaveWord leaveWord) {
		getHibernateTemplate().update(leaveWord);

	}

	@Override
	public List<LeaveWord> getLeaveWordsByUserId(int userId) {
		System.out.print(userId);
		String hql="from LeaveWord l where l.user.userId=?";
		
		return getHibernateTemplate().find(hql, userId);
	}


}






