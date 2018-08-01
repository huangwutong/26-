package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Comps;
import com.java.Resfun;
import com.java.Roletb;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class SaveResfunAction extends ActionSupport {

	private String pname;
	private String cname;
	private String caction;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Resfun rol=new Resfun();
		rol.setCaction(caction);
		rol.setCname(cname);
		rol.setPname(pname);
		userService.SaveResfun(rol);
		addActionMessage("数据保存成功！");
		return SUCCESS;
	}
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		 if(pname==null||pname.toString().equals("")){
			 addActionError("父项节点名称必填！");
		 }
		 if(cname==null||cname.toString().equals("")){
			 addActionError("子项节点名称必填！");
		 }
		 if(caction==null||caction.toString().equals("")){
			 addActionError("子项节点动作必填！");
		 }
		 List l=new ArrayList();
		 l=userService.QueryByPcac("Resfun", "pname", pname, "cname", cname, "caction", caction);
		 if(l.size()!=0){
			 addActionError("该纪录已经存在！");
		 }
		 
		 
		 
		 
		 
	}

	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public String getCaction() {
		return caction;
	}


	public void setCaction(String caction) {
		this.caction = caction;
	}


	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
