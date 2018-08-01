
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.BulletinReadDao;
import com.accp.myoa.entity.BulletinRead;

@SuppressWarnings("unchecked")
public class BulletinReadDaoImpl extends BaseHibernateDao implements BulletinReadDao {

	@Override
	public void add(BulletinRead bulletinRead) {
		super.getHibernateTemplate().save(bulletinRead);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public BulletinRead load(int id) {
		return (BulletinRead)getHibernateTemplate().load(BulletinRead.class, id);
	}

	@Override
	public List<BulletinRead> loadList(BulletinRead bulletinRead) {
		if (bulletinRead!=null) {
			return getHibernateTemplate().findByExample(bulletinRead);
		}
		return getHibernateTemplate().loadAll(BulletinRead.class);
	}	

	@Override
	public void update(BulletinRead bulletinRead) {
		getHibernateTemplate().update(bulletinRead);

	}

}






