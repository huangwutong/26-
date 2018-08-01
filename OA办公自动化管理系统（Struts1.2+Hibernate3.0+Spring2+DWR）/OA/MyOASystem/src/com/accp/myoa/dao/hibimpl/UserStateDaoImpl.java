
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.UserStateDao;
import com.accp.myoa.entity.UserState;

@SuppressWarnings("unchecked")
public class UserStateDaoImpl extends BaseHibernateDao implements UserStateDao {

	@Override
	public void add(UserState userState) {
		super.getHibernateTemplate().save(userState);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public UserState load(int id) {
		return (UserState)getHibernateTemplate().load(UserState.class, id);
	}

	@Override
	public List<UserState> loadList(UserState userState) {
		if (userState!=null) {
			return getHibernateTemplate().findByExample(userState);
		}
		return getHibernateTemplate().loadAll(UserState.class);
	}	

	@Override
	public void update(UserState userState) {
		getHibernateTemplate().update(userState);

	}

}






