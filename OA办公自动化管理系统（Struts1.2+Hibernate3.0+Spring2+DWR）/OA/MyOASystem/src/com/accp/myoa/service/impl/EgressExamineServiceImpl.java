
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.EgressExamineDao;
import com.accp.myoa.entity.EgressExamine;
import com.accp.myoa.service.EgressExamineService;

public class EgressExamineServiceImpl implements EgressExamineService {
	private EgressExamineDao egressExamineDao;
	
	
	
	public void setEgressExamineDao(EgressExamineDao egressExamineDao) {
		this.egressExamineDao = egressExamineDao;
	}

	public void add(EgressExamine egressExamine) {
		egressExamineDao.add(egressExamine);

	}

	public void del(int id) {
		egressExamineDao.del(id);

	}

	public EgressExamine load(int id) {
		return egressExamineDao.load(id);
	}

	public List<EgressExamine> loadList(EgressExamine egressExamine) {
		return egressExamineDao.loadList(egressExamine);
	}

	public void update(EgressExamine egressExamine) {
		egressExamineDao.update(egressExamine);

	}

}

