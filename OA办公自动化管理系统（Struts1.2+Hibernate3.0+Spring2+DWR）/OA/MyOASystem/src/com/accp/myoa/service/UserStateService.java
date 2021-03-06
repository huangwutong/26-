
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.UserState;

public interface UserStateService {
	public void add(UserState userState);
	public void del(int id);
	public void update(UserState userState);
	public UserState load(int id);
	public List<UserState> loadList(UserState userState);
}



