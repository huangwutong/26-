
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.BulletinDao;
import com.accp.myoa.entity.Bulletin;

@SuppressWarnings("unchecked")
public class BulletinDaoImpl extends BaseHibernateDao implements BulletinDao {

	@Override
	public void add(Bulletin bulletin) {
		super.getHibernateTemplate().save(bulletin);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Bulletin load(int id) {
		return (Bulletin)getHibernateTemplate().load(Bulletin.class, id);
	}

	@Override
	public List<Bulletin> loadList(Bulletin bulletin) {
		if (bulletin!=null) {
			return getHibernateTemplate().findByExample(bulletin);
		}
		return getHibernateTemplate().loadAll(Bulletin.class);
	}	

	@Override
	public void update(Bulletin bulletin) {
		getHibernateTemplate().update(bulletin);

	}
	@Override
	public List<Bulletin> findByPage(int pageSize, int pageNum
			) {
		int firstResult=pageSize*(pageNum-1);
		String hql="from Bulletin";
		return super.findByPage(hql, firstResult, pageSize);
	}

	@Override
	public int getCount() {
		String hql="from Bulletin";
		return super.getCount(hql);
	}
}






