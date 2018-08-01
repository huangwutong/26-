
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.DocumentExamineDao;
import com.accp.myoa.entity.DocumentExamine;

@SuppressWarnings("unchecked")
public class DocumentExamineDaoImpl extends BaseHibernateDao implements DocumentExamineDao {

	@Override
	public void add(DocumentExamine documentExamine) {
		super.getHibernateTemplate().save(documentExamine);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public DocumentExamine load(int id) {
		return (DocumentExamine)getHibernateTemplate().load(DocumentExamine.class, id);
	}

	@Override
	public List<DocumentExamine> loadList(DocumentExamine documentExamine) {
		if (documentExamine!=null) {
			return getHibernateTemplate().findByExample(documentExamine);
		}
		return getHibernateTemplate().loadAll(DocumentExamine.class);
	}	

	@Override
	public void update(DocumentExamine documentExamine) {
		getHibernateTemplate().update(documentExamine);

	}

}






