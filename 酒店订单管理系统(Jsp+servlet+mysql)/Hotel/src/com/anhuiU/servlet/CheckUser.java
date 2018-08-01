package com.anhuiU.servlet;

import com.anhuiU.dao.UserDao;

public class CheckUser {
	UserDao ud=new UserDao();


	public String checkUser(String name){
		boolean result;
		String msg;
		
		if(name.equals("")){
			msg="用户名不能为空";
		}
		else{
		
		result=  ud.selectByName(name);
		
		if(result){

			msg= "用户名已被注册";

		}
		else{

			msg="用户名可以使用";
		}
		}
		return msg;
	}


   

}
