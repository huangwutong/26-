package com.xaccp.service;

import java.util.List;
import com.xaccp.po.ManageInfo;
import com.xaccp.dao.ManageInfoDAO;
//管理信息
public class ManageInfoService {

	private ManageInfoDAO managerInfoDao;

	public ManageInfoDAO getManagerInfoDao() {
		return managerInfoDao;
	}

	public void setManagerInfoDao(ManageInfoDAO managerInfoDao) {
		this.managerInfoDao = managerInfoDao;
	}
	
	/**
	 * 查询所有管理员
	 * @return
	 */
	public List findAllManager(){
		return managerInfoDao.findAllManager();
	}
	
	/**
	 * 按用户名和密码查询管理员
	 * @param mi
	 * @return
	 */
	public ManageInfo findManagerByNameAndPass(ManageInfo mi){
		List list = managerInfoDao.FindManagerByNameAndPass(mi);
		if(list.size()>0){
			return (ManageInfo)list.get(0);
		}
		return null;
	}
	
	/**
	 * 添加管理员
	 * @param mi
	 */
	public void addManager(ManageInfo mi){
		managerInfoDao.save(mi);
	}
	
	/**
	 * 按id查询管理员
	 * @param id
	 * @return
	 */
	public ManageInfo findManagerById(int id){
		return managerInfoDao.findById(id);
	}
	
	/**
	 * 删除管理员
	 * @param id
	 */
	public void deleteManaget(int id){
		ManageInfo mi=managerInfoDao.findById(id);
		managerInfoDao.delete(mi);
	}
	
	/**
	 * 修改管理员
	 * @param mi
	 */
	public void updateManager(ManageInfo mi){
		managerInfoDao.merge(mi);
	}
	
	/**
	 * 任意删除管理员
	 * @param mids
	 */
	public void bulkDeleteManager(int ...mids){
		for (int i = 0; i < mids.length; i++) {
			ManageInfo mi=managerInfoDao.findById(mids[i]);
			managerInfoDao.delete(mi);
		}
	}
}