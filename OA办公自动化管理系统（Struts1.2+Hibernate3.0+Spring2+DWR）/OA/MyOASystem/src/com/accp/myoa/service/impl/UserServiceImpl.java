
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.UserDao;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao userDao;
	
	
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void add(User user) {
		userDao.add(user);

	}

	public void del(int id) {
		userDao.del(id);

	}

	public User load(int id) {
		return userDao.load(id);
	}

	public List<User> loadList(User user) {
		return userDao.loadList(user);
	}

	public void update(User user) {
		userDao.update(user);

	}

	//新加的内容
	
	@Override
	public User getByNameAndPwd(User user) {
		return userDao.getByNameAndPwd(user);
	}

	@Override
	public boolean modifyPwd(User user) {
		return userDao.modifyPwd(user);
	}

	@Override
	public User get(int id) {
		return userDao.get(id);
	}

	@Override
	public boolean checkUserName(String loginName) {
		User user = new User();
		user.setLoginName(loginName);
		User validateUser=userDao.getByNameAndPwd(user);
		if(validateUser==null){
			return true;
		}
		
		return false;
	}

}

