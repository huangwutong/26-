
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.Message;

public interface MessageService {
	public void add(Message message);
	public void del(int id);
	public void update(Message message);
	public Message load(int id);
	public List<Message> loadList(Message message);
}



