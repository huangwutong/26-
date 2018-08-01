
package com.accp.myoa.service.impl;

import java.util.Calendar;
import java.util.List;

import com.accp.myoa.common.TypeConverter;
import com.accp.myoa.dao.ScratchpadDao;
import com.accp.myoa.entity.Scratchpad;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.ScratchpadService;

public class ScratchpadServiceImpl implements ScratchpadService {
private ScratchpadDao scratchpadDao;
	
	
	public void setScratchpadDao(ScratchpadDao scratchpadDao) {
		this.scratchpadDao = scratchpadDao;
	}

	//获得某年某月共多少天
	@Override
	public Integer getCountDaysOfThisMonth(String year,String month) {
		Calendar c= Calendar.getInstance(); 
		c.set(Calendar.YEAR, Integer.parseInt(year)); //年
		c.set(Calendar.MONTH, Integer.parseInt(month)-1); //月
		
		//System.out.println("年:"+c.get(Calendar.YEAR));
		//System.out.println("月"+(c.get(Calendar.MONTH)+1));
		//System.out.println("这个月共多少天:"+c.getActualMaximum(Calendar.DAY_OF_MONTH)); 
		
		
		return c.getActualMaximum(Calendar.DAY_OF_MONTH);
	}
	
	//获得某年某月1号是星期几,1为星期日，2为星期一，7为星期六
	@Override
	public Integer getThisMonthFirstDayWeek(String year,String month) {
		Calendar a=Calendar.getInstance();
		a.set(Calendar.YEAR, Integer.parseInt(year)); //年
		a.set(Calendar.MONTH, Integer.parseInt(month)-1); //月
		a.set(Calendar.DAY_OF_MONTH, 1); 
		
		//System.out.println("年:"+a.get(Calendar.YEAR));
		//System.out.println("月"+(a.get(Calendar.MONTH)+1));
		//System.out.println("这个月共多少天:"+a.getActualMaximum(Calendar.DAY_OF_MONTH)); 
		//System.out.println("查的是这个月的1号是星期几："+a.get(Calendar.DAY_OF_WEEK));//1为星期日，2为星期一，7为星期六
		return a.get(Calendar.DAY_OF_WEEK);
	}

	

	@Override
	public List<Scratchpad> getScratchpadByDay(String year, String month,
			String day, String userId) {
		//System.out.println("a");
		return scratchpadDao.getScratchpadByDay(year, month, day, userId);
	}
	
	//删除
	@Override
	public void delScratchpadByDate(int scratchpadId) {
		
		scratchpadDao.delScratchpadByDate(scratchpadId);
		
	}

	@Override
	public List<Scratchpad> getScratchpadByDate(String year,String month,User user){
		return scratchpadDao.getScratchpadByDate(year, month, user);
	}

	@Override
	public void add(Scratchpad scratchpad) {
		// TODO Auto-generated method stub
		scratchpadDao.add(scratchpad);
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		scratchpadDao.del(id);
	}

	@Override
	public Scratchpad load(int id) {
		// TODO Auto-generated method stub
		return scratchpadDao.load(id);
	}

	@Override
	public List<Scratchpad> loadList(Scratchpad scratchpad) {
		// TODO Auto-generated method stub
		return scratchpadDao.loadList(scratchpad);
	}

	@Override
	public void update(Scratchpad scratchpad) {
		// TODO Auto-generated method stub
		scratchpadDao.update(scratchpad);
	}

	//添加
	@Override
	public boolean addScratchpad(Scratchpad scratchpad,String date) {
		scratchpad.setScratchpadDate(TypeConverter.getStringDate(date, "yyyy-MM-dd HH:mm"));
		return scratchpadDao.addScratchpad(scratchpad);
	}

	@Override
	public Scratchpad get(int id) {
		
		return scratchpadDao.get(id);
	}

	@Override
	public boolean updateScratchpad(Scratchpad scratchpad) {
		
		return scratchpadDao.updateScratchpad(scratchpad);
	}

}

