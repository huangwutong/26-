package com.accp.myoa.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.Menu;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.MenuService;

public class MenuAction extends DispatchAction {
	private MenuService menuService;

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public ActionForward toMainMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		User user =(User)session.getAttribute("user");
		List<Menu> menus = menuService.getMainMenu(user);
		request.setAttribute("mainMenus", menus);
		return mapping.findForward("top");
	}

}
