
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.MessageDao;
import com.accp.myoa.entity.Message;

@SuppressWarnings("unchecked")
public class MessageDaoImpl extends BaseHibernateDao implements MessageDao {

	@Override
	public void add(Message message) {
		super.getHibernateTemplate().save(message);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Message load(int id) {
		return (Message)getHibernateTemplate().load(Message.class, id);
	}

	@Override
	public List<Message> loadList(Message message) {
		if (message!=null) {
			return getHibernateTemplate().findByExample(message);
		}
		return getHibernateTemplate().loadAll(Message.class);
	}	

	@Override
	public void update(Message message) {
		getHibernateTemplate().update(message);

	}

}






