package com.accp.myoa.web.action;

import javax.servlet.http.HttpServletRequest;

import com.accp.myoa.entity.User;

public class UserGetter {
	private User user;

	public static User getUser(HttpServletRequest request) {
		return (User)request.getSession().getAttribute("user");
	}

	public static void setUser(User user,HttpServletRequest request) {
		request.getSession().setAttribute("user", user);
	}
}
