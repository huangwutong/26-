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

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dlog4j.formbean.SiteForm;
import dlog4j.formbean.TemplateForm;

/**
 * 用于处理个人DLOG的Action类
 * @author Liudong
 */
public class DlogSiteAction extends AdminActionBase {

    public final static String ERROR_KEY = "site";
    

    /**
     * 修改BLOG的模板信息
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
	public ActionForward doUpdateTemplate(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {	    
		ActionErrors errors = new ActionErrors();
		TemplateForm temp = (TemplateForm)form;
		String path = "/WEB-INF/template/" + temp.getFile();
		String realPath = getServlet().getServletContext().getRealPath(path);
		update(realPath, temp.getContent());
		return mapping.getInputForward();
	}
    
	/** 
	 * 修改个人DLOG的基本信息
	 * @param ActionMapping mapping
	 * @param ActionForm form
	 * @param HttpServletRequest request
	 * @param HttpServletResponse response
	 * @return ActionForward
	 * @throws Exception
	 */
	public ActionForward doEditSite(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
	    
		ActionErrors errors = new ActionErrors();
	    SiteForm site = (SiteForm)form;
	    Session ssn = null;
        try {
            ssn = getSession();
            SiteForm old = (SiteForm)ssn.load(SiteForm.class,new Integer(site.getId()));
		    old.setDisplayName(site.getDisplayName());
		    old.setDetail(site.getDetail());
		    old.setCss(site.getCss());
		    old.setIcon(site.getIcon());
		    old.setLogo(site.getLogo());
		    old.setUrl(site.getUrl());
		    ssn.update(old);
		    commitSession(ssn,false);
		    //更新布局模板
		    ServletContext context = getServlet().getServletContext();
		    String path = context.getRealPath("/WEB-INF/jsp/layout/html_layout.htm");
		    update(path, request.getParameter("layout"));
		    //更新会话中的信息
		    request.getSession().setAttribute(SiteForm.class.getName(),old);
		} catch(SQLException e) {
		    errors.add(ERROR_KEY,new ActionError("database_exception"));
		} catch(HibernateException e) {
		    errors.add(ERROR_KEY,new ActionError("hibernate_exception"));
        }finally {
            close(ssn);
        }	
		ActionForward forward = mapping.getInputForward();
		forward.setRedirect(true);
		return forward;
	}

	/**
	 * 更新网站布局模板
	 * @param path 模板文件路径
	 * @param newLayout 新模板
	 * @return 如果模板改变则返回true，否则返回false
	 * @throws IOException
	 */
	protected boolean update(String path, String newLayout) throws IOException{
		boolean updated = false;
		FileInputStream in = null;
		FileOutputStream fos = null;
		try{
			byte[] bs = new byte[512];
			in = new FileInputStream(path);
			StringBuffer layout = new StringBuffer();
			do{
				int rc = in.read(bs);
				if(rc==-1)
					break;
				layout.append(new String(bs, 0, rc));
				if(rc < bs.length)
					break;
			}while(true);
			in.close();
			in = null;
			if(!layout.toString().equals(newLayout)){
				fos = new FileOutputStream(path);
				fos.write(newLayout.getBytes());
			}
		}finally{
			if(fos!=null)
				fos.close();
			if(in!=null)
				in.close();
		}
		return updated;
	}
}
