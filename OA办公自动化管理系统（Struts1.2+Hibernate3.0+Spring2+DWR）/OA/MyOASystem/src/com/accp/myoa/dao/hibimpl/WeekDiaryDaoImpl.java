
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.WeekDiaryDao;
import com.accp.myoa.entity.WeekDiary;

@SuppressWarnings("unchecked")
public class WeekDiaryDaoImpl extends BaseHibernateDao implements WeekDiaryDao {

	@Override
	public void add(WeekDiary weekDiary) {
		super.getHibernateTemplate().save(weekDiary);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public WeekDiary load(int id) {
		return (WeekDiary)getHibernateTemplate().load(WeekDiary.class, id);
	}

	@Override
	public List<WeekDiary> loadList(WeekDiary weekDiary) {
		if (weekDiary!=null) {
			return getHibernateTemplate().findByExample(weekDiary);
		}
		return getHibernateTemplate().loadAll(WeekDiary.class);
	}	

	@Override
	public void update(WeekDiary weekDiary) {
		getHibernateTemplate().update(weekDiary);

	}

}






