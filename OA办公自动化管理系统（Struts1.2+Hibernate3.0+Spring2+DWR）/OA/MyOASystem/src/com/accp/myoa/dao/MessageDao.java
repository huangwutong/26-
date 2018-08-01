

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Message;

public interface MessageDao {
	public void add(Message message);
	public void del(int id);
	public void update(Message message);
	public Message load(int id);
	public List<Message> loadList(Message message);
}



