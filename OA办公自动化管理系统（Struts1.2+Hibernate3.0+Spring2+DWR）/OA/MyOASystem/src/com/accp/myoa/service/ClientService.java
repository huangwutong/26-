
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.Client;

public interface ClientService {
	public void add(Client client);
	public void del(int id);
	public void update(Client client);
	public Client load(int id);
	public List<Client> loadList(Client client);
}



