
package com.accp.myoa.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.Email;
import com.accp.myoa.entity.EmailReceivce;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.EmailService;
import com.accp.myoa.web.form.EmailForm;


public class EmailAction extends DispatchAction {
	private EmailService emailService;
		
	public void setEmailService(EmailService emailService) {
		this.emailService = emailService;
	}

	
	public ActionForward mydo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		return mapping.findForward("mydo");
	}
	
	/**
	 * 查询已删除的Email
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward toDeleteEmail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int page=1;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		List<Integer> list=emailService.getDeleteEmailCountAndMaxPage(user.getUserId());
		request.setAttribute("curPage", page);//当前页
		request.setAttribute("count", list.get(0));//总条数
		request.setAttribute("maxPage",list.get(1));//最大页数
		
		
		request.setAttribute("thisweek", emailService.getWeekFirstDay());//这一周星期一
		request.setAttribute("lastweek", emailService.getLastWeekFirstDay());//上一周星期一
		List<EmailReceivce> listemail=emailService.getDeleteEmailByUser(user.getUserId(), page);//获得信件
		request.setAttribute("listemail", listemail);
		
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		request.setAttribute("today",today+" 0:00");
		return mapping.findForward("deleteEmail");
		
	}
	
	public ActionForward toGiveMail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int page=1;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		List<Integer> list=emailService.getCountAndMaxPage(user.getUserId());
		request.setAttribute("curPage", page);//当前页
		request.setAttribute("count", list.get(0));//总条数
		request.setAttribute("maxPage",list.get(1));//最大页数
		int unread=emailService.getCountUnRead(user.getUserId());
		request.setAttribute("unread", unread);//未读取的邮件的总数
		request.setAttribute("thisweek", emailService.getWeekFirstDay());//这一周星期一
		request.setAttribute("lastweek", emailService.getLastWeekFirstDay());//上一周星期一
		List<EmailReceivce> listemail=emailService.getEmailByUser(user.getUserId(), page);//获得信件
		request.setAttribute("listemail", listemail);
		
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		request.setAttribute("today",today+" 0:00");
		return mapping.findForward("email");
	}
	
	
	public ActionForward toShowEmail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		int id=Integer.parseInt(request.getParameter("id"));
		Email email=emailService.getEmailById(id);//查到一件邮件
		if(email.getEmailType().getEmailTypeName().equals("抄送")){
			List<String> list=emailService.getSendEmailUserByEmailId(email.getEmailId(),user.getUserId());
			request.setAttribute("userlist", list);
		}
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("email", email);
		
		
		
		if(request.getParameter("flag").equals("em")){
			//System.out.print("em");
			request.setAttribute("situ", "em");
			//改变这封邮件的浏览状态为已打开
			emailService.changeEmailReceivceState(user, id);
		}else{
			request.setAttribute("situ", "de");
		}
		return mapping.findForward("showemail");
	}
	
	
	
	//发邮件
	public ActionForward sendEmail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
			EmailForm emailForm=(EmailForm)form;
			String strsss=emailForm.getIds();
		//System.out.print(emailForm.getEmail().getEmailType().getEmailTypeId()+":"+emailForm.getEmail().getEmailType().getEmailTypeName());
		if(emailService.addEmail(emailForm.getEmail(), emailForm.getIds())){
		
			request.setAttribute("info", "邮件发送成功！");//提示的信息
	
			request.setAttribute("url","email.do?operate=toWriteMail");//跳转的地址
			request.setAttribute("value", "返回");//按钮的value
			return mapping.findForward("success");
		}else{
	
			request.setAttribute("info", "邮件发送失败！");
			request.setAttribute("url","email.do?operate=toWriteMail");//跳转的地址
			request.setAttribute("value", "返回");//按钮的value
			return mapping.findForward("failure");
		}
		
	}
	/***
	 * 彻底删除
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public ActionForward doTrueDelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		//PrintWriter out =response.getWriter();
		
		String str=request.getParameter("id");
		String [] id=str.split(";");
		emailService.emailTrueDelete(id);
		
		int page=1;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		if(request.getParameter("flag").equals("tr")){
			List<Integer> list=emailService.getCountAndMaxPage(user.getUserId());
			request.setAttribute("curPage", page);//当前页
			request.setAttribute("count", list.get(0));//总条数
			request.setAttribute("maxPage",list.get(1));//最大页数
			int unread=emailService.getCountUnRead(user.getUserId());
			request.setAttribute("unread", unread);//未读取的邮件的总数
			request.setAttribute("thisweek", emailService.getWeekFirstDay());//这一周星期一
			request.setAttribute("lastweek", emailService.getLastWeekFirstDay());//上一周星期一
			List<EmailReceivce> listemail=emailService.getEmailByUser(user.getUserId(), page);//获得信件
			request.setAttribute("listemail", listemail);
			
			String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			request.setAttribute("today",today+" 0:00");
			
				return mapping.findForward("email");
		}else{
			List<Integer> list=emailService.getDeleteEmailCountAndMaxPage(user.getUserId());
			request.setAttribute("curPage", page);//当前页
			request.setAttribute("count", list.get(0));//总条数
			request.setAttribute("maxPage",list.get(1));//最大页数
			
			
			request.setAttribute("thisweek", emailService.getWeekFirstDay());//这一周星期一
			request.setAttribute("lastweek", emailService.getLastWeekFirstDay());//上一周星期一
			List<EmailReceivce> listemail=emailService.getDeleteEmailByUser(user.getUserId(), page);//获得信件
			request.setAttribute("listemail", listemail);
			
			String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			request.setAttribute("today",today+" 0:00");
			return mapping.findForward("deleteEmail");
		}
		
	}
	
	/**
	 * 删除
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public ActionForward doFalseDelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		//PrintWriter out =response.getWriter();
		String str=request.getParameter("id");
	//	System.out.println(str);
		String [] id=str.split(";");
	//	System.out.println(id.length);
		emailService.emailFalseDelete(id);
		
		
		
		int page=1;
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		List<Integer> list=emailService.getCountAndMaxPage(user.getUserId());
		request.setAttribute("curPage", page);//当前页
		request.setAttribute("count", list.get(0));//总条数
		request.setAttribute("maxPage",list.get(1));//最大页数
		int unread=emailService.getCountUnRead(user.getUserId());
		request.setAttribute("unread", unread);//未读取的邮件的总数
		request.setAttribute("thisweek", emailService.getWeekFirstDay());//这一周星期一
		request.setAttribute("lastweek", emailService.getLastWeekFirstDay());//上一周星期一
		List<EmailReceivce> listemail=emailService.getEmailByUser(user.getUserId(), page);//获得信件
		request.setAttribute("listemail", listemail);
		
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		request.setAttribute("today",today+" 0:00");
		return mapping.findForward("email");
	}
	
	public ActionForward toWriteMail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		return mapping.findForward("wmail");
	}
	
}
	
