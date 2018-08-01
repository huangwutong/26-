

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.MessageReceive;

public interface MessageReceiveDao {
	public void add(MessageReceive messageReceive);
	public void del(int id);
	public void update(MessageReceive messageReceive);
	public MessageReceive load(int id);
	public List<MessageReceive> loadList(MessageReceive messageReceive);
}



