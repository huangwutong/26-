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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dlog4j.SiteManager;
import dlog4j.formbean.ParamForm;
import dlog4j.formbean.SiteForm;

/**
 * 参数设置的Action
 * 
 * @author Liudong
 */
public class DlogParamAction extends AdminActionBase {

    /**
     * 修改参数值
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward doUpdateParam(ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception 
    {
        ActionErrors errors = new ActionErrors();
        ParamForm param = (ParamForm)form;
        Session ssn = null;
		try {
		    ssn = getSession();
		    SiteForm site = SiteManager.getCurrentSite(request);
		    ParamForm pa = (ParamForm)ssn.load(ParamForm.class,new Integer(param.getId()));
		    if(pa!=null) {
		        if(!pa.getValue().equals(param.getValue())) {
		            pa.setType(param.getType());
		            pa.setValue(param.getValue());
		            ssn.update(pa);
		        }
		    }
		} catch(SQLException e) {
		    errors.add("param",new ActionError("database_exception"));
		} catch(HibernateException e) {
		    errors.add("param",new ActionError("hibernate_exception"));
		} finally {
			commitSession(ssn, true);
		}
		// Report any errors we have discovered back to the original form
		if (!errors.isEmpty())
		    saveErrors(request, errors);					
		ActionForward forward = mapping.getInputForward();
		if(errors.isEmpty())
			forward.setRedirect(true);
		return forward;
    }

}
