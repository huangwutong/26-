package com.action.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Comps;
import com.java.ResP;
import com.java.Roletb;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class RespdeleAction extends ActionSupport {
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		ResP pr=new ResP();
		if(a[0]!=null){
			pr = userService.QueryResPById(new Long(a[0].trim()));
			userService.deleResP(pr);
			addActionMessage("数据删除成功！");
		}else{
			System.out.println("删除信息时出错！");
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
