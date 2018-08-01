

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Meetingstate;

public interface MeetingstateDao {
	public void add(Meetingstate meetingstate);
	public void del(int id);
	public void update(Meetingstate meetingstate);
	public Meetingstate load(int id);
	public List<Meetingstate> loadList(Meetingstate meetingstate);
}



