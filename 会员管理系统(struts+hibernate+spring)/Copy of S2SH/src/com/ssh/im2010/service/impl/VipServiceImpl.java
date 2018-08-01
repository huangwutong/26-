package com.ssh.im2010.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ssh.im2010.dao.VipDao;
import com.ssh.im2010.model.Vip;
import com.ssh.im2010.service.VipService;

@Component("vipService")
public class VipServiceImpl implements VipService {

	private VipDao vipDao;

	public VipDao getVipDao() {
		return vipDao;
	}

	@Resource
	public void setVipDao(VipDao vipDao) {
		this.vipDao = vipDao;
	}

	public void add(Vip vip) {
		vipDao.add(vip);
	}

	public void delete(String id) {
		vipDao.delete(id);
	}

	public List<Vip> loadAllVip() {
		return vipDao.loadAllVip();
	}

	public Vip loadById(String id) {
		return vipDao.loadById(id);
	}

	public List<Vip> loadByName(String name) {
		return vipDao.loadByName(name);
	}

	public void update(Vip vip, String id) {
		vipDao.update(vip, id);
	}

}
