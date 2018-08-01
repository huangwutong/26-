
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.MeetingSummaryScan;

public interface MeetingSummaryScanService {
	public void add(MeetingSummaryScan meetingSummaryScan);
	public void del(int id);
	public void update(MeetingSummaryScan meetingSummaryScan);
	public MeetingSummaryScan load(int id);
	public List<MeetingSummaryScan> loadList(MeetingSummaryScan meetingSummaryScan);
}



