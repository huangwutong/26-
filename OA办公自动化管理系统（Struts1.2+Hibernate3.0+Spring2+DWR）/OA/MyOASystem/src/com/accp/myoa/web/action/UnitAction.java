
package com.accp.myoa.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.Unit;
import com.accp.myoa.service.UnitService;


public class UnitAction extends DispatchAction {
	private UnitService unitService;
		
	public void setUnitService(UnitService unitService) {
		this.unitService = unitService;
	}

	// 跳转到单位管理页面 LEO
	public ActionForward toUnitManage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {	
		return mapping.findForward("unitManage");
	}
	
	//查看单位信息 LEO
	public ActionForward toAddUnitManage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List<Unit> unitList = unitService.findAllUnit();
		request.setAttribute("unitList", unitList);
		return mapping.findForward("insertUnit");
	}
}
	
