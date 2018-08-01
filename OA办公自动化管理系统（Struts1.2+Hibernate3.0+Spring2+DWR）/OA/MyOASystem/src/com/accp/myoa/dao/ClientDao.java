

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Client;

public interface ClientDao {
	public void add(Client client);
	public void del(int id);
	public void update(Client client);
	public Client load(int id);
	public List<Client> loadList(Client client);
}



