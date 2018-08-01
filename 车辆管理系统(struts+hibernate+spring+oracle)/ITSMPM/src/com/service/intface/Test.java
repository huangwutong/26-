package com.service.intface;

import java.util.List;

import com.java.Outcm;

public interface Test {

	public void saveObject(Object ob);
	public void deleObject(Object ob);
	public void updateObject(Object ob);
	public List findAll(String tab);
	public List findObjectById(String tab,String pri,Long id);
	 
	
}
