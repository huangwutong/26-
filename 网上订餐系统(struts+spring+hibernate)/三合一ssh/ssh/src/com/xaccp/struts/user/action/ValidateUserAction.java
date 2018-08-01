package com.xaccp.struts.user.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.service.UserInfoService;

public class ValidateUserAction extends Action {

	private UserInfoService userInService;
	
	public UserInfoService getUserInService() {
		return userInService;
	}

	public void setUserInService(UserInfoService userInService) {
		this.userInService = userInService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userName=request.getParameter("userName");
		//查询用户看是否已存在
		List list=userInService.findUserByUserName(userName);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		/*
		 * 判断如果数据库中存在这个用户名则list.size()返回大于0；
		 * 表明此用户已存在
		 * */
		if(list.size()!=0){
			out.print("<span style='color: red;font-weight: bold;'>Sorry！用户名已存在！！！</span>");
		}
		else{
			out.print("<span style='color: green;font-weight: bold;'>恭喜！此用户名可以使用！！！</span>");
		}
		return null;
	}
}