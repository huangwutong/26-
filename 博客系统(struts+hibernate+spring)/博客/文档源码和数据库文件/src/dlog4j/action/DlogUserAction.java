/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j.action;

import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dlog4j.RandomImageServlet;
import dlog4j.SiteManager;
import dlog4j.UserManager;
import dlog4j.formbean.LoginTrackBean;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;
import dlog4j.security.DlogRole;
import dlog4j.security.SecurityConfig;

/** 
 * DlogGlobalAction.java created by EasyStruts - XsltGen.
 * http://easystruts.sf.net
 * created on 01-31-2004
 * 
 * XDoclet definition:
 * @struts:action parameter="userName" validate="true"
 * @struts:action-exception key="sql" path="/index.jsp"
 * @struts:action-forward name="/WEB-INF/jsp/login.jsp" path="/WEB-INF/jsp/login.jsp"
 */
public class DlogUserAction extends DlogActionBase {

	// --------------------------------------------------------- Instance Variables
	public final static String HOME_PAGE = "home";
	public final static String LIST_ERROR_KEY = "list";
	public final static String EDIT_ERROR_KEY = "edit";
	// --------------------------------------------------------- Methods
	/**
	 * 修改用户角色
	 */
	public ActionForward doSetUserRole(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
		ActionErrors errors = new ActionErrors();
		Session session = null;
		UserForm user = (UserForm)form;
		//判断用户是否登陆
		UserForm loginUser = getLoginUser(request);
		if(loginUser==null || !loginUser.isLogin())
		    errors.add(LIST_ERROR_KEY,new ActionError("operation_need_login"));
		else if(!loginUser.isAdmin())
		    errors.add(LIST_ERROR_KEY,new ActionError("only_owner_allow"));
		else{
			try {
			    session = getSession();
			    SiteForm site = SiteManager.getCurrentSite(request);
			    UserForm old = (UserForm)session.load(UserForm.class,new Integer(user.getId()));
			    if(old!=null) {
			        old.setUserRole(user.getUserRole());
			        old.setPassword(user.getPassword());
			        String[] cats = request.getParameterValues("allowCat");
			        String scat = "";
			        for(int i=0;cats!=null && i<cats.length;i++){
			        	scat += cats[i];
			        	if((i+1)<cats.length)
			        		scat += ',';
			        }
			        old.setCats(scat);
			        session.update(old);
			    }
			    else 
				    errors.add(LIST_ERROR_KEY,new ActionError("user_not_found"));				    
			} catch(SQLException e) {
				getServlet().log("修改用户资料失败",e);
			    errors.add(LIST_ERROR_KEY,new ActionError("database_exception"));
			} catch(HibernateException e) {
				getServlet().log("修改用户资料失败",e);
			    errors.add(LIST_ERROR_KEY,new ActionError("hibernate_exception"));
			} catch(Exception e){
				getServlet().log("修改用户资料失败",e);
			} finally {
				commitSession(session, true);
			}
		}
		// Report any errors we have discovered back to the original form
		ActionForward forward = mapping.getInputForward();
		if (!errors.isEmpty())
		    saveErrors(request, errors);		
		else{
			forward.setPath(forward.getPath()+"?page="+request.getParameter("page"));
			forward.setRedirect(true);
		}
		return forward;
	}
	/**
	 * 用户注册
	 */
	public ActionForward doDeleteUser(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response,
		String userid)
		throws Exception 
	{
		ActionErrors errors = new ActionErrors();
		Session session = null;
		//判断用户是否登陆
		UserForm loginUser = getLoginUser(request);
		if(loginUser==null || !loginUser.isLogin())
		    errors.add(LIST_ERROR_KEY,new ActionError("operation_need_login"));
		else if(!loginUser.isAdmin())
		    errors.add(LIST_ERROR_KEY,new ActionError("only_owner_allow"));
		else{
			try {
			    session = getSession();
			    int uid = Integer.parseInt(userid);
			    SiteForm site = SiteManager.getCurrentSite(request);
			    UserForm user = UserManager.getUser(session,uid,false);
			    if(user!=null) {
			        int logcount = user.getLogCount();
			        int replycount = user.getReplyCount();
			        if(logcount>0)//还有日记不允许删除
					    errors.add(LIST_ERROR_KEY,new ActionError("logs_not_empty"));
			        else
			        if(replycount>0)//还有评论不允许删除
					    errors.add(LIST_ERROR_KEY,new ActionError("replies_not_empty"));				        
			        else
			            session.delete(user);
			    }
			    else 
				    errors.add(LIST_ERROR_KEY,new ActionError("user_not_found"));				    
			} catch(SQLException e) {
			    errors.add(LIST_ERROR_KEY,new ActionError("database_exception"));
			} catch(HibernateException e) {
			    errors.add(LIST_ERROR_KEY,new ActionError("hibernate_exception"));
			} finally {
				commitSession(session, true);
			}
		}
		// Report any errors we have discovered back to the original form
		ActionForward forward = mapping.getInputForward(); 
		if (!errors.isEmpty())
		    saveErrors(request, errors);			
		else{
			if(request.getParameter("page")!=null){
				StringBuffer path = new StringBuffer(forward.getPath());
				path.append("?page=");
				path.append(request.getParameter("page"));
				forward = new ActionForward(path.toString(),true);
			}
			else
				forward.setRedirect(true);
		}
		return forward;
	}
	/**
	 * 用户注册
	 */
	public ActionForward doAddUser(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
		Session session = null;
		UserForm user = (UserForm) form;
		ActionErrors es = new ActionErrors();
		boolean needCommit = false;
		try {
			//检查用户名
			if(StringUtils.isEmpty(user.getLoginName()))
				es.add("loginName",new ActionError("loginName_error"));
			else
			if(user.getLoginName().length()>16)
				es.add("loginName",new ActionError("loginname_too_long"));
			//昵称
			else
			if(StringUtils.isEmpty(user.getDisplayName()))
				es.add("displayName",new ActionError("displayName_empty"));
			else
			if(user.getDisplayName().length()>16)
				es.add("displayName",new ActionError("displayName_exceed_length"));
			else//检查密码
			if(StringUtils.isEmpty(user.getPassword()))
				es.add("password",new ActionError("password_empty"));
			else
			if(user.getPassword().length()>16)
				es.add("password",new ActionError("password_too_long"));
			else//检查电子邮件
			if(StringUtils.isNotEmpty(user.getEmail()) && user.getEmail().indexOf('@')==-1)
				es.add("email",new ActionError("email_error"));
			//检查用户名是否已存在
			else{
				user.setSite(SiteManager.getCurrentSite(request));
				session = getSession();
				UserForm userForm = UserManager.getUser(session,user.getSite(),user.getLoginName());
				if(userForm!=null)
					es.add("loginName",new ActionError("loginName_exist"));
				else{
					UserForm userForm2 = UserManager.getUser(session,user.getSite(),user.getDisplayName());
					if(userForm2!=null)
						es.add("displayName",new ActionError("displayName_exits"));
					else{
						user.setUserRole(DlogRole.ROLE_COMMON);
						//注册验证码检查
						String verifyCode = request.getParameter("verifyCode");
						if(!StringUtils.equals(verifyCode,RandomImageServlet.getRandomLoginKey(request)))
							es.add("verifyCode",new ActionError("verifyCode_error"));					
						else {
							UserForm u = UserManager.createUser(session,user);
							u.saveLoginUser(request);
							needCommit = true;
						}
					}
				}
			}
		} finally {
			if(session!=null){
				if(needCommit)
					commitSession(session, true);
				else
					closeSession(session);
			}
		}
		if(!es.isEmpty()){
			saveErrors(request, es);
			return mapping.getInputForward();
		}
		return mapping.findForward(HOME_PAGE);
	}
	/**
	 * 用户资料修改
	 */
	public ActionForward doEditUser(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
		UserForm user = (UserForm) form;
		Session session = null;
		ActionErrors es = new ActionErrors();
		boolean needCommit = false;
		try {
		    UserForm loginUser = UserForm.getLoginUser(request);
		    if(loginUser==null || user.getId()!=loginUser.getId())
		        es.add("name",new ActionError("operation_not_allow"));
		    else
			if(StringUtils.isEmpty(user.getDisplayName()))
				es.add("displayName",new ActionError("displayName_empty"));
			else
			if(user.getDisplayName().length()>16)
				es.add("displayName",new ActionError("displayName_exceed_length"));
			else//检查密码
			if(user.getPassword()!=null && user.getPassword().length()>16)
				es.add("password",new ActionError("password_too_long"));
			else//检查电子邮件
			if(StringUtils.isNotEmpty(user.getEmail()) && user.getEmail().indexOf('@')==-1)
				es.add("email",new ActionError("email_error"));
			else{
				session = getSession();
				UserForm u = (UserForm)session.load(UserForm.class,new Integer(user.getId()));
				if(u!=null) {
				    u.setDisplayName(user.getDisplayName());
				    u.setEmail(user.getEmail());
				    u.setHomePage(user.getHomePage());
				    u.setResume(user.getResume());
				    if(!StringUtils.isEmpty(user.getPassword())) {
				        u.setPassword(user.getPassword());
				    }
				    u.setPortrait(user.getPortrait());
				    session.update(u);
				    needCommit = true;
				    loginUser.setDisplayName(user.getDisplayName());
				    loginUser.setEmail(user.getEmail());
				    loginUser.setHomePage(user.getHomePage());
				    loginUser.setResume(user.getResume());
				    loginUser.setPortrait(user.getPortrait());
				    loginUser.saveLoginUser(request);
				}
				else
					es.add("loginName",new ActionError("loginName_noexits"));
			}
		} finally {
			if(session!=null){
				if(needCommit)
					commitSession(session, true);
				else
					closeSession(session);
			}
		}
		if(!es.isEmpty())
		    saveErrors(request,es);
		return mapping.findForward(HOME_PAGE);
	}
	/**
	* 用户登录
	*/
	public ActionForward doLogin(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
		Session ssn = null;
		ActionErrors es = new ActionErrors();
		boolean firstLogin = false;
		try {
			ssn = getSession();
			UserForm user = (UserForm) form;
			if (user.getLoginName()!=null) {
				String password = user.getPassword();
			    user = UserManager.getUser(ssn,SiteManager.getCurrentSite(request),user.getLoginName());
			    //检查用户名是否存在
			    if(user!=null) {
			    	//检查用户是否被暂停
					if(user.getUserRole()==DlogRole.ROLE_GUEST)
						es.add("login",new ActionError("user_pause"));	
			    	//检查密码
					else
			    	if(StringUtils.equals(user.getPassword(),password)){			    		
			    		if(user.isAdmin() && user.getLastTime()==null)
			    			firstLogin = true;
			    		//保存用户信息至会话
			    		user.setLastTime(new Date());
			    		user.setLoginCount(user.getLoginCount()+1);
			    		ssn.update(user);
			    		UserManager.fillUserWithLogAndReplyCount(ssn, user, false);
			    		//集成web-security的权限控制
			    		DlogRole role = (DlogRole)SecurityConfig.getConfig().getRoleById(user.getUserRole()&31);
			    		if(role==null){
			    			role = SecurityConfig.getConfig().getRoleById(DlogRole.ROLE_COMMON);
			    			user.setUserRole(DlogRole.ROLE_COMMON);
			    			ssn.update(user);
			    		}
			    		user.setRole(role);
			    		//保存用户资料到会话
			    		user.saveLoginUser(request);
			    		//用户登录跟踪
			    		LoginTrackBean ltb = new LoginTrackBean(request);
			    		ssn.save(ltb);
			    		commitSession(ssn,false);
			    	}
			    	else
						es.add("login",new ActionError("password_error"));
			    }
			    else
					es.add("login",new ActionError("loginName_noexits"));
			}
			else
				es.add("login",new ActionError("loginName_error"));
		}catch(Exception e){
			getServlet().log("用户登录失败",e);
		} finally {			
			closeSession(ssn);
		}
		String curPage = request.getParameter("curPage");
		ActionForward forward = null;
		if(!es.isEmpty()){
			//如果失败返回输入页，登录页对应的输入页是首页
			forward = mapping.getInputForward();
			saveErrors(request, es);
		}
		else{
			if(firstLogin)
				forward = mapping.findForward("catmgr");
			else{
				if(StringUtils.isEmpty(curPage))
					forward = mapping.findForward("home");		
				else
					forward = new ActionForward(curPage,true);
			}
		}
		return forward;
	}
	/**
	* 用户注销
	*/
	public ActionForward doLogout(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
	    HttpSession ssn = request.getSession(false);
	    if(ssn!=null) {
	    	UserForm.removeFromSession(request);
	        //ssn.invalidate();(如果使session失效则连currentSite也获取不到)
	    }
		return mapping.findForward("home");
	}
	/** 
	 * Method execute
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doDefault(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
		return mapping.findForward(HOME_PAGE);
	}

}
