
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.MeetingstateDao;
import com.accp.myoa.entity.Meetingstate;
import com.accp.myoa.service.MeetingstateService;

public class MeetingstateServiceImpl implements MeetingstateService {
	private MeetingstateDao meetingstateDao;
	
	
	
	public void setMeetingstateDao(MeetingstateDao meetingstateDao) {
		this.meetingstateDao = meetingstateDao;
	}

	public void add(Meetingstate meetingstate) {
		meetingstateDao.add(meetingstate);

	}

	public void del(int id) {
		meetingstateDao.del(id);

	}

	public Meetingstate load(int id) {
		return meetingstateDao.load(id);
	}

	public List<Meetingstate> loadList(Meetingstate meetingstate) {
		return meetingstateDao.loadList(meetingstate);
	}

	public void update(Meetingstate meetingstate) {
		meetingstateDao.update(meetingstate);

	}

}

