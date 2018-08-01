
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.DiaryDao;
import com.accp.myoa.entity.Diary;
import com.accp.myoa.service.DiaryService;

public class DiaryServiceImpl implements DiaryService {
	private DiaryDao diaryDao;
	
	
	
	public void setDiaryDao(DiaryDao diaryDao) {
		this.diaryDao = diaryDao;
	}

	public void add(Diary diary) {
		diaryDao.add(diary);

	}

	public void del(int id) {
		diaryDao.del(id);

	}

	public Diary load(int id) {
		return diaryDao.load(id);
	}

	public List<Diary> loadList(Diary diary) {
		return diaryDao.loadList(diary);
	}

	public void update(Diary diary) {
		diaryDao.update(diary);

	}

}

