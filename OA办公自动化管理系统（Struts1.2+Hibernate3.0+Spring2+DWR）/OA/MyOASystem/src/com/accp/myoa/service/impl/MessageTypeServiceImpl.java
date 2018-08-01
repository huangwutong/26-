
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.MessageTypeDao;
import com.accp.myoa.entity.MessageType;
import com.accp.myoa.service.MessageTypeService;

public class MessageTypeServiceImpl implements MessageTypeService {
	private MessageTypeDao messageTypeDao;
	
	
	
	public void setMessageTypeDao(MessageTypeDao messageTypeDao) {
		this.messageTypeDao = messageTypeDao;
	}

	public void add(MessageType messageType) {
		messageTypeDao.add(messageType);

	}

	public void del(int id) {
		messageTypeDao.del(id);

	}

	public MessageType load(int id) {
		return messageTypeDao.load(id);
	}

	public List<MessageType> loadList(MessageType messageType) {
		return messageTypeDao.loadList(messageType);
	}

	public void update(MessageType messageType) {
		messageTypeDao.update(messageType);

	}

}

