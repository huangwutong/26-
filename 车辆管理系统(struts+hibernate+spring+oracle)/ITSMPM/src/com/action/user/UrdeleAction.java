package com.action.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.UR;
import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class UrdeleAction extends ActionSupport {

	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		UR pr=new UR();
		if(a[0]!=null){
			pr = userService.QueryURById(new Long(a[0].trim()));
			userService.deleUR(pr);
			addActionMessage("数据删除成功！");
		}else{
			System.out.println("删除用户信息时出错！");
		}
		return SUCCESS;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
