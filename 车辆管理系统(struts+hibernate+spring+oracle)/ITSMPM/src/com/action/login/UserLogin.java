package com.action.login;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;
import com.service.utils.Constants;;
public class UserLogin extends ActionSupport {

	private String username;
	private Long password;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		HttpServletRequest re=ServletActionContext.getRequest();
		HttpSession session = re.getSession();
		// TODO Auto-generated method stub
		//用户登录后首先进入这个action，拿出用户名设置到session中
		//首先验证用户
		 List l=new ArrayList();
		 //根据用户名和密码获得用户信息
		l=userService.getXxuserBynmpass(username, password);
		if(l.size()==0){
			addActionError("用户名或密码错误！");
			return INPUT;
		}else{
			//验证通过后查看是不是第一次登陆，如果是第一次登陆提示修改初始密码0---没改过,1---改过
			Xxuser xxuser =(Xxuser)l.get(0);
			if(xxuser.getStats().equals("0")){
				return "uppassword";
			}else{
				//验证通过后，拿出该用户所对应的权限，并保存在session中，获得用户权限的id
				Long compsid=userService.getCompsIdBynm(username);
				session.setAttribute(Constants.COMPSID, compsid);
			    return SUCCESS;
			}
		}
	}
	@Override
	public void validate() {
		if(username==null||username.trim().toString().equals("")){
			addActionError("用户名必须输入！");
		}
		if(password==null||String.valueOf(password).toString().trim().equals("")){
			addActionError("密码必须输入！");
		}
//		最好先判断下用户名和密码是否正确，可以搞一个注册的页面
		if(password.equals(password)){
			addActionError("必须先进行注册");
		}
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Long getPassword() {
		return password;
	}
	public void setPassword(Long password) {
		this.password = password;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
