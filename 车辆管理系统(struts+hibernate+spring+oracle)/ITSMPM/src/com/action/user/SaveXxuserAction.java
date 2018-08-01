package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.Test;
import com.service.intface.user.UserService;

public class SaveXxuserAction extends ActionSupport {

	private String name;
	private Long password;
	private String des;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Xxuser xxuser=new Xxuser();
		xxuser.setDes(des.trim());
		xxuser.setName(name.trim());
		xxuser.setPassword(password);
		xxuser.setStats("0");
		System.out.println("aaasdsdsadsa"+name);
		userService.saveUser(xxuser);
		addActionMessage("数据保存成功！");
		return SUCCESS;
	}
	 
	
	
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		List l=new ArrayList();
		if(name==null||name.trim().equals("")){
			addActionError("用户必须填写！");
		}
		if(password==null){
			addActionError("密码必须填写！");
		}
		l=userService.QueryByTab("Xxuser", "name", name);
		if(l.size()!=0){
			addActionError("该用户已经存在！");
		}
	}



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	 
	public Long getPassword() {
		return password;
	}
	public void setPassword(Long password) {
		this.password = password;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	 
	 
	 

}
