
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.MessageReceiveDao;
import com.accp.myoa.entity.MessageReceive;
import com.accp.myoa.service.MessageReceiveService;

public class MessageReceiveServiceImpl implements MessageReceiveService {
	private MessageReceiveDao messageReceiveDao;
	
	
	
	public void setMessageReceiveDao(MessageReceiveDao messageReceiveDao) {
		this.messageReceiveDao = messageReceiveDao;
	}

	public void add(MessageReceive messageReceive) {
		messageReceiveDao.add(messageReceive);

	}

	public void del(int id) {
		messageReceiveDao.del(id);

	}

	public MessageReceive load(int id) {
		return messageReceiveDao.load(id);
	}

	public List<MessageReceive> loadList(MessageReceive messageReceive) {
		return messageReceiveDao.loadList(messageReceive);
	}

	public void update(MessageReceive messageReceive) {
		messageReceiveDao.update(messageReceive);

	}

}

