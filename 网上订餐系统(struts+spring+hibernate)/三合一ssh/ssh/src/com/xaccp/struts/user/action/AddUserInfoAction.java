package com.xaccp.struts.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.po.Credit;
import com.xaccp.po.UserInfo;
import com.xaccp.service.CreditService;
import com.xaccp.service.UserInfoService;
import com.xaccp.struts.form.UserInfoForm;
import com.xaccp.util.MD5;

public class AddUserInfoAction extends Action {

	private UserInfoService userInfoService;
	private CreditService creditService;
	
	public CreditService getCreditService() {
		return creditService;
	}

	public void setCreditService(CreditService creditService) {
		this.creditService = creditService;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// 获得随机数
		StringBuffer random=(StringBuffer)request.getSession().getAttribute("RandomCode");
		//输入的随机数
		String rand=request.getParameter("randCode");
		//判断随机数和获得的随机数是否是一样的
		if(!random.toString().equals(rand)){
			ActionErrors ae=new ActionErrors();
			ae.add("randError",new ActionError("error") );
			saveErrors(request, ae);
			return mapping.getInputForward();
		}
		MD5 md=new MD5();
		//FORM-->PO
		UserInfoForm userInfoForm = (UserInfoForm) form;
		UserInfo ui=new UserInfo();
		
		ui.setUAddress(userInfoForm.getUaddress());
		ui.setUAge(userInfoForm.getUserAge());
		ui.setUEmail(userInfoForm.getUemail());
		ui.setUName(userInfoForm.getUserName());
		ui.setUPaperCode(userInfoForm.getPaperCode());
		ui.setUPass(md.getMD5ofStr(userInfoForm.getUserPass1()));
		ui.setURealName(userInfoForm.getRealName());
		ui.setUTel(userInfoForm.getUserTel());
		ui.setUSex(userInfoForm.getUserSex());
		
		//添加用户
		userInfoService.addUser(ui);
		
		//用户积分
		Credit c=new Credit();
		c.setUCount(0);
		c.setUserInfo(ui);
		//添加积分
		creditService.saveCredit(c);
		
		return mapping.findForward("ok");
	}
}