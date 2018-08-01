
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.EgressExamine;

public interface EgressExamineService {
	public void add(EgressExamine egressExamine);
	public void del(int id);
	public void update(EgressExamine egressExamine);
	public EgressExamine load(int id);
	public List<EgressExamine> loadList(EgressExamine egressExamine);
}



