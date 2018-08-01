package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.UserInfoDAO;
import com.xaccp.po.UserInfo;

public class UserInfoService {

	private UserInfoDAO userInfoDao;

	public UserInfoDAO getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDAO userInfoDao) {
		this.userInfoDao = userInfoDao;
	}
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List findAllUser(){
		return userInfoDao.findAllUser();
	}
	
	/**
	 * 按用户的用户名进行查询
	 * @param username
	 * @return
	 */
	public List findUserByUserName(String username){
		return userInfoDao.findByUName(username);
	}
	
	/**
	 * 按id查询用户
	 * @param uid
	 * @return
	 */
	public UserInfo findUserById(int uid){
		return userInfoDao.findById(uid);
	}
	
	/**
	 * 按用户名和密码查询用户
	 * @param ui
	 * @return
	 */
	public UserInfo findUserByNameAndPass(UserInfo ui){
		List list = userInfoDao.findUserByNameAndPass(ui);
		if(list.size()!=0){
			return (UserInfo) list.get(0);
		}
		return null;
	}
	
	/**
	 * 添加用户
	 * @param ui
	 */
	public void addUser(UserInfo ui){
		if(ui!=null){
			userInfoDao.save(ui);
		}
	}
	
	/**
	 * 修改用户
	 * @param ui
	 */
	public void updateUser(UserInfo ui){
		userInfoDao.merge(ui);
	}
	
	/**
	 * 按删除用户
	 * @param uid
	 */
	public void deleteUser(int uid){
		UserInfo ui=userInfoDao.findById(uid);
		userInfoDao.delete(ui);
	}
	
	/**
	 * 删除用户
	 * @param uids
	 */
	public void bukrDeleteUser(int ...uids){
		for (int i = 0; i < uids.length; i++) {
			UserInfo ui=userInfoDao.findById(uids[i]);
			userInfoDao.delete(ui);
		}
	}
}