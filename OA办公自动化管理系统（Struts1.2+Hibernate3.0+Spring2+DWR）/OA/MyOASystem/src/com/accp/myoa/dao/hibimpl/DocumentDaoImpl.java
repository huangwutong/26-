
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.DocumentDao;
import com.accp.myoa.entity.Document;

@SuppressWarnings("unchecked")
public class DocumentDaoImpl extends BaseHibernateDao implements DocumentDao {

	@Override
	public void add(Document document) {
		super.getHibernateTemplate().save(document);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Document load(int id) {
		return (Document)getHibernateTemplate().load(Document.class, id);
	}

	@Override
	public List<Document> loadList(Document document) {
		if (document!=null) {
			return getHibernateTemplate().findByExample(document);
		}
		return getHibernateTemplate().loadAll(Document.class);
	}	

	@Override
	public void update(Document document) {
		getHibernateTemplate().update(document);

	}

}






