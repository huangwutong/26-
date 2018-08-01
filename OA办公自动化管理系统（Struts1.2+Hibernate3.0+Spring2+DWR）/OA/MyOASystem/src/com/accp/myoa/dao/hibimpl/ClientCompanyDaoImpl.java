
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.ClientCompanyDao;
import com.accp.myoa.entity.ClientCompany;

@SuppressWarnings("unchecked")
public class ClientCompanyDaoImpl extends BaseHibernateDao implements ClientCompanyDao {

	@Override
	public void add(ClientCompany clientCompany) {
		super.getHibernateTemplate().save(clientCompany);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public ClientCompany load(int id) {
		return (ClientCompany)getHibernateTemplate().load(ClientCompany.class, id);
	}

	@Override
	public List<ClientCompany> loadList(ClientCompany clientCompany) {
		if (clientCompany!=null) {
			return getHibernateTemplate().findByExample(clientCompany);
		}
		return getHibernateTemplate().loadAll(ClientCompany.class);
	}	

	@Override
	public void update(ClientCompany clientCompany) {
		getHibernateTemplate().update(clientCompany);

	}

}






