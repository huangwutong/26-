
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.DocumentReadDao;
import com.accp.myoa.entity.DocumentRead;

@SuppressWarnings("unchecked")
public class DocumentReadDaoImpl extends BaseHibernateDao implements DocumentReadDao {

	@Override
	public void add(DocumentRead documentRead) {
		super.getHibernateTemplate().save(documentRead);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public DocumentRead load(int id) {
		return (DocumentRead)getHibernateTemplate().load(DocumentRead.class, id);
	}

	@Override
	public List<DocumentRead> loadList(DocumentRead documentRead) {
		if (documentRead!=null) {
			return getHibernateTemplate().findByExample(documentRead);
		}
		return getHibernateTemplate().loadAll(DocumentRead.class);
	}	

	@Override
	public void update(DocumentRead documentRead) {
		getHibernateTemplate().update(documentRead);

	}

}






