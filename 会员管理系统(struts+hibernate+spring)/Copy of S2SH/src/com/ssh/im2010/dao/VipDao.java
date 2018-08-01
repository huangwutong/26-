package com.ssh.im2010.dao;

import java.util.List;

import com.ssh.im2010.model.Vip;

public interface VipDao {
	
	public void add(Vip vip);
	public void delete(String id);
	//ͨ��id�Ų�ѯvip��Ϣ
	public Vip loadById(String id);
    public void update(Vip vip, String id);
    //��ѯ���е�vip��Ϣ
    public List<Vip> loadAllVip();
    public List<Vip> loadByName(String name);//��nameģ������
}
