
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.PositionDao;
import com.accp.myoa.entity.Position;

@SuppressWarnings("unchecked")
public class PositionDaoImpl extends BaseHibernateDao implements PositionDao {

	@Override
	public void add(Position position) {
		super.getHibernateTemplate().save(position);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Position load(int id) {
		return (Position)getHibernateTemplate().load(Position.class, id);
	}

	@Override
	public List<Position> loadList(Position position) {
		if (position!=null) {
			return getHibernateTemplate().findByExample(position);
		}
		return getHibernateTemplate().loadAll(Position.class);
	}	

	@Override
	public void update(Position position) {
		getHibernateTemplate().update(position);

	}
	
	//查看职位信息 LEO
	public List<Position> loadAll(){
		return this.getHibernateTemplate().loadAll(Position.class);
	}
}






