
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.MessageDao;
import com.accp.myoa.entity.Message;
import com.accp.myoa.service.MessageService;

public class MessageServiceImpl implements MessageService {
	private MessageDao messageDao;
	
	
	
	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	public void add(Message message) {
		messageDao.add(message);

	}

	public void del(int id) {
		messageDao.del(id);

	}

	public Message load(int id) {
		return messageDao.load(id);
	}

	public List<Message> loadList(Message message) {
		return messageDao.loadList(message);
	}

	public void update(Message message) {
		messageDao.update(message);

	}

}

