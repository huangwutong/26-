
package com.accp.myoa.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.Dept;
import com.accp.myoa.service.DeptService;


public class DeptAction extends DispatchAction {
	private DeptService deptService;
		
	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}
	
	// 跳转到部门管理页面 LEO
	public ActionForward toDeptManage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {		
		return mapping.findForward("deptManage");
	}
	
	//查看部门信息 LEO
	public ActionForward toAddDeptManage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List<Dept> deptList = deptService.findAllDept();
		request.setAttribute("deptList", deptList);
		return mapping.findForward("insertDept");
	}
}
	
