
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.ExamineState;

public interface ExamineStateService {
	public void add(ExamineState examineState);
	public void del(int id);
	public void update(ExamineState examineState);
	public ExamineState load(int id);
	public List<ExamineState> loadList(ExamineState examineState);
}



