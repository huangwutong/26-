
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.PositionPopedomDao;
import com.accp.myoa.entity.PositionPopedom;
import com.accp.myoa.service.PositionPopedomService;

public class PositionPopedomServiceImpl implements PositionPopedomService {
	private PositionPopedomDao positionPopedomDao;
	
	//LEO
	private int pageSize;
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public void setPositionPopedomDao(PositionPopedomDao positionPopedomDao) {
		this.positionPopedomDao = positionPopedomDao;
	}

	public void add(PositionPopedom positionPopedom) {
		positionPopedomDao.add(positionPopedom);

	}

	public void del(int id) {
		positionPopedomDao.del(id);

	}

	public PositionPopedom load(int id) {
		return positionPopedomDao.load(id);
	}

	public List<PositionPopedom> loadList(PositionPopedom positionPopedom) {
		return positionPopedomDao.loadList(positionPopedom);
	}

	public void update(PositionPopedom positionPopedom) {
		positionPopedomDao.update(positionPopedom);

	}
	
	//查看权限信息 LEO
	public List<PositionPopedom> findPositionPopedomByPage(int page){
		int firstResult = 0;
		if (page > 1) {
			firstResult = pageSize * (page - 1);
		}
		return positionPopedomDao.findByPage(firstResult, pageSize);
	}
	
	public int getPositionPopedomMaxPage(){
		int maxPage = 0;
		int count = positionPopedomDao.getCount();
		if (count % pageSize == 0) {
			maxPage = count / pageSize;
		} else {
			maxPage = count / pageSize + 1;
		}
		//System.out.println(maxPage);
		return maxPage;
	}
	
	public PositionPopedom getPositionPopedom(int id){
		return positionPopedomDao.get(id);
	}
	
	public List<PositionPopedom> loadAll(){
		return positionPopedomDao.loadAll();
	}
	
	public void insertPositionPopedom(PositionPopedom positionPopedom){
		positionPopedomDao.add(positionPopedom);
	}
}

