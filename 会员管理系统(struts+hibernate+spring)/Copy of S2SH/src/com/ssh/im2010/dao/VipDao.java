package com.ssh.im2010.dao;

import java.util.List;

import com.ssh.im2010.model.Vip;

public interface VipDao {
	
	public void add(Vip vip);
	public void delete(String id);
	//通过id号查询vip信息
	public Vip loadById(String id);
    public void update(Vip vip, String id);
    //查询所有的vip信息
    public List<Vip> loadAllVip();
    public List<Vip> loadByName(String name);//按name模糊搜索
}
