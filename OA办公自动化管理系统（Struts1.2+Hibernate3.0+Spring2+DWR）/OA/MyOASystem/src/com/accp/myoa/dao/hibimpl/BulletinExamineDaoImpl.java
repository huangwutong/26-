
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.BulletinExamineDao;
import com.accp.myoa.entity.BulletinExamine;

@SuppressWarnings("unchecked")
public class BulletinExamineDaoImpl extends BaseHibernateDao implements BulletinExamineDao {

	@Override
	public void add(BulletinExamine bulletinExamine) {
		super.getHibernateTemplate().save(bulletinExamine);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public BulletinExamine load(int id) {
		return (BulletinExamine)getHibernateTemplate().load(BulletinExamine.class, id);
	}

	@Override
	public List<BulletinExamine> loadList(BulletinExamine bulletinExamine) {
		if (bulletinExamine!=null) {
			return getHibernateTemplate().findByExample(bulletinExamine);
		}
		return getHibernateTemplate().loadAll(BulletinExamine.class);
	}	

	@Override
	public void update(BulletinExamine bulletinExamine) {
		getHibernateTemplate().update(bulletinExamine);

	}

}






