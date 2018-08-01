
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.UserStateDao;
import com.accp.myoa.entity.UserState;
import com.accp.myoa.service.UserStateService;

public class UserStateServiceImpl implements UserStateService {
	private UserStateDao userStateDao;
	
	
	
	public void setUserStateDao(UserStateDao userStateDao) {
		this.userStateDao = userStateDao;
	}

	public void add(UserState userState) {
		userStateDao.add(userState);

	}

	public void del(int id) {
		userStateDao.del(id);

	}

	public UserState load(int id) {
		return userStateDao.load(id);
	}

	public List<UserState> loadList(UserState userState) {
		return userStateDao.loadList(userState);
	}

	public void update(UserState userState) {
		userStateDao.update(userState);

	}

}

