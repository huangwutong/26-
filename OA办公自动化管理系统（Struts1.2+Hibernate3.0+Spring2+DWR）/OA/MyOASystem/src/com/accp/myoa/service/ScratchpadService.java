
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.Scratchpad;
import com.accp.myoa.entity.User;

public interface ScratchpadService {
	public void add(Scratchpad scratchpad);
	public void del(int id);
	public void update(Scratchpad scratchpad);
	public Scratchpad load(int id);
	public List<Scratchpad> loadList(Scratchpad scratchpad);
	public Scratchpad get(int id);
	
	public Integer getCountDaysOfThisMonth(String year,String month);
	public Integer getThisMonthFirstDayWeek(String year,String month);
	public List<Scratchpad> getScratchpadByDate(String year,String month,User user);
	public List<Scratchpad> getScratchpadByDay(String year,String month, String day,String userId);
	public void delScratchpadByDate(int scratchpadId);
	public boolean addScratchpad(Scratchpad scratchpad,String date);
	public boolean updateScratchpad(Scratchpad scratchpad);
}



