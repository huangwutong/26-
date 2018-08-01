
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.User;

public interface UserService {
	public void add(User user);
	public void del(int id);
	public void update(User user);
	public User load(int id);
	public List<User> loadList(User user);
	public User get(int id);
	
	//新加的内容
	public User getByNameAndPwd(User user);
	public boolean modifyPwd(User user);
	//新加内容
	public boolean checkUserName(String loginName);
}



