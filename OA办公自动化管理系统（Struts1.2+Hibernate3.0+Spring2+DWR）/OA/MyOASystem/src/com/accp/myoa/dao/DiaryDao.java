

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Diary;

public interface DiaryDao {
	public void add(Diary diary);
	public void del(int id);
	public void update(Diary diary);
	public Diary load(int id);
	public List<Diary> loadList(Diary diary);
}



