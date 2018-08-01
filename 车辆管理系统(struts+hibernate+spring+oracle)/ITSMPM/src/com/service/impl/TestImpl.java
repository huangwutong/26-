package com.service.impl;

import java.util.List;

import com.dao.OutcmDAO;
import com.java.Outcm;
import com.service.intface.Test;
import com.service.utils.Constants;

public abstract class TestImpl implements Test {

	 
	public  void deleObject(Object ob) {}

	public List findAll(String tab) {
		// TODO Auto-generated method stub
		return null;
	}

	public List findObjectById(String tab, String pri, Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void saveObject(Object ob) {
		// TODO Auto-generated method stub
          System.out.println("zai zhe ne ");
	}

	public void updateObject(Object ob) {
		// TODO Auto-generated method stub

	}

}
