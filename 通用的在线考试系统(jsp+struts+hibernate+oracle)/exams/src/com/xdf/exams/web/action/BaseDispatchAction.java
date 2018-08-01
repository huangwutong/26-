package com.xdf.exams.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public abstract class BaseDispatchAction extends DispatchAction{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)throws Exception {
		String path = mapping.getPath();
		String method = path.substring(path.lastIndexOf("/")+1);		
		return this.dispatchMethod(mapping,form,request,response,method);
	}
}
