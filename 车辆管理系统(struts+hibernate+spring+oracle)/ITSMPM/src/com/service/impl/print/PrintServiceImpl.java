package com.service.impl.print;

import java.util.List;

import com.dao.CarbstbDAO;
import com.service.intface.print.PrintServices;

public class PrintServiceImpl implements PrintServices {

	private CarbstbDAO carbstbDAO;
	
	public List seCarnmAll() {
		// TODO Auto-generated method stub
		return carbstbDAO.findAll();
	}
	public CarbstbDAO getCarbstbDAO() {
		return carbstbDAO;
	}
	public void setCarbstbDAO(CarbstbDAO carbstbDAO) {
		this.carbstbDAO = carbstbDAO;
	}
	public List PrintCarnum(Long id,String tab) {
		return carbstbDAO.findAllByCarnm(id, tab);
	}

	
}
