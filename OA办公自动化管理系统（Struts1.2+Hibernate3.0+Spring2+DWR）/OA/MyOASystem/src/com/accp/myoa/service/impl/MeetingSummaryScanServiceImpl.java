
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.MeetingSummaryScanDao;
import com.accp.myoa.entity.MeetingSummaryScan;
import com.accp.myoa.service.MeetingSummaryScanService;

public class MeetingSummaryScanServiceImpl implements MeetingSummaryScanService {
	private MeetingSummaryScanDao meetingSummaryScanDao;
	
	
	
	public void setMeetingSummaryScanDao(MeetingSummaryScanDao meetingSummaryScanDao) {
		this.meetingSummaryScanDao = meetingSummaryScanDao;
	}

	public void add(MeetingSummaryScan meetingSummaryScan) {
		meetingSummaryScanDao.add(meetingSummaryScan);

	}

	public void del(int id) {
		meetingSummaryScanDao.del(id);

	}

	public MeetingSummaryScan load(int id) {
		return meetingSummaryScanDao.load(id);
	}

	public List<MeetingSummaryScan> loadList(MeetingSummaryScan meetingSummaryScan) {
		return meetingSummaryScanDao.loadList(meetingSummaryScan);
	}

	public void update(MeetingSummaryScan meetingSummaryScan) {
		meetingSummaryScanDao.update(meetingSummaryScan);

	}

}

