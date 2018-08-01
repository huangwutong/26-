

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.ClientCompany;

public interface ClientCompanyDao {
	public void add(ClientCompany clientCompany);
	public void del(int id);
	public void update(ClientCompany clientCompany);
	public ClientCompany load(int id);
	public List<ClientCompany> loadList(ClientCompany clientCompany);
}



