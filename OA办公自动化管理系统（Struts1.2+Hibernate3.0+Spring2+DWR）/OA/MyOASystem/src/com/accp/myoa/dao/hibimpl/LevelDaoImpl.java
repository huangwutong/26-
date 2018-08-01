
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.LevelDao;
import com.accp.myoa.entity.Level;

@SuppressWarnings("unchecked")
public class LevelDaoImpl extends BaseHibernateDao implements LevelDao {

	@Override
	public void add(Level level) {
		super.getHibernateTemplate().save(level);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Level load(int id) {
		return (Level)getHibernateTemplate().load(Level.class, id);
	}

	@Override
	public List<Level> loadList(Level level) {
		if (level!=null) {
			return getHibernateTemplate().findByExample(level);
		}
		return getHibernateTemplate().loadAll(Level.class);
	}	

	@Override
	public void update(Level level) {
		getHibernateTemplate().update(level);

	}

}






