

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.DeptPosition;

public interface DeptPositionDao {
	public void add(DeptPosition deptPosition);
	public void del(int id);
	public void update(DeptPosition deptPosition);
	public DeptPosition load(int id);
	public List<DeptPosition> loadList(DeptPosition deptPosition);
	public List<DeptPosition> loadList(int deptId);
	public DeptPosition getDeptPosition(int deptId,int positionId);
	
	//查看部门职位（角色）信息 LEO
	public List<DeptPosition> loatAll();	
	public List<DeptPosition> findByPage(int firstResult, int pageSize);
	public int getCount();
	public DeptPosition get(int id);
}



