

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Meeting;

public interface MeetingDao {
	public int add(Meeting meeting);
	public void del(int id);
	public void update(Meeting meeting);
	public Meeting load(int id);
	public List<Meeting> loadList(Meeting meeting);
	public boolean isExists(String beginTime ,String endTime,int boardRoomId);
	public List<Meeting> findByPage(int pageNum,int pageSize);
	public int getCount();
}



