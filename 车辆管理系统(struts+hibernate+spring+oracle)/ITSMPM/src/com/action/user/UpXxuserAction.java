package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class UpXxuserAction extends ActionSupport {

	private String name;
	private Long id;
	private String des;
	private Long password;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Xxuser xxuser=new Xxuser();
		xxuser.setDes(des.trim());
		xxuser.setName(name.trim());
		xxuser.setId(id);
		xxuser.setPassword(password);
		userService.upUser(xxuser);
		addActionMessage("数据修改成功！");
		return SUCCESS;
	}
	 

	@Override
	public void validate() {
		// TODO Auto-generated method stub
		if(name==null||name.trim().equals("")){
			addActionError("用户必须填写！");
		}
		
		List l=new ArrayList();
		l=userService.QueryByTabId("Xxuser", "id", id);
		//判断是否修改
		if(l.size()!=0){
			
			for(int i=0;i<l.size();i++){
				Xxuser xxuser=new Xxuser();
				xxuser=(Xxuser)l.get(i);
				if(xxuser.getName().equals(name.trim())){
					System.out.println("mei gai");
				}else{
					List n=new ArrayList();
					n=userService.QueryByTab("Xxuser", "name", name);
					if(n.size()!=0){
						addActionError("该用户已经存在！");
					}
				}
			}
		
		
			
		}
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	 
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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
