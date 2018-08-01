

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Scratchpad;
import com.accp.myoa.entity.User;

public interface ScratchpadDao {
	public void add(Scratchpad scratchpad);
	public void del(int id);
	public void update(Scratchpad scratchpad);
	public Scratchpad load(int id);
	public Scratchpad get(int id);
	public List<Scratchpad> loadList(Scratchpad scratchpad);
	
	
	public List<Scratchpad> getScratchpadByDate(String year,String month,User user);
	public List<Scratchpad> getScratchpadByDay(String year,String month, String day,String userId);
	public void delScratchpadByDate(int scratchpadId); 
	public boolean addScratchpad(Scratchpad scratchpad);
	public boolean updateScratchpad(Scratchpad scratchpad);
}



