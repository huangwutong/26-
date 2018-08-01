package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Roletb;
import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class UpRoletbAction extends ActionSupport {

	private String rolename;
	private Long roletbid;
	private String roledes;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Roletb rol=new Roletb();
		rol.setRoledes(roledes);
		rol.setRolename(rolename);
		rol.setRoletbid(roletbid);
		userService.upRoletb(rol);
		addActionMessage("数据修改成功！");
		return SUCCESS;
	}
	  
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		if(rolename==null||rolename.trim().equals("")){
			addActionError("角色必须填写！");
		}
		List l=new ArrayList();
		l=userService.QueryByTabId("Roletb", "roletbid", roletbid);
		//判断是否修改
		if(l.size()!=0){
			
			for(int i=0;i<l.size();i++){
				Roletb roletb=new Roletb();
				roletb=(Roletb)l.get(i);
				if(roletb.getRolename().equals(rolename.trim())){
					System.out.println("mei gai");
				}else{
					List n=new ArrayList();
					n=userService.QueryByTab("Roletb", "rolename", rolename);
					if(n.size()!=0){
						addActionError("该用户已经存在！");
					}
				}
			}
			
		}
		
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public Long getRoletbid() {
		return roletbid;
	}

	public void setRoletbid(Long roletbid) {
		this.roletbid = roletbid;
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
