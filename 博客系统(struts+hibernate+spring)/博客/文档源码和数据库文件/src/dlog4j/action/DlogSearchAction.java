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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * 搜索Action类,该类用在search.jsp中用于决定是日记搜索还是评论搜索
 * @author Liudong
 */
public class DlogSearchAction extends DlogActionBase {
    
    /**
     * 搜索按钮点击触发
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward doSearch(ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception 
    {
    	int cat_id = -1;
    	try{
    		cat_id = Integer.parseInt(request.getParameter("cat_id"));
    	}catch(Exception e){}
    	String scope = "comment";
    	if(cat_id!=-2){
        	scope = request.getParameter("scope");
        	if(scope==null)
        		scope = "log";
    	}
        return mapping.findForward(scope);
    }

    /**
     * 默认搜索行为
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward doDefault(ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception 
    {
    	return doSearch(mapping,form,request,response);
    }
}
