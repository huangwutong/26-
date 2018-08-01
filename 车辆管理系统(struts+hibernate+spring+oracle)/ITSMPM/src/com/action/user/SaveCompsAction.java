package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Comps;
import com.java.Roletb;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class SaveCompsAction extends ActionSupport {

	private String comname;
	private String comdes;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Comps rol=new Comps();
		rol.setComdes(comdes);
		rol.setComname(comname);
		userService.SaveComps(rol);
		addActionMessage("数据保存成功！");
		return SUCCESS;
	}

	
	
	
	
	
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		if(comname==null||comname.toString().trim().equals("")){
			 addActionError("权限名必须选择！");
		 }
		List l=new ArrayList();
		l=userService.QueryByTab("Comps", "comname", comname);
		if(l.size()!=0){
			addActionError("该权限名已经存在！");
		}
		
	}






	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public String getComdes() {
		return comdes;
	}

	public void setComdes(String comdes) {
		this.comdes = comdes;
	}

	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
