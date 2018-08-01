
package com.accp.myoa.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.Position;
import com.accp.myoa.service.PositionService;


public class PositionAction extends DispatchAction {
	private PositionService positionService;
		
	public void setPositionService(PositionService positionService) {
		this.positionService = positionService;
	}
	
	// 跳转到职位管理页面 LEO
	public ActionForward toPositionManage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {		
		return mapping.findForward("positionManage");
	}
	
	//查看职位信息 LEO
	public ActionForward toAddPositionManage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List<Position> unitList = positionService.findAllPosition();
		request.setAttribute("positionList", unitList);
		return mapping.findForward("insertPosition");
	}
}
	
