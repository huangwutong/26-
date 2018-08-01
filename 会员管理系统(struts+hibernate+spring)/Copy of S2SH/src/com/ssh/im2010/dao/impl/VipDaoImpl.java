package com.ssh.im2010.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.ssh.im2010.dao.VipDao;
import com.ssh.im2010.model.Vip;

//把普通的pojo实例化到herbinate内存中
@Component("vipDao")
public class VipDaoImpl implements VipDao {
	
	private HibernateTemplate hibernateTemplate;

	public void add(Vip vip) {
			hibernateTemplate.save(vip);
	}

	public void delete(String id) {
		hibernateTemplate.delete(loadById(id));
	}
	//在遇到警告时会给出提示，但是小的警告就被摒弃
	@SuppressWarnings("unchecked")
	public List<Vip> loadAllVip() {
		int end = hibernateTemplate.find("from Vip").size();
		if(end>11){
			end = 11;
		}
		return (List<Vip>)hibernateTemplate.find("from Vip").subList(0, end);
	}

	public Vip loadById(String id) {
		return (Vip)hibernateTemplate.find("from Vip v where v.id='"+id+"'").get(0);
	}

	@SuppressWarnings("unchecked")
	public List<Vip> loadByName(String name) {
		return (List<Vip>)hibernateTemplate.find("from Vip v where v.name like "+"%"+name+"%");
	}

	public void update(Vip vip, String id) {
		delete(id);
        add(vip);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public Boolean checkExistById(String id){
		if(hibernateTemplate.find("from Vip v where v.id='"+id+"'").size()==0){
			return false;
		}
		return true;
	}

}
