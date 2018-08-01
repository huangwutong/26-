

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.MeetingRead;

public interface MeetingReadDao {
	public void add(MeetingRead meetingRead);
	public void del(int id);
	public void update(MeetingRead meetingRead);
	public MeetingRead load(int id);
	public List<MeetingRead> loadList(MeetingRead meetingRead);
}



