

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.LeaveWord;

public interface LeaveWordDao {
	public void add(LeaveWord leaveWord);
	public void del(int id);
	public void update(LeaveWord leaveWord);
	public LeaveWord load(int id);
	public List<LeaveWord> loadList(LeaveWord leaveWord);
	public List<LeaveWord> getLeaveWordsByUserId(int userId);
}



