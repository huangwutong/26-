package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.MenuDao;
import com.accp.myoa.entity.Menu;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.MenuService;

public class MenuServiceImpl implements MenuService {
	private MenuDao menuDao;
	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}
	@Override
	public List<Menu> getMenu(int id,User user) {
		return menuDao.getMenu(id,user);
	}
	@Override
	public List<Menu> getMainMenu(User user) {
		// TODO Auto-generated method stub
		return menuDao.getMainMenu(user);
	}
	@Override
	public int getMenuId(User user) {
		return menuDao.getMenuId(user);
	}

}
