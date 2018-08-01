
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.MessageReceiveDao;
import com.accp.myoa.entity.MessageReceive;

@SuppressWarnings("unchecked")
public class MessageReceiveDaoImpl extends BaseHibernateDao implements MessageReceiveDao {

	@Override
	public void add(MessageReceive messageReceive) {
		super.getHibernateTemplate().save(messageReceive);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public MessageReceive load(int id) {
		return (MessageReceive)getHibernateTemplate().load(MessageReceive.class, id);
	}

	@Override
	public List<MessageReceive> loadList(MessageReceive messageReceive) {
		if (messageReceive!=null) {
			return getHibernateTemplate().findByExample(messageReceive);
		}
		return getHibernateTemplate().loadAll(MessageReceive.class);
	}	

	@Override
	public void update(MessageReceive messageReceive) {
		getHibernateTemplate().update(messageReceive);

	}

}






