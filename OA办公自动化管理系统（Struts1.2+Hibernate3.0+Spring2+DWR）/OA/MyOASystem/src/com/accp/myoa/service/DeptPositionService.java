
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.DeptPosition;

public interface DeptPositionService {
	public void add(DeptPosition deptPosition);
	public void del(int id);
	public void update(DeptPosition deptPosition);
	public DeptPosition load(int id);
	public List<DeptPosition> loadList(DeptPosition deptPosition);
	public DeptPosition getDeptPosition(int deptId, int positionId);
	
	//添加部门职位（角色）信息 LEO
	public List<DeptPosition> findAllDeptPosition();
	public void insertDeptPosition(DeptPosition deptPosition);
	public List<DeptPosition> findDeptPositionByPage(int page);
	public int getDeptPositionMaxPage();
	public DeptPosition getDeptPosition(int id);
}



