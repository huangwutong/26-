

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.ExamineState;

public interface ExamineStateDao {
	public void add(ExamineState examineState);
	public void del(int id);
	public void update(ExamineState examineState);
	public ExamineState load(int id);
	public List<ExamineState> loadList(ExamineState examineState);
}



