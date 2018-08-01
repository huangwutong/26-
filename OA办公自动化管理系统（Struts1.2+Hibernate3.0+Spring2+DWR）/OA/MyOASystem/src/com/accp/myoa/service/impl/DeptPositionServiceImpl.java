
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.DeptPositionDao;
import com.accp.myoa.entity.DeptPosition;
import com.accp.myoa.service.DeptPositionService;

public class DeptPositionServiceImpl implements DeptPositionService {
	private DeptPositionDao deptPositionDao;
	
	//LEO
	private int pageSize;
	
	public void setDeptPositionDao(DeptPositionDao deptPositionDao) {
		this.deptPositionDao = deptPositionDao;
	}

	public void add(DeptPosition deptPosition) {
		deptPositionDao.add(deptPosition);

	}

	public void del(int id) {
		deptPositionDao.del(id);

	}

	public DeptPosition load(int id) {
		return deptPositionDao.load(id);
	}

	public List<DeptPosition> loadList(DeptPosition deptPosition) {
		return deptPositionDao.loadList(deptPosition);
	}

	public void update(DeptPosition deptPosition) {
		deptPositionDao.update(deptPosition);

	}

	@Override
	public DeptPosition getDeptPosition(int deptId, int positionId) {
		// TODO Auto-generated method stub
		return deptPositionDao.getDeptPosition(deptId, positionId);
	}
	
	//查看部门职位（角色）信息 LEO
	public List<DeptPosition> findAllDeptPosition(){
		return deptPositionDao.loatAll();
	}
	//添加部门职位（角色）信息 LEO
	public void insertDeptPosition(DeptPosition deptPosition){
		deptPositionDao.add(deptPosition);
	}
	//
	public List<DeptPosition> findDeptPositionByPage(int page){
		int firstResult = 0;
		if (page > 1) {
			firstResult = pageSize * (page - 1);
		}
		return deptPositionDao.findByPage(firstResult, pageSize);
	}
	
	public int getDeptPositionMaxPage(){
		int maxPage = 0;
		int count = deptPositionDao.getCount();
		if (count % pageSize == 0) {
			maxPage = count / pageSize;
		} else {
			maxPage = count / pageSize + 1;
		}
		//System.out.println(maxPage);
		return maxPage;
	}
	
	public DeptPosition getDeptPosition(int id){
		return deptPositionDao.get(id);
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}

