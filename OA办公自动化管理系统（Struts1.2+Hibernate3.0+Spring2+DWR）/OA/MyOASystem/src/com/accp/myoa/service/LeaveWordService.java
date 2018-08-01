
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.LeaveWord;

public interface LeaveWordService {
	public void add(LeaveWord leaveWord);
	public void del(int id);
	public void update(LeaveWord leaveWord);
	public LeaveWord load(int id);
	public List<LeaveWord> loadList(LeaveWord leaveWord);
	public List<LeaveWord> getLeaveWordsByUserId(int userId);
}



