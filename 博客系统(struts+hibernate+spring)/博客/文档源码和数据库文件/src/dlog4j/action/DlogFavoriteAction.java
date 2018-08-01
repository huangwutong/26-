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

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.Criteria;
import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.expression.Order;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dlog4j.SiteManager;
import dlog4j.formbean.FavoriteForm;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;

/**
 * 网站链接的操作类
 * @author Winter Lau
 */
public class DlogFavoriteAction extends AdminActionBase {

	public ActionForward doDefault(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
		return mapping.findForward("links");
	}
	/**
	 * 添加链接
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward doCreate(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception 
	{
		ActionErrors errors = new ActionErrors();		
		FavoriteForm link = (FavoriteForm)form;
		Session ssn = null;

	    int position = 1;
	    try {//默认插在最后
	    	position = Integer.parseInt(request.getParameter("position"));
	    }catch(Exception e) {}
	    
	    int fav_id = link.getOrder();
	    
		try {
		    ssn = getSession();
		    FavoriteForm fav = null;
		    int order = 1;
		    String hql = "FROM "+FavoriteForm.class.getName()+" AS f WHERE f.id=? ORDER BY f.order";
		    Query q = ssn.createQuery(hql);
		    q.setInteger(0, fav_id);
		    List res = q.list();
		    int pos = (position>0)?1:0;
		    for(int i=0;i<res.size();i++){
		    	FavoriteForm tmp_fav = (FavoriteForm)res.get(i);
		    	if(tmp_fav.getId()==fav_id){
		    		if((i+position)<res.size()){
		    			FavoriteForm tmp_fav2 = (FavoriteForm)res.get(i+pos);
		    			order = tmp_fav2.getOrder();
		    		}
		    		else
		    			order = tmp_fav.getOrder()+ pos;
		    		break;
		    	}
		    	order = tmp_fav.getOrder() + 1;
		    }
		    
		    //UPDATE the order then insert the new link
		    String update_sql = "UPDATE dlog_favorite SET sortOrder=sortOrder+1 WHERE sortOrder>=?";
		    Connection conn = null;
		    PreparedStatement ps = null;
		    try{
		    	conn = getConnection();
		    	ps = conn.prepareStatement(update_sql);
		    	ps.setInt(1, order);
		    	ps.executeUpdate();
		    }finally{
		    	close(null,ps,conn);
		    }
		    //insert the new link
		    link.setCreateTime(new Date());
		    link.setSite(SiteManager.getCurrentSite(request));
		    link.setOrder(order);
		    ssn.save(link);
		} catch(SQLException e) {
			servlet.log("DlogFavoriteAction.doCreate",e);
		    errors.add("create",new ActionError("database_exception"));
		} catch(HibernateException e) {
			servlet.log("DlogFavoriteAction.doCreate",e);
		    errors.add("create",new ActionError("hibernate_exception"));
		} finally {
			commitSession(ssn, true);
		}				
		ActionForward forward = mapping.getInputForward();
		if (!errors.isEmpty())
		    saveErrors(request, errors);
		else
			forward.setRedirect(true);
		return forward;
	}
	/**
	 * 修改链接
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward doUpdate(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception 
	{
		ActionErrors errors = new ActionErrors();		
		FavoriteForm link = (FavoriteForm)form;
		Session ssn = null;
		try {
		    ssn = getSession();
		    SiteForm site = SiteManager.getCurrentSite(request);
		    FavoriteForm old = (FavoriteForm)ssn.load(FavoriteForm.class, new Integer(link.getId()));
		    if(old!=null) {
		    	old.setUrl(link.getUrl());
		    	old.setTitle(link.getTitle());
		    	old.setOpenInNewWindow(link.getOpenInNewWindow());
		    	old.setMode(link.getMode());
		        ssn.update(old);
		    }
		} catch(SQLException e) {
		    errors.add("edit",new ActionError("database_exception"));
		} catch(HibernateException e) {
		    errors.add("edit",new ActionError("hibernate_exception"));
		} finally {
			commitSession(ssn, true);
		}				
		ActionForward forward = mapping.getInputForward();
		if (!errors.isEmpty())
		    saveErrors(request, errors);
		else
			forward.setRedirect(true);
		return forward;
	}
	/**
	 * 删除链接
	 */
	public ActionForward doDelete(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response,
		String favorite_id)
		throws Exception {
		Session ssn = null;
		try {
			ssn = getSession();
			FavoriteForm link = (FavoriteForm) ssn.load(FavoriteForm.class, new Integer(favorite_id));
			ssn.delete(link);
		} finally {
			if(ssn!=null)
				commitSession(ssn, true);
		}
		return mapping.findForward("links");
	}

	/**
	 * 链接排序,向上一个位置
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @param cat_id
	 * @return
	 * @throws Exception
	 */
	public ActionForward doMoveDown(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response,
			String lnkid)
			throws Exception {
		ActionErrors errors = new ActionErrors();
		Session session = null;
		//判断用户是否登陆
		UserForm user = getLoginUser(request);
		if(user==null || !user.isLogin())
		    errors.add("links",new ActionError("operation_need_login"));
		else if(!user.isAdmin())
		    errors.add("links",new ActionError("only_owner_allow"));
		else{
			try {
			    session = getSession();
			    int linkid = Integer.parseInt(lnkid);
			    SiteForm site = SiteManager.getCurrentSite(request);			    
			    Criteria crit = session.createCriteria(FavoriteForm.class);
			    crit.addOrder(Order.desc("order"));
			    List links = crit.list();
			    int i;
			    for(i=0;i<links.size();i++) {
			    	FavoriteForm link = (FavoriteForm)links.get(i);
			        if(link.getId()==linkid) {
			            break;
			        }
			    }
			    if(i==links.size())
			        errors.add("links",new ActionError("category_not_found"));
			    int next_idx = i-1;
			    int me_idx = i;
			    if(next_idx<links.size()) {
			    	FavoriteForm me = (FavoriteForm)links.get(me_idx);
			    	FavoriteForm front = (FavoriteForm)links.get(next_idx);
			        //交换order值
			        int temp = me.getOrder();
			        me.setOrder(front.getOrder());
			        front.setOrder(temp);
			        session.update(me);
			        session.update(front);
			    }
			} catch(SQLException e) {
			    errors.add("links",new ActionError("database_exception"));
			} catch(HibernateException e) {
			    errors.add("links",new ActionError("hibernate_exception"));
			} finally {
				commitSession(session, true);
			}
		}
		// Report any errors we have discovered back to the original form
		ActionForward forward = mapping.getInputForward();
		if (!errors.isEmpty())
		    saveErrors(request, errors);
		else
			forward.setRedirect(true);
		return forward;
	}
	/**
	 * 链接排序,向下一个位置
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @param cat_id
	 * @return
	 * @throws Exception
	 */
	public ActionForward doMoveUp(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response,
			String lnkid)
			throws Exception 
	{
		ActionErrors errors = new ActionErrors();
		Session session = null;
		//判断用户是否登陆
		UserForm user = getLoginUser(request);
		if(user==null || !user.isLogin())
		    errors.add("links",new ActionError("operation_need_login"));
		else if(!user.isAdmin())
		    errors.add("links",new ActionError("only_owner_allow"));
		else{
			try {
			    session = getSession();
			    int linkid = Integer.parseInt(lnkid);
			    SiteForm site = SiteManager.getCurrentSite(request);
			    Criteria crit = session.createCriteria(FavoriteForm.class);
			    crit.addOrder(Order.desc("order"));
			    List links = crit.list();
			    int i;
			    for(i=0;i<links.size();i++) {
			    	FavoriteForm cat = (FavoriteForm)links.get(i);
			        if(cat.getId()==linkid) {
			            break;
			        }
			    }
				if (i < links.size()) {
					int front_idx = i + 1;
					int me_idx = i;
					if (front_idx >= 0) {
						FavoriteForm me = (FavoriteForm) links.get(me_idx);
						FavoriteForm front = (FavoriteForm) links
								.get(front_idx);
						//交换order值
						int temp = me.getOrder();
						me.setOrder(front.getOrder());
						front.setOrder(temp);
						session.update(me);
						session.update(front);
					}
				}
			} catch(SQLException e) {
			    errors.add("links",new ActionError("database_exception"));
			} catch(HibernateException e) {
			    errors.add("links",new ActionError("hibernate_exception"));
			} finally {
				commitSession(session, true);
			}
		}
		// Report any errors we have discovered back to the original form
		ActionForward forward = mapping.getInputForward();
		if (!errors.isEmpty())
		    saveErrors(request, errors);	
		else
			forward.setRedirect(true);
		return forward;
	}
}
