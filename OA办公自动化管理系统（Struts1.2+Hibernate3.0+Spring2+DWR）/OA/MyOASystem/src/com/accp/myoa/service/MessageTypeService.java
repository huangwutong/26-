
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.MessageType;

public interface MessageTypeService {
	public void add(MessageType messageType);
	public void del(int id);
	public void update(MessageType messageType);
	public MessageType load(int id);
	public List<MessageType> loadList(MessageType messageType);
}



