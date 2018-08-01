
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.Egress;

public interface EgressService {
	public void add(Egress egress);
	public void del(int id);
	public void update(Egress egress);
	public Egress load(int id);
	public List<Egress> loadList(Egress egress);
}



