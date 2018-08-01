package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.Menu;
import com.accp.myoa.entity.User;

public interface MenuService {
	public List<Menu> getMenu(int id,User user);
	public List<Menu> getMainMenu(User user);
	public int getMenuId(User user) ;
}
