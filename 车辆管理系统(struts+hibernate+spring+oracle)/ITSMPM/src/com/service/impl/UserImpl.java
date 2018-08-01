package com.service.impl;

import com.dao.XxuserDAO;
import com.java.Xxuser;
import com.service.intface.Test;

public class UserImpl extends TestImpl{

	private XxuserDAO xxuserDAO;
	@Override
	public void saveObject(Object ob) {
		// TODO Auto-generated method stub
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		xxuserDAO.save((Xxuser)ob);
	}
	public XxuserDAO getXxuserDAO() {
		return xxuserDAO;
	}
	public void setXxuserDAO(XxuserDAO xxuserDAO) {
		this.xxuserDAO = xxuserDAO;
	}

}
