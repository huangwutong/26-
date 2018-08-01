package com.accp.myoa.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.accp.myoa.dao.DeptPositionDao;
import com.accp.myoa.dao.PositionDao;
import com.accp.myoa.entity.DeptPosition;
import com.accp.myoa.entity.Position;
import com.accp.myoa.service.PositionService;

public class PositionServiceImpl implements PositionService {
	private PositionDao positionDao;
	private DeptPositionDao deptPositionDao;

	public void setPositionDao(PositionDao positionDao) {
		this.positionDao = positionDao;
	}

	public void add(Position position) {
		positionDao.add(position);

	}

	public void del(int id) {
		positionDao.del(id);

	}

	public Position load(int id) {
		return positionDao.load(id);
	}

	public List<Position> loadList(Position position) {
		return positionDao.loadList(position);
	}

	public void update(Position position) {
		positionDao.update(position);

	}

	@Override
	public List<Position> loadPositions(int deptId) {
		List<Position> positions = new ArrayList<Position>();
		List<DeptPosition> deptPositions = deptPositionDao.loadList(deptId);
		for (int i = 0; i < deptPositions.size(); i++) {

			positions.add(deptPositions.get(i).getPosition());

		}
		return positions;
	}

	public void setDeptPositionDao(DeptPositionDao deptPositionDao) {
		this.deptPositionDao = deptPositionDao;
	}
	
	//查看职位信息 LEO
	public List<Position> findAllPosition(){
		return positionDao.loadAll();
	}
	//添加职位信息 LEO
	public void insertPosition(Position position) {
		positionDao.add(position);

	}
}
