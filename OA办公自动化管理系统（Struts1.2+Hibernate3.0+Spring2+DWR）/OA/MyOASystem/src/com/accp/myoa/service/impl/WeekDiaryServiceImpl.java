
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.WeekDiaryDao;
import com.accp.myoa.entity.WeekDiary;
import com.accp.myoa.service.WeekDiaryService;

public class WeekDiaryServiceImpl implements WeekDiaryService {
	private WeekDiaryDao weekDiaryDao;
	
	
	
	public void setWeekDiaryDao(WeekDiaryDao weekDiaryDao) {
		this.weekDiaryDao = weekDiaryDao;
	}

	public void add(WeekDiary weekDiary) {
		weekDiaryDao.add(weekDiary);

	}

	public void del(int id) {
		weekDiaryDao.del(id);

	}

	public WeekDiary load(int id) {
		return weekDiaryDao.load(id);
	}

	public List<WeekDiary> loadList(WeekDiary weekDiary) {
		return weekDiaryDao.loadList(weekDiary);
	}

	public void update(WeekDiary weekDiary) {
		weekDiaryDao.update(weekDiary);

	}

}

