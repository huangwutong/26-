

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.User;

public interface UserDao {
	public void add(User user);
	public void del(int id);
	public void update(User user);
	public User load(int id);
	public List<User> loadList(User user);
	public User get(int id);
	
	
	//新加的
	public User getByNameAndPwd(User user);
	public boolean modifyPwd(User user);
	public String getUser(String str);
}



