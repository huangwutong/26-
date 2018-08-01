
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.ClientCompanyDao;
import com.accp.myoa.entity.ClientCompany;
import com.accp.myoa.service.ClientCompanyService;

public class ClientCompanyServiceImpl implements ClientCompanyService {
	private ClientCompanyDao clientCompanyDao;
	
	
	
	public void setClientCompanyDao(ClientCompanyDao clientCompanyDao) {
		this.clientCompanyDao = clientCompanyDao;
	}

	public void add(ClientCompany clientCompany) {
		clientCompanyDao.add(clientCompany);

	}

	public void del(int id) {
		clientCompanyDao.del(id);

	}

	public ClientCompany load(int id) {
		return clientCompanyDao.load(id);
	}

	public List<ClientCompany> loadList(ClientCompany clientCompany) {
		return clientCompanyDao.loadList(clientCompany);
	}

	public void update(ClientCompany clientCompany) {
		clientCompanyDao.update(clientCompany);

	}

}

