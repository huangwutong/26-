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
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dlog4j.CategoryManager;
import dlog4j.LogManager;
import dlog4j.SiteManager;
import dlog4j.formbean.CategoryForm;
import dlog4j.formbean.SiteForm;

/**
 * @author Liang.xf 2004-2-22 informix
 *  
 */
public class DlogCategoryAction extends AdminActionBase {

	public final static String SUCCESS_LIST_PAGE = "success";
	public final static String LIST_ERROR_KEY = "list";
	public final static String EDIT_ERROR_KEY = "edit";
	/**
	 * 修改日记分类
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @param cat_id
	 * @return
	 * @throws Exception
	 */
	public ActionForward doEditCategory(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception 
	{
		ActionErrors errors = new ActionErrors();
		
		CategoryForm cat = (CategoryForm)form;
		Session ssn = null;
		try {
		    ssn = getSession();
		    SiteForm site = SiteManager.getCurrentSite(request);
		    CategoryForm old = CategoryManager.getCategory(ssn,site,cat.getId());
		    if(old!=null) {
		        old.setName(cat.getName());
		        old.setType(cat.getType());
		        ssn.update(old);
		    }
		} catch(SQLException e) {
		    errors.add(EDIT_ERROR_KEY,new ActionError("database_exception"));
		} catch(HibernateException e) {
		    errors.add(EDIT_ERROR_KEY,new ActionError("hibernate_exception"));
		} finally {
			commitSession(ssn, true);
		}
		if (!errors.isEmpty())
		    saveErrors(request, errors);				
		ActionForward forward = mapping.getInputForward();
		forward.setRedirect(true);
		return forward;
	}
	/**
	 * 创建日记分类
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @param cat_id
	 * @return
	 * @throws Exception
	 */
	public ActionForward doCreateCategory(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception 
	{
		ActionErrors errors = new ActionErrors();
		
		CategoryForm cat = (CategoryForm)form;
		Session ssn = null;
		try {
		    ssn = getSession();
		    SiteForm site = SiteManager.getCurrentSite(request);
		    cat.setSite(site);
		    List categories = CategoryManager.listCategories(ssn,site);
		    int position = 1;
		    try {//默认插在最后
		    	position = Integer.parseInt(request.getParameter("position"));
		    }catch(Exception e) {}
		    int catid = cat.getOrder();//插在该位置的之前或者之后
		    //智能顺序选择
		    if(cat.getOrder()==-1) {
		        if(categories.size()==0)
		            cat.setOrder(1);
		        else
		            cat.setOrder(((CategoryForm)categories.get(categories.size()-1)).getOrder()+1);
		    }
		    else
		    for(int i=0;i<categories.size();i++) {
		        CategoryForm c = (CategoryForm)categories.get(i);
		        if(c.getId()==catid) {
		            if(position>0) {//插在这之后
		                if(i==(categories.size()-1)) {//当前已经是最后一个位置了
		                    cat.setOrder(((CategoryForm)categories.get(i)).getOrder()+1);
		                    break;
		                }
		                cat.setOrder(((CategoryForm)categories.get(i)).getOrder()+1);
		                if(cat.getOrder()==((CategoryForm)categories.get(i+1)).getOrder()) {
		                    for(int j=i+1;j<categories.size();j++) {
		                        CategoryForm cf = (CategoryForm)categories.get(j);
		                        cf.setOrder(cf.getOrder()+1);
		                        ssn.update(cf);
		                    }
		                }
		            }
		            else {//插在这之前
		                CategoryForm cur = (CategoryForm)categories.get(i);
		                if(i>0) {
		                    if((cur.getOrder()-1)>((CategoryForm)categories.get(i-1)).getOrder()) {
		                        cat.setOrder(cur.getOrder()-1);
		                        break;
		                    }
		                }
		                cat.setOrder((cur).getOrder());
		                for(int j=i;j<categories.size();j++) {
		    		        CategoryForm cf = (CategoryForm)categories.get(j);
		    		        cf.setOrder(cf.getOrder()+1);
		    		        ssn.update(cf);		                    
		                }		                
		            }
		            break;
		        }
		    }		    
		    ssn.save(cat);
		} catch(SQLException e) {
		    errors.add(EDIT_ERROR_KEY,new ActionError("database_exception"));
		} catch(HibernateException e) {
		    errors.add(EDIT_ERROR_KEY,new ActionError("hibernate_exception"));
		} finally {
			commitSession(ssn, true);
		}
		
		if (!errors.isEmpty())
		    saveErrors(request, errors);				
		ActionForward forward = mapping.getInputForward();
		forward.setRedirect(true);
		return forward;
	}
	/**
	 * 日记分类排序,向上一个位置
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
			String cat_id)
			throws Exception {
		ActionErrors errors = new ActionErrors();
		Session session = null;
		try {
		    session = getSession();
		    int catid = Integer.parseInt(cat_id);
		    SiteForm site = SiteManager.getCurrentSite(request);
		    List categories = CategoryManager.listCategories(session,site);
		    int i;
		    for(i=0;i<categories.size();i++) {
		        CategoryForm cat = (CategoryForm)categories.get(i);
		        if(cat.getId()==catid) {
		            break;
		        }
		    }
		    if(i==categories.size())
		        errors.add(LIST_ERROR_KEY,new ActionError("category_not_found"));
		    int next_idx = i+1;
		    int me_idx = i;
		    if(next_idx<categories.size()) {
		        CategoryForm me = (CategoryForm)categories.get(me_idx);
		        CategoryForm front = (CategoryForm)categories.get(next_idx);
		        //交换order值
		        int temp = me.getOrder();
		        me.setOrder(front.getOrder());
		        front.setOrder(temp);
		        session.update(me);
		        session.update(front);
		    }
		} catch(SQLException e) {
		    errors.add(LIST_ERROR_KEY,new ActionError("database_exception"));
		} catch(HibernateException e) {
		    errors.add(LIST_ERROR_KEY,new ActionError("hibernate_exception"));
		} finally {
			commitSession(session, true);
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
	 * 日记分类排序,向下一个位置
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
			String cat_id)
			throws Exception 
	{
		ActionErrors errors = new ActionErrors();
		Session session = null;
		try {
		    session = getSession();
		    int catid = Integer.parseInt(cat_id);
		    SiteForm site = SiteManager.getCurrentSite(request);
		    List categories = CategoryManager.listCategories(session,site);
		    int i;
		    for(i=0;i<categories.size();i++) {
		        CategoryForm cat = (CategoryForm)categories.get(i);
		        if(cat.getId()==catid) {
		            break;
		        }
		    }
		    if(i==categories.size())
		        errors.add(LIST_ERROR_KEY,new ActionError("category_not_found"));
		    int front_idx = i-1;
		    int me_idx = i;
		    if(front_idx>=0) {
		        CategoryForm me = (CategoryForm)categories.get(me_idx);
		        CategoryForm front = (CategoryForm)categories.get(front_idx);
		        //交换order值
		        int temp = me.getOrder();
		        me.setOrder(front.getOrder());
		        front.setOrder(temp);
		        session.update(me);
		        session.update(front);
		    }
		} catch(SQLException e) {
		    errors.add(LIST_ERROR_KEY,new ActionError("database_exception"));
		} catch(HibernateException e) {
		    errors.add(LIST_ERROR_KEY,new ActionError("hibernate_exception"));
		} finally {
			commitSession(session, true);
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
	 * 删除日记分类
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @param cat_id
	 * @return
	 * @throws Exception
	 */
	public ActionForward doDeleteCategory(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response,
			String cat_id)
			throws Exception {

    		ActionErrors errors = new ActionErrors();
			Session session = null;
			try {
			    session = getSession();
			    int catid = Integer.parseInt(cat_id);
			    SiteForm site = SiteManager.getCurrentSite(request);
			    CategoryForm cat = CategoryManager.getCategory(session,site,catid);
			    if(cat!=null) {
			        int logcount = LogManager.getLogCount(session,catid);
			        if(logcount>0)//还有日记不允许删除
					    errors.add(LIST_ERROR_KEY,new ActionError("logs_not_empty"));				        
			        else{
			            session.delete(cat);
			            commitSession(session, false);
			        }
			    }
			    else 
				    errors.add(LIST_ERROR_KEY,new ActionError("category_not_found"));
			} catch(HibernateException e) {
			    errors.add(LIST_ERROR_KEY,new ActionError("hibernate_exception"));				    
			} catch(SQLException e) {
			    errors.add(LIST_ERROR_KEY,new ActionError("database_exception"));
			} finally {
				closeSession(session);
			}
			// Report any errors we have discovered back to the original form
			if (!errors.isEmpty())
			    saveErrors(request, errors);				
			ActionForward forward = mapping.getInputForward();
			if(errors.isEmpty())
				forward.setRedirect(true);
			return forward;
		}
	/**
	 * 增加Category
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return @throws
	 *         Exception
	 */
	public ActionForward doAddCat(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {

		Session session = getSession();
		CategoryForm cat = (CategoryForm) form;
		try {
			cat.setSite(SiteManager.getCurrentSite(request));
			session.save(cat);
		} catch (Exception e) {
			System.out.println("error when save Category: " + e);
		} finally {
			commitSession(session, true);
		}
		return mapping.findForward(SUCCESS_LIST_PAGE);
	}

	/**
	 * 获取某个分类的详细资料信息
	 * 
	 * @param ssn
	 * @param userid
	 * @param withDetails
	 * @return @throws
	 *         HibernateException
	 */
	public static CategoryForm getUser(
		Session ssn,
		int catid,
		boolean withDetails)
		throws HibernateException {
		CategoryForm cat =
			(CategoryForm) ssn.load(CategoryForm.class, new Integer(catid));

		return cat;
	}
}
