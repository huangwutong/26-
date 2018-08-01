
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.MessageReceive;

public interface MessageReceiveService {
	public void add(MessageReceive messageReceive);
	public void del(int id);
	public void update(MessageReceive messageReceive);
	public MessageReceive load(int id);
	public List<MessageReceive> loadList(MessageReceive messageReceive);
}



