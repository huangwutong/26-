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

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dlog4j.Globals;
import dlog4j.formbean.UserForm;

/**
 * 管理类Action的基类
 * @author Winter Lau
 */
public class AdminActionBase extends DlogActionBase {

	/**
	 * 该方法覆盖了父类的功能，验证用户身份的有效性
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse res) throws Exception 
	{
		UserForm user = getLoginUser(req);
		if(user==null || !user.isAdmin())
			return mapping.findForward("admin_access_deny");
		
		ActionForward forward = null;
		//统一validate
		if(form!=null){
			ActionErrors errors = form.validate(mapping, req);
			if(errors!=null && !errors.isEmpty()){
				saveErrors(req, errors);
				forward = mapping.getInputForward();
			}
		}
		if(forward==null)
			forward = super.execute(mapping,form,req,res);
		//处理resin 3.0.x 的兼容性问题 -> jspe小服务程序
		if(!forward.getRedirect()){
			//传递要forward的路径给jspe小服务程序
			req.setAttribute(Globals.ACTION_PATH_KEY, forward.getPath());
		}
		return forward;
	}

}
