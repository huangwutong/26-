
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.Dept;

public interface DeptService {
	public void add(Dept dept);
	public void del(int id);
	public void update(Dept dept);
	public Dept load(int id);
	public List<Dept> loadList(Dept dept);
	
	//查看部门信息 LEO
	public List<Dept> findAllDept();
	public void insertDept(Dept dept);
}



