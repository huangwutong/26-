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

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.htmlparser.Node;
import org.htmlparser.Parser;
import org.htmlparser.tags.TitleTag;
import org.htmlparser.util.NodeIterator;

import dlog4j.Globals;
import dlog4j.SiteManager;
import dlog4j.UserManager;
import dlog4j.blog.BlogTrackBack;
import dlog4j.blog.TrackBackResp;
import dlog4j.formbean.BookMarkBean;
import dlog4j.formbean.CategoryForm;
import dlog4j.formbean.DraftForm;
import dlog4j.formbean.LogForm;
import dlog4j.formbean.LoginTrackBean;
import dlog4j.formbean.ReplyForm;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;
import dlog4j.search.SearchProxy;
import dlog4j.security.DlogRole;
import dlog4j.security.SecurityConfig;
import dlog4j.util.RequestUtils;
import dlog4j.util.mail.Mailer;


/** 
 * DlogAction.java created by EasyStruts - XsltGen.
 * http://easystruts.sf.net
 * created on 02-06-2004
 * 
 * XDoclet definition:
 * @struts:action validate="true"
 * @struts:action-forward name="/calendar.jsp" path="/calendar.jsp"
 * @struts:action-forward name="/log_comment.jsp" path="/log_comment.jsp"
 * @struts:action-forward name="/comment.jsp" path="/comment.jsp"
 * @struts:action-forward name="/log_category.jsp" path="/log_category.jsp" redirect="true"
 */
public class DlogLogAction extends DlogActionBase {

    public final static String PARAM_DRAFT = "draft_id";
	// --------------------------------------------------------- Instance Variables
	static String uploadDir = null;
	static String MODIFY_APPEND_FORMAT = "MODIFY_APPEND_FORMAT";
	// --------------------------------------------------------- Methods

	/**
	 * 删除日记的书签
	 */
	public ActionForward doDeleteBookMark(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response,
		String mark_id)
		throws Exception {
		Session ssn = null;
		//判断用户是否已登录
		ActionErrors msgs = new ActionErrors();
		UserForm user =	UserForm.getLoginUser(request);
		if(user!=null && user.isLogin())
		try{
			ssn = getSession();
			SiteForm site = SiteManager.getCurrentSite(request);
			int markid = Integer.parseInt(mark_id);
			BookMarkBean bmb = (BookMarkBean)ssn.load(BookMarkBean.class,new Integer(markid));
			if(bmb.getUser().getId()!=user.getId())
			    msgs.add("bookmark",new ActionError("operation_not_allow"));
			else 
			    ssn.delete(bmb);
		}catch(HibernateException e) {
		}catch(NumberFormatException e) {//如果解析参数错误不理会
		}finally{
			commitSession(ssn,true);
		}
		ActionForward forward = new ActionForward(mapping.findForward("bookmark").getPath(), false);
		if(!msgs.isEmpty())
		    this.saveErrors(request,msgs);	
		else
			forward.setRedirect(true);
	    
	    return forward;	    
	}
	/**
	 * 添加日记的书签
	 */
	public ActionForward doAddBookMark(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response,
		String log_id)
		throws Exception {
		Session ssn = null;
		//判断用户是否已登录
		ActionErrors msgs = new ActionErrors();
		UserForm user =	UserForm.getLoginUser(request);
		if(user!=null && user.isLogin())
		try{
			ssn = getSession();
			SiteForm site = SiteManager.getCurrentSite(request);
			int logid = Integer.parseInt(log_id);
			LogForm log = new LogForm();
			log.setId(logid);
			//判断书签是否已经存在
			String hql = "SELECT COUNT(b.id) FROM "+BookMarkBean.class.getName()+" AS b WHERE b.site.id=? AND b.log.id=? AND b.user.id=?";
			Query q = ssn.createQuery(hql);
			q.setInteger(0,site.getId());
			q.setInteger(1,logid);
			q.setInteger(2,user.getId());		
			int uc = 0;
			try {
				uc = ((Integer)q.list().get(0)).intValue();
			}catch(Exception e) {}
			if(uc==0) {
			    BookMarkBean bmb = new BookMarkBean(site,user,log);
			    bmb.setCreateTime(new Date());
			    bmb.setType(BookMarkBean.BM_LOG);
			    ssn.save(bmb);
			    msgs.add("bookmark",new ActionError("bookmark.addok"));
			}
			else
			    msgs.add("bookmark",new ActionError("bookmark.exits"));
		}catch(NumberFormatException e) {//如果解析参数错误不理会
		}finally{
			commitSession(ssn,true);
		}

		ActionForward forward = new ActionForward(mapping.findForward("showlog").getPath(), false);
		if(!msgs.isEmpty())
		    this.saveErrors(request,msgs);
		else
			forward.setRedirect(true);
	    
	    return forward;
	}
	/** 
	 * 添加评论
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doAddReply(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
		ReplyForm reply = (ReplyForm)form;
		Session ssn = null;
		//判断用户是否已登录
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("password");
		if(loginName!=null && password!=null){
			ActionErrors es = new ActionErrors();
			if(StringUtils.isEmpty(loginName))
				es.add("updateReply",new ActionError("user_not_login"));
			else{
				//检查用户名口令是否正确
				ssn = getSession();
			    UserForm user = UserManager.getUser(ssn,SiteManager.getCurrentSite(request),loginName);
			    //检查用户名是否存在
			    if(user!=null) {
			    	//检查用户是否被暂停
					if(user.getUserRole()==DlogRole.ROLE_GUEST)
						es.add("updateReply",new ActionError("user_pause"));	
			    	//检查密码
					else
			    	if(StringUtils.equals(user.getPassword(),password)){
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
			    		commitSession(ssn,true);
			    	}
			    	else
						es.add("updateReply",new ActionError("password_error"));
			    }
			    else
					es.add("updateReply",new ActionError("loginName_noexits"));
			}
		    
		    if(!es.isEmpty()){
		    	saveErrors(request, es);
		    	return mapping.getInputForward();
		    }
		}
		UserForm loginUser = UserForm.getLoginUser(request);
		if(loginUser!=null && loginUser.isLogin())
		try{
			ssn = getSession();
			SiteForm site = SiteManager.getCurrentSite(request);
			//如果是同一个人同一个内容的就不给添加
			String hql = "FROM "+ReplyForm.class.getName()+" AS r WHERE r.site.id=? AND r.author.id=? AND r.log.id=?";
			Query q = ssn.createQuery(hql);
			q.setInteger(0,site.getId());
			q.setInteger(1, loginUser.getId());
			q.setInteger(2,reply.getLogId());
			List rs = q.list();
			boolean bNew = true;
			for(int i=0;i<rs.size();i++) {
			    ReplyForm r = (ReplyForm)rs.get(i);
			    if(r.getContent().equals(reply.getContent())) {
			        bNew = false;
			        break;
			    }
			}
			rs.clear();
			if(bNew) {
			    reply.setAuthor(loginUser);
			    reply.setWriteTime(new Date());
			    reply.setSite(site);
			    ssn.save(reply);
			    int logid = reply.getLogId();
			    LogForm log = (LogForm)ssn.load(LogForm.class, new Integer(logid));
			    log.setReplyCount(log.getReplyCount()+1);
			    ssn.update(log);
			    //根据设置判断是否发送邮件提醒
			    if(1==log.getReplyNotify()){
			    	if(StringUtils.isEmpty(log.getOwner().getEmail())){
			    		getServlet().log("***** The email of Author is empty or illegal. *****");
			    	}			    	
			    	else if(!StringUtils.equals(log.getOwner().getLoginName(),reply.getAuthor().getLoginName()))
			    	{			    		
			    		try{
			    			Mailer sender = Mailer.getMailer();
			    			String url = site.getUrl()+"/showlog.jspe?log_id="+log.getId()+"#"+reply.getId();
			    			String curTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
			    			String replyUser = loginUser.getDisplayName();
			    			if(StringUtils.isNotEmpty(loginUser.getEmail())){
			    				StringBuffer link = new StringBuffer();
			    				link.append("<a href=\"mailto:");
			    				link.append(loginUser.getEmail());
			    				link.append("\">");
			    				link.append(replyUser);
			    				link.append("</a>");
			    				replyUser = link.toString();
			    			}
			    			String[] args = {log.getOwner().getDisplayName(),
			    						 	 log.getTitle(),
											 replyUser,
											 url,
											 curTime,
											 reply.getContent()};
			    			String template = getContentTemplate();
			    			String content = MessageFormat.format(template, args);
			    			Parser html = Parser.createParser(new String(content.getBytes(),"8859_1"));
			    			Node[] nodes = html.extractAllNodesThatAre(TitleTag.class);
			    			String title = nodes[0].toPlainTextString();
			    			sender.send(site.getDisplayName(),
			    						new String[]{log.getOwner().getEmail()},
										title,
										content);
			    		}catch(Exception e){
			    			getServlet().log("Send reply notification failed.",e);
			    		}
			    	}
			    }
			}
		}finally{
			commitSession(ssn,true);
			reply.reset(mapping,request);
		}
		else{			
			return mapping.findForward("fail_to_reply");
		}
		StringBuffer forward = new StringBuffer();
		forward.append(mapping.getInput());
		forward.append("?log_id=");
		forward.append(reply.getLogId());
		if(reply.getLog().getCategoryId()!=-1){
			forward.append("&cat_id=");
			forward.append(reply.getLog().getCategoryId());
		}
		forward.append('#');
		forward.append(reply.getId());
		return new ActionForward(forward.toString(), true);
	}
	/** 
	 * 修改评论
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doDeleteReply(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response,
		String reply_id)
		throws Exception {
	    int rid = -1;
	    try {
	        rid = Integer.parseInt(reply_id);	        
	    }catch(Exception e) {}
	    int logid = -1;
	    if(rid!=-1) {
			Session ssn = null;
			//判断用户是否已登录
			UserForm user =	UserForm.getLoginUser(request);
			if(user!=null && user.isLogin())
			try{
				ssn = getSession();
				ReplyForm old = (ReplyForm)ssn.load(ReplyForm.class,new Integer(rid));
				logid = old.getLogId();
				if(!user.isAdmin() && old.getAuthorId()!=user.getId()) {
					ActionErrors errors = new ActionErrors();
					errors.add("updateReply",new ActionError("operation_not_allow"));
					if(!errors.isEmpty())
					    saveErrors(request,errors);
				}
				else {				    
				    ssn.delete(old);
				    LogForm log = (LogForm)ssn.load(LogForm.class, new Integer(logid));
				    log.setReplyCount(log.getReplyCount()-1);
				    ssn.update(log);
					SearchProxy proxy = SearchProxy.getReplyQuery();
					proxy.deleteIndex(new int[] {old.getId()});
				}
			}catch(HibernateException e) {
			}finally{
				commitSession(ssn,true);
			}	        
	    }
	    StringBuffer url = new StringBuffer(100);
	    url.append(mapping.getInput());
	    url.append('?');
	    if(logid>0) {
	        url.append("&log_id=");
	        url.append(logid);
	    }
	    String user_id = request.getParameter(Globals.PARAM_USER);
	    if(user_id!=null) {
	        url.append("&userid=");
	        url.append(user_id);	        
	    }
	    String page = request.getParameter("page");
	    if(page!=null) {
	        url.append("&page=");
	        url.append(page);
	    }
		return new ActionForward(url.toString(), true);
	}
	/** 
	 * 修改评论
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doUpdateReply(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
		ReplyForm reply = (ReplyForm)form;
		Session ssn = null;
		//判断用户是否已登录
		UserForm user =	UserForm.getLoginUser(request);
		if(user!=null && user.isLogin())
		try{
			ssn = getSession();
			ReplyForm old = (ReplyForm)ssn.load(ReplyForm.class,new Integer(reply.getId()));
			if(!user.isAdmin() && old.getAuthorId()!=user.getId()) {
				ActionErrors errors = new ActionErrors();
				errors.add("updateReply",new ActionError("operation_not_allow"));
				if(!errors.isEmpty())
				    saveErrors(request,errors);
			}
			else {
				boolean needModifier = true;
				if(old.getAuthor().getId()==user.getId()){
					long ct = System.currentTimeMillis();
					long interval = (ct - old.getWriteTime().getTime())/3600000;
					if(interval < 2)
						needModifier = false;
				}
				if(needModifier){
				    String append_text = getModifyAppendMessage(request,
				    		reply.getShowFormerly()!=1,
							user.getLoginName(),
							user.getDisplayName());
				    old.setContent(reply.getContent() + append_text);
				}
				else
					old.setContent(reply.getContent());
			    old.setShowFormerly(reply.getShowFormerly());
			    ssn.update(old);
				SearchProxy proxy = SearchProxy.getReplyQuery();
				proxy.updateIndex(old);
			}
		}catch(HibernateException e) {
		}finally{
			commitSession(ssn,true);
		}
		else
			return mapping.findForward("fail_to_reply");
		StringBuffer forward = new StringBuffer();
		forward.append(mapping.getInput());
		forward.append("?log_id=");
		forward.append(reply.getLogId());
		forward.append("&cat_id=");
		forward.append(reply.getLog().getCategoryId());		
		forward.append('#');
		forward.append(reply.getId());
		return new ActionForward(forward.toString(), true);
	}
	/**
	 * 根据编辑模式决定如何处理修改戳
	 * @param req
	 * @param html
	 * @param userName
	 * @return
	 */
	protected String getModifyAppendMessage(HttpServletRequest req, boolean html, String loginName,String userName) {
	    Object[] args = new String[] {Globals.FORMAT_DT.format(new Date()),loginName,userName};
	    String append_text = getResources(req).getMessage(req.getLocale(),MODIFY_APPEND_FORMAT,args);
	    if(!html) {
	        try {
	            Parser p = Parser.createParser(new String(append_text.getBytes(),"8859_1"));
	            NodeIterator nodes = p.elements();
	            while(nodes.hasMoreNodes()) {
	                Node node = nodes.nextNode();
	                append_text = node.toPlainTextString().trim();
	                append_text = "\r\n\r\n"+new String(StringUtils.replace(append_text,"&nbsp;"," ").getBytes("8859_1"));
	                break;
	            }
	        }catch(Exception e) {}
	    }
	    return append_text;
	}
	
	/** 
	 * 日志删除
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doDeleteLog(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {

		String forward = "home";
		LogForm log = (LogForm) form;
		//判断用户是否已登录
		UserForm user =	UserForm.getLoginUser(request);
		if (user != null && user.isLogin()) {
			Session ssn = getSession();
			LogForm old = (LogForm) ssn.load(LogForm.class, new Integer(log.getId()));
			if(old!=null)
			try {
				old.setStatus(LogForm.STATUS_DELETED);
				old.setDeleteTime(new Date());
				ssn.update(old);
				SearchProxy proxy = SearchProxy.getLogQuery();
				proxy.deleteIndex(new int[] {old.getId()});
			} finally {
				commitSession(ssn, true);
			}
		}
		return new ActionForward(mapping.findForward(forward).getPath()+"?cat_id="+log.getCategoryId(), true);
	}
	/** 
	 * 删除草稿
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doDeleteDraft(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {

		String forward = "draft";
		LogForm log = (LogForm) form;
		//判断用户是否已登录
		UserForm user =	UserForm.getLoginUser(request);
		
		if (user != null && user.isLogin() && (user.isAdmin() || user.isFriend())) {
		    Session ssn = null;
			try {
			    ssn = getSession();
			    int draft_id = Integer.parseInt(request.getParameter(PARAM_DRAFT));
			    DraftForm draft = (DraftForm)ssn.load(DraftForm.class,new Integer(draft_id));
				ssn.delete(draft);
			} finally {
				commitSession(ssn, true);
			}
		} else
			forward = "home";
		return mapping.findForward(forward);
	}
	/** 
	 * 更新草稿
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doUpdateDraft(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {

		String forward = "draft";
		LogForm log = (LogForm) form;
		//判断用户是否已登录
		UserForm user = UserForm.getLoginUser(request);
		if(user==null||!user.isLogin())
		    forward = "home";
		else
		if (user.isAdmin() || user.isFriend()) {
		    Session ssn = null;
			try {
			    ssn = getSession();
			    int draft_id = Integer.parseInt(request.getParameter(PARAM_DRAFT));
			    DraftForm draft = (DraftForm)ssn.load(DraftForm.class,new Integer(draft_id));
			    if(!user.isAdmin() && draft.getOwner().getId()!=user.getId()) {
					ActionErrors errors = new ActionErrors();
					errors.add("updateDraft",new ActionError("operation_not_allow"));
					if(!errors.isEmpty())
					    saveErrors(request,errors);
			    }
			    else {
			        draft.setAuthor(log.getAuthor());
			        draft.setAuthorUrl(log.getAuthorUrl());
			        draft.setContent(log.getContent());
			        draft.setLogTime(new Date());
			        draft.setMoodLevel(log.getMoodLevel());
			        draft.setOwner(user);
			        draft.setRefUrl(log.getRefUrl());
			        draft.setShowFormerly(log.getShowFormerly());
			        draft.setSite(SiteManager.getCurrentSite(request));
			        draft.setTitle(log.getTitle());
			        draft.setUseFace(log.getUseFace());
			        draft.setUseUbb(log.getUseUbb());
			        draft.setWeather(log.getWeather());
			        ssn.update(draft);
			    }
			} finally {
				commitSession(ssn, true);
			}
		} else
			forward = "home";
		return mapping.findForward(forward);
	}
	/** 
	 * 日志保存为草稿
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doSaveDraft(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {

		String forward = "draft";
		LogForm log = (LogForm) form;
		//判断用户是否已登录
		UserForm user =	UserForm.getLoginUser(request);
		
		if (user != null && user.isLogin() && (user.isAdmin() || user.isFriend())) {
		    Session ssn = null;
		    DraftForm draft = new DraftForm();
		    draft.setAuthor(log.getAuthor());
		    draft.setAuthorUrl(log.getAuthorUrl());
		    draft.setContent(log.getContent());
		    draft.setLogTime(new Date());
		    draft.setMoodLevel(log.getMoodLevel());
		    draft.setOwner(user);
		    draft.setRefUrl(log.getRefUrl());
		    draft.setShowFormerly(log.getShowFormerly());
		    draft.setSite(SiteManager.getCurrentSite(request));
		    draft.setTitle(log.getTitle());
		    draft.setUseFace(log.getUseFace());
		    draft.setUseUbb(log.getUseUbb());
		    draft.setWeather(log.getWeather());
			try {
			    ssn = getSession();
				ssn.save(draft);
			} finally {
				commitSession(ssn, true);
			}
		} else{
			forward = "fail_to_save";
		}
		return mapping.findForward(forward);
	}
	/** 
	 * 日志修改
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doEditLog(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {

		String forward = "showlog";
		LogForm log = (LogForm) form;
		//判断用户是否已登录
		UserForm user =	UserForm.getLoginUser(request);
		
		if (user != null && user.isLogin()) {
			Session ssn = getSession();
			LogForm old = (LogForm) ssn.load(LogForm.class, new Integer(log.getId()));
			old.setTitle(log.getTitle());
			boolean needModifier = true;
			if(old.getOwner().getId()==user.getId()){
				long ct = System.currentTimeMillis();
				long interval = (ct - old.getLogTime().getTime())/3600000;
				if(interval < 6)
					needModifier = false;
			}
			if(needModifier){
				String append_text = getModifyAppendMessage(request,log.getShowFormerly()!=1,
						user.getLoginName(),user.getDisplayName());
				old.setContent(log.getContent()+append_text);
			}
			else
				old.setContent(log.getContent());
			old.setAuthor(log.getAuthor());
			old.setAuthorUrl(log.getAuthorUrl());
			old.setMoodLevel(log.getMoodLevel());
			old.setRefUrl(log.getRefUrl());
			old.setWeather(log.getWeather());
			old.setUseUbb(log.getUseUbb());
			old.setUseFace(log.getUseFace());
			old.setShowFormerly(log.getShowFormerly());
			old.setSearchKey(log.getSearchKey());
			old.setReplyNotify(log.getReplyNotify());
			if (log.getCategoryId() != old.getCategoryId()) {
				CategoryForm cat =
					(CategoryForm) ssn.load(
						CategoryForm.class,
						new Integer(log.getCategoryId()));
				old.setCategory(cat);
			}

			try {
				ssn.update(old);
				SearchProxy proxy = SearchProxy.getLogQuery();
				proxy.updateIndex(old);
			} finally {
				commitSession(ssn, true);
			}
		} else{
			return mapping.findForward("fail_to_save");
		}
		return new ActionForward(mapping.findForward(forward).getPath()+"?log_id=" + log.getId(),true);
	}
	/** 
	 * 日志添加
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doAddLog(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {

		String forward = "home";
		LogForm log = (LogForm) form;
		//判断用户是否已登录
		UserForm user = UserForm.getLoginUser(request);

		if (user!=null && user.isLogin()) {
			log.setOwner(user);
			if (log.getLogTime() == null)
				log.setLogTime(new Date());
			Session ssn = getSession();
			try {
				SiteForm site = SiteManager.getCurrentSite(request);
				log.setSite(site);
				ssn.save(log);
				int draftId = -1;
				try {
				    draftId = Integer.parseInt(request.getParameter(PARAM_DRAFT));
				}catch(Exception e) {}
				if(draftId!=-1) {
				    DraftForm  draft = (DraftForm)ssn.load(DraftForm.class,new Integer(draftId));
				    if(draft!=null)
				        ssn.delete(draft);
				}
				//判断是否添加书签
				if("1".equals(request.getParameter("bookmark"))) {
				    BookMarkBean bmb = new BookMarkBean(log.getSite(),user,log);
				    bmb.setCreateTime(new Date());
				    bmb.setType(BookMarkBean.BM_LOG);
				    ssn.save(bmb);
				}
				if(StringUtils.isNotEmpty(log.getRefUrl())){
					//启动TrackBack线程
					final LogForm logForm = log;
					final SiteForm siteForm = site;
					final String log_url = RequestUtils.getBaseURL(request);
					final Action action = this;
					new Thread(){
						public void run(){
							try{
								TrackBackResp resp = BlogTrackBack.track(logForm.getRefUrl(), 
									log_url+"/showlog.jspe?log_id="+logForm.getId(), 
									siteForm.getDisplayName(), 
									logForm.getTitle(), 
									"");
							}catch(Exception e){
								action.getServlet().log("TrackBack Failed. url="+logForm.getRefUrl(),e);
							}
						}
					}.start();
				}
			} finally {
				commitSession(ssn, true);
			}
		}
		else{
			//用户在操作时会话已经超时，显示刚才添加的信息给用户避免丢失。
			return mapping.findForward("fail_to_save");
		}
		return new ActionForward(mapping.findForward(forward).getPath()+"?cat_id="+log.getCategoryId(),true);
	}

	/**
	 * 得到一个唯一的文件名
	 * @param extName
	 * @return
	 */
	protected String getUniqueFileName(String extName) {
		final SimpleDateFormat sdf =
			new SimpleDateFormat("yyyyMMddHHmmssSSSS.");
		String fn = null;
		do {
			fn = sdf.format(new Date()) + extName;
			if (new File(uploadDir + fn).exists())
				continue;
			break;
		} while (true);
		return fn;
	}
	/**
	 * 获取文件的扩展名
	 * @param file
	 * @return
	 */
	protected static String getFileExtendName(String file) {
		int idx = file.lastIndexOf('.');
		return (idx == -1 || idx == (file.length() - 1))
			? ""
			: file.substring(idx + 1).toLowerCase();
	}
	/**
	 * 获取上传文件保存的目录全路径
	 * @return
	 */
	protected String getUploadDir() {
		String path = servlet.getServletContext().getInitParameter("uploadDir");
		if (path == null)
			path = "uploads";
		String webpath = servlet.getServletContext().getRealPath(path);
		if (webpath.endsWith(File.separator))
			webpath += File.separator;
		return webpath;
	}
	public static void main(String[] args) {
		//System.out.println("EXTEND:"+getUniqueFileName("jpg"));
	}
	/**
	 * 获得忘记密码提示内容的模板
	 * @return
	 * @throws IOException
	 */
	protected String getContentTemplate() throws IOException{
		ServletContext sc = getServlet().getServletContext();
		InputStream in = sc.getResourceAsStream("/WEB-INF/template/reply_tip.html");
		StringBuffer template = new StringBuffer(512);
		BufferedReader reader = null;
		try{
			reader = new BufferedReader(new InputStreamReader(in));
			do{
				String line = reader.readLine();
				if(line==null)
					break;
				template.append(line);
				template.append("\r\n");
			}while(true);
		}finally{
			in.close();
		}
		return template.toString();
	}
}
