package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.EnterpriseInfoDAO;
import com.xaccp.po.EnterpriseInfo;
//企业管理模块
public class EnterpriseInfoService {

	private EnterpriseInfoDAO enterDao;

	public EnterpriseInfoDAO getEnterDao() {
		return enterDao;
	}

	public void setEnterDao(EnterpriseInfoDAO enterDao) {
		this.enterDao = enterDao;
	}
	
	/**
	 * 添加企业
	 * @param ei
	 */
	public void saveEnterprise(EnterpriseInfo ei){
		enterDao.save(ei);
	}
	
	/**
	 * 查询所有企业
	 * @return
	 */
	public List findAllEnterpise(){
		return enterDao.findAllEnterprise();
	}
	
	/**
	 * 按企业用户名进行查找
	 * @param EnterName
	 * @return
	 */
	public List findEnterpriseByName(String EnterName){
		return enterDao.findByEName(EnterName);
	}
	
	/**
	 * 按企业的用户名和密码进行查找
	 * @param ei
	 * @return
	 */
	public EnterpriseInfo findEnterpriseByNameAndPass(EnterpriseInfo ei){
		List list= enterDao.findEntepriseByNameAndPass(ei);
		if(list!=null){
			return (EnterpriseInfo) list.get(0);
		}
		return null;
	}
	
	/**
	 * 删除企业
	 * @param eids
	 */
	public void bulkDeleteEnterprise(int ...eids){
		for (int i = 0; i < eids.length; i++) {
			EnterpriseInfo ei=enterDao.findById(eids[i]);
			enterDao.delete(ei);
		}
	}
	
	/**
	 * 修改企业
	 * @param ei
	 */
	public void updateEnterprise(EnterpriseInfo ei){
		enterDao.merge(ei);
	}
}