
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.MeetingReadDao;
import com.accp.myoa.entity.MeetingRead;
import com.accp.myoa.service.MeetingReadService;

public class MeetingReadServiceImpl implements MeetingReadService {
	private MeetingReadDao meetingReadDao;
	
	
	
	public void setMeetingReadDao(MeetingReadDao meetingReadDao) {
		this.meetingReadDao = meetingReadDao;
	}

	public void add(MeetingRead meetingRead) {
		meetingReadDao.add(meetingRead);

	}

	public void del(int id) {
		meetingReadDao.del(id);

	}

	public MeetingRead load(int id) {
		return meetingReadDao.load(id);
	}

	public List<MeetingRead> loadList(MeetingRead meetingRead) {
		return meetingReadDao.loadList(meetingRead);
	}

	public void update(MeetingRead meetingRead) {
		meetingReadDao.update(meetingRead);

	}

}

