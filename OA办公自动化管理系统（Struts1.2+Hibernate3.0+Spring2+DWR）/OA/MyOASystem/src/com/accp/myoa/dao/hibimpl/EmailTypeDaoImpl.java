
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.EmailTypeDao;
import com.accp.myoa.entity.EmailType;

@SuppressWarnings("unchecked")
public class EmailTypeDaoImpl extends BaseHibernateDao implements EmailTypeDao {

	@Override
	public void add(EmailType emailType) {
		super.getHibernateTemplate().save(emailType);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public EmailType load(int id) {
		return (EmailType)getHibernateTemplate().load(EmailType.class, id);
	}

	@Override
	public List<EmailType> loadList(EmailType emailType) {
		if (emailType!=null) {
			return getHibernateTemplate().findByExample(emailType);
		}
		return getHibernateTemplate().loadAll(EmailType.class);
	}	

	@Override
	public void update(EmailType emailType) {
		getHibernateTemplate().update(emailType);

	}

}






