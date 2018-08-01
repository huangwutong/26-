
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.MeetingSummaryDao;
import com.accp.myoa.entity.MeetingSummary;
import com.accp.myoa.service.MeetingSummaryService;

public class MeetingSummaryServiceImpl implements MeetingSummaryService {
	private MeetingSummaryDao meetingSummaryDao;
	
	
	
	public void setMeetingSummaryDao(MeetingSummaryDao meetingSummaryDao) {
		this.meetingSummaryDao = meetingSummaryDao;
	}

	public void add(MeetingSummary meetingSummary) {
		meetingSummaryDao.add(meetingSummary);

	}

	public void del(int id) {
		meetingSummaryDao.del(id);

	}

	public MeetingSummary load(int id) {
		return meetingSummaryDao.load(id);
	}

	public List<MeetingSummary> loadList(MeetingSummary meetingSummary) {
		return meetingSummaryDao.loadList(meetingSummary);
	}

	public void update(MeetingSummary meetingSummary) {
		meetingSummaryDao.update(meetingSummary);

	}

}

