package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.LeaveWordDao;
import com.accp.myoa.dao.UserDao;
import com.accp.myoa.entity.LeaveWord;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.LeaveWordService;

public class LeaveWordServiceImpl implements LeaveWordService {
	private LeaveWordDao leaveWordDao;
	private UserDao userDao;

	public void setLeaveWordDao(LeaveWordDao leaveWordDao) {
		this.leaveWordDao = leaveWordDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void add(LeaveWord leaveWord) {
		//int userId = leaveWord.getUser().getUserId();
        //User user = userDao.load(userId);
        //leaveWord.setUser(user);
		leaveWordDao.add(leaveWord);

	}

	public void del(int id) {
		leaveWordDao.del(id);

	}

	public LeaveWord load(int id) {
		return leaveWordDao.load(id);
	}

	public List<LeaveWord> loadList(LeaveWord leaveWord) {
		
		return leaveWordDao.loadList(leaveWord);
	}

	public void update(LeaveWord leaveWord) {
		leaveWordDao.update(leaveWord);

	}

	@Override
	public List<LeaveWord> getLeaveWordsByUserId(int userId) {
		// TODO Auto-generated method stub
		return leaveWordDao.getLeaveWordsByUserId(userId);
	}

}
