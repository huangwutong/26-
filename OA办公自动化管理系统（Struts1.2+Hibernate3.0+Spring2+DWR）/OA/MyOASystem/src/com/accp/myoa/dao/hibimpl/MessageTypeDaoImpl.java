
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.MessageTypeDao;
import com.accp.myoa.entity.MessageType;

@SuppressWarnings("unchecked")
public class MessageTypeDaoImpl extends BaseHibernateDao implements MessageTypeDao {

	@Override
	public void add(MessageType messageType) {
		super.getHibernateTemplate().save(messageType);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public MessageType load(int id) {
		return (MessageType)getHibernateTemplate().load(MessageType.class, id);
	}

	@Override
	public List<MessageType> loadList(MessageType messageType) {
		if (messageType!=null) {
			return getHibernateTemplate().findByExample(messageType);
		}
		return getHibernateTemplate().loadAll(MessageType.class);
	}	

	@Override
	public void update(MessageType messageType) {
		getHibernateTemplate().update(messageType);

	}

}






