
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.ComleteDegress;

public interface ComleteDegressService {
	public void add(ComleteDegress comleteDegress);
	public void del(int id);
	public void update(ComleteDegress comleteDegress);
	public ComleteDegress load(int id);
	public List<ComleteDegress> loadList(ComleteDegress comleteDegress);
}



