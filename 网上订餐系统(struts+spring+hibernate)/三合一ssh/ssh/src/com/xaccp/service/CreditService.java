package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.CreditDAO;
import com.xaccp.po.Credit;

public class CreditService {

	private CreditDAO creditDao;

	public CreditDAO getCreditDao() {
		return creditDao;
	}
	public void setCreditDao(CreditDAO creditDao) {
		this.creditDao = creditDao;
	}
	
	/**
	 * 查询所有积分
	 * @return
	 */
	public List findAllCredit(){
		return creditDao.findAllCredit();
	}
	
	/**
	 * 查询我的积分
	 * @param uid
	 * @return
	 */
	public List findMyCredit(int uid){
		return creditDao.findMyCedit(uid);
	}
	
	/**
	 * 添加积分
	 * @param credit
	 */
	public void saveCredit(Credit credit){
		if(credit!=null){
			creditDao.save(credit);
		}
	}
	
	/**
	 * 修改积分
	 * @param credit
	 */
	public void updateCredit(Credit credit){
		creditDao.merge(credit);
	}
}