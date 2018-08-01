

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.WeekDiary;

public interface WeekDiaryDao {
	public void add(WeekDiary weekDiary);
	public void del(int id);
	public void update(WeekDiary weekDiary);
	public WeekDiary load(int id);
	public List<WeekDiary> loadList(WeekDiary weekDiary);
}



