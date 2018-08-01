
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.ClientDao;
import com.accp.myoa.entity.Client;

@SuppressWarnings("unchecked")
public class ClientDaoImpl extends BaseHibernateDao implements ClientDao {

	@Override
	public void add(Client client) {
		super.getHibernateTemplate().save(client);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Client load(int id) {
		return (Client)getHibernateTemplate().load(Client.class, id);
	}

	@Override
	public List<Client> loadList(Client client) {
		if (client!=null) {
			return getHibernateTemplate().findByExample(client);
		}
		return getHibernateTemplate().loadAll(Client.class);
	}	

	@Override
	public void update(Client client) {
		getHibernateTemplate().update(client);

	}

}






