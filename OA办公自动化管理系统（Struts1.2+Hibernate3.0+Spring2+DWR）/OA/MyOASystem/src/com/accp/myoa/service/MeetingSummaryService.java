
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.MeetingSummary;

public interface MeetingSummaryService {
	public void add(MeetingSummary meetingSummary);
	public void del(int id);
	public void update(MeetingSummary meetingSummary);
	public MeetingSummary load(int id);
	public List<MeetingSummary> loadList(MeetingSummary meetingSummary);
}



