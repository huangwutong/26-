
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.EmailReceivceDao;
import com.accp.myoa.entity.EmailReceivce;

@SuppressWarnings("unchecked")
public class EmailReceivceDaoImpl extends BaseHibernateDao implements EmailReceivceDao {

	@Override
	public void add(EmailReceivce emailReceivce) {
		super.getHibernateTemplate().save(emailReceivce);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public EmailReceivce load(int id) {
		return (EmailReceivce)getHibernateTemplate().load(EmailReceivce.class, id);
	}

	@Override
	public List<EmailReceivce> loadList(EmailReceivce emailReceivce) {
		if (emailReceivce!=null) {
			return getHibernateTemplate().findByExample(emailReceivce);
		}
		return getHibernateTemplate().loadAll(EmailReceivce.class);
	}	

	@Override
	public void update(EmailReceivce emailReceivce) {
		getHibernateTemplate().update(emailReceivce);

	}

}






