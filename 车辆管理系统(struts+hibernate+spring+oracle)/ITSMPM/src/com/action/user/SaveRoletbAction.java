package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Roletb;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class SaveRoletbAction extends ActionSupport {

	private String rolename;
	private String roledes;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Roletb rol=new Roletb();
		rol.setRoledes(roledes);
		rol.setRolename(rolename);
		userService.SaveRoletb(rol);
		addActionMessage("数据保存成功！");
		return SUCCESS;
	}
	
	
	
	
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		List l=new ArrayList();
		if(rolename==null||rolename.trim().equals("")){
			addActionError("角色名必须填写！");
		}
		l=userService.QueryByTab("Roletb", "rolename", rolename);
		if(l.size()!=0){
			addActionError("该角色已经存在！");
		}
		
		
	}




	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getRoledes() {
		return roledes;
	}
	public void setRoledes(String roledes) {
		this.roledes = roledes;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
