
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.ClientDao;
import com.accp.myoa.entity.Client;
import com.accp.myoa.service.ClientService;

public class ClientServiceImpl implements ClientService {
	private ClientDao clientDao;
	
	
	
	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}

	public void add(Client client) {
		clientDao.add(client);

	}

	public void del(int id) {
		clientDao.del(id);

	}

	public Client load(int id) {
		return clientDao.load(id);
	}

	public List<Client> loadList(Client client) {
		return clientDao.loadList(client);
	}

	public void update(Client client) {
		clientDao.update(client);

	}

}

