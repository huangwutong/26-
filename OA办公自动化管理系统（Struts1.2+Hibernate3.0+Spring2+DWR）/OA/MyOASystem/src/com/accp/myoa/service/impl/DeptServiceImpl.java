
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.DeptDao;
import com.accp.myoa.entity.Dept;
import com.accp.myoa.service.DeptService;

public class DeptServiceImpl implements DeptService {
	private DeptDao deptDao;
	
	
	
	public void setDeptDao(DeptDao deptDao) {
		this.deptDao = deptDao;
	}

	public void add(Dept dept) {
		deptDao.add(dept);

	}

	public void del(int id) {
		deptDao.del(id);

	}

	public Dept load(int id) {
		return deptDao.load(id);
	}

	public List<Dept> loadList(Dept dept) {
		return deptDao.loadList(dept);
	}

	public void update(Dept dept) {
		deptDao.update(dept);

	}
	
	//查看部门信息 LEO
	public List<Dept> findAllDept(){
		return deptDao.loadAll();
	}
	public void insertDept(Dept dept) {
		deptDao.add(dept);

	}
}

