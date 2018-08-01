
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.DiaryDao;
import com.accp.myoa.entity.Diary;

@SuppressWarnings("unchecked")
public class DiaryDaoImpl extends BaseHibernateDao implements DiaryDao {

	@Override
	public void add(Diary diary) {
		super.getHibernateTemplate().save(diary);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Diary load(int id) {
		return (Diary)getHibernateTemplate().load(Diary.class, id);
	}

	@Override
	public List<Diary> loadList(Diary diary) {
		if (diary!=null) {
			return getHibernateTemplate().findByExample(diary);
		}
		return getHibernateTemplate().loadAll(Diary.class);
	}	

	@Override
	public void update(Diary diary) {
		getHibernateTemplate().update(diary);

	}

}






