
package com.accp.myoa.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.service.ComleteDegressService;


public class ComleteDegressAction extends DispatchAction {
	private ComleteDegressService comleteDegressService;
		
	public void setComleteDegressService(ComleteDegressService comleteDegressService) {
		this.comleteDegressService = comleteDegressService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		return null;
	}
}
	
