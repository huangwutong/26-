
package com.accp.myoa.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.DeptPosition;
import com.accp.myoa.entity.PositionPopedom;
import com.accp.myoa.service.PositionPopedomService;


public class PositionPopedomAction extends DispatchAction {
	private PositionPopedomService positionPopedomService;
	private PositionPopedom positionPopedom;
	private DeptPosition deptPosition;
	
	public void setPositionPopedomService(PositionPopedomService positionPopedomService) {
		this.positionPopedomService = positionPopedomService;
	}

	public void setDeptPosition(DeptPosition deptPosition) {
		this.deptPosition = deptPosition;
	}
	
	// 跳转到角色权限管理页面 LEO
	public ActionForward toPartPopedomManage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {		
		
		//List<PositionPopedom> loadList = positionPopedomService.loadAll();
		//request.setAttribute("loadList",loadList);
		return mapping.findForward("partPopedomManage");
	}
	
	public ActionForward toAddPositionPopedom(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		return mapping.findForward("addPartPopedom");
	}
	
	public ActionForward toEdit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		PositionPopedom positionPopedom = positionPopedomService.getPositionPopedom(id);
		request.setAttribute("positionPopedom", positionPopedom);
		List<PositionPopedom> loadList = positionPopedomService.loadAll();
		request.setAttribute("loadList", loadList);
		return mapping.findForward("edit");
	}
}
	
