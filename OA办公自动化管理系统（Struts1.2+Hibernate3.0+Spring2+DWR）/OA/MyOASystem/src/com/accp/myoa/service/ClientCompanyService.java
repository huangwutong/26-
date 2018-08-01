
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.ClientCompany;

public interface ClientCompanyService {
	public void add(ClientCompany clientCompany);
	public void del(int id);
	public void update(ClientCompany clientCompany);
	public ClientCompany load(int id);
	public List<ClientCompany> loadList(ClientCompany clientCompany);
}



