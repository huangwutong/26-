package com.ssh.im2010.service;

import java.util.List;

import com.ssh.im2010.model.Vip;

public interface VipService {

	public void add(Vip vip);
	public void delete(String id);
	public Vip loadById(String id);
    public void update(Vip vip, String id);
    public List<Vip> loadAllVip();
    public List<Vip> loadByName(String name);
	
}
