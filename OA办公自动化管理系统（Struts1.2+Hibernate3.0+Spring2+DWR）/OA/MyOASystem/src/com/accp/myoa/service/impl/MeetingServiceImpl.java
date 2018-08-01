
package com.accp.myoa.service.impl;

import java.util.List;
import java.util.Set;

import com.accp.myoa.dao.MeetingDao;
import com.accp.myoa.dao.MeetingReadDao;
import com.accp.myoa.entity.Meeting;
import com.accp.myoa.entity.MeetingRead;
import com.accp.myoa.service.MeetingService;

public class MeetingServiceImpl implements MeetingService {
	private MeetingDao meetingDao;
	private MeetingReadDao meetingReadDao;
	
	
	public void setMeetingReadDao(MeetingReadDao meetingReadDao) {
		this.meetingReadDao = meetingReadDao;
	}

	public void setMeetingDao(MeetingDao meetingDao) {
		this.meetingDao = meetingDao;
	}

	public void add(Meeting meeting) {
		int mid=meetingDao.add(meeting);
		Set mrs=meeting.getMeetingReads();
		for (int i = 0; i < mrs.size(); i++) {
			MeetingRead mr=(MeetingRead)mrs.toArray()[i];
			Meeting m=new Meeting();
			m.setMeetingId(mid);
			mr.setMeeting(m);	
			meetingReadDao.add(mr);
		}	
	}

	public void del(int id) {
		meetingDao.del(id);

	}

	public Meeting load(int id) {
		return meetingDao.load(id);
	}

	public List<Meeting> loadList(Meeting meeting) {
		return meetingDao.loadList(meeting);
	}

	public void update(Meeting meeting) {
		meetingDao.update(meeting);

	}

	@Override
	public List<Meeting> findByPage(int pageNum, int pageSize) {
		return meetingDao.findByPage(pageNum, pageSize);
	}

	@Override
	public boolean isExists(String beginTime, String endTime, int boardRoomId) {
		return meetingDao.isExists(beginTime, endTime, boardRoomId);
	}

	@Override
	public int getCount() {
		return meetingDao.getCount();
	}

}

