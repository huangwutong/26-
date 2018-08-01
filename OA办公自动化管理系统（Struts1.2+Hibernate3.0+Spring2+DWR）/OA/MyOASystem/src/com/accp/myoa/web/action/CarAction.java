
package com.accp.myoa.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.Car;
import com.accp.myoa.service.CarService;


public class CarAction extends DispatchAction {
	private CarService carService;
		
	public void setCarService(CarService carService) {
		this.carService = carService;
	}

	public ActionForward showDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
		Car car=carService.load(id);
		request.setAttribute("car",	car);
		return mapping.findForward("carDetail");
	}
}
	
