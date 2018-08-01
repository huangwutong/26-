
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.EgressDao;
import com.accp.myoa.entity.Egress;
import com.accp.myoa.service.EgressService;

public class EgressServiceImpl implements EgressService {
	private EgressDao egressDao;
	
	
	
	public void setEgressDao(EgressDao egressDao) {
		this.egressDao = egressDao;
	}

	public void add(Egress egress) {
		egressDao.add(egress);

	}

	public void del(int id) {
		egressDao.del(id);

	}

	public Egress load(int id) {
		return egressDao.load(id);
	}

	public List<Egress> loadList(Egress egress) {
		return egressDao.loadList(egress);
	}

	public void update(Egress egress) {
		egressDao.update(egress);

	}

}

