/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.xaccp.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.service.EnterpriseInfoService;
import com.xaccp.service.FoodInfoService;

public class WelcomeAction extends Action {
	//物品信息，企业信息
	private FoodInfoService foodInfoService;
	private EnterpriseInfoService enterInfoService;

	public EnterpriseInfoService getEnterInfoService() {
		return enterInfoService;
	}

	public void setEnterInfoService(EnterpriseInfoService enterInfoService) {
		this.enterInfoService = enterInfoService;
	}

	public FoodInfoService getFoodInfoService() {
		return foodInfoService;
	}

	public void setFoodInfoService(FoodInfoService foodInfoService) {
		this.foodInfoService = foodInfoService;
	}
//ActionForward是一个重定向的设置，通过这个设置我们可以重定向我们的程序，实现跳转
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//查询餐饮大类别
		List listBigType=foodInfoService.findFoodBigType();
		//食品的状态为最新推荐的集合
		List listFoodState1=foodInfoService.findFoodByState(1);
		//食品的状态为热卖菜品的集合
		List listFoodState2=foodInfoService.findFoodByState(2);
		//获得所有企业信息
		List listEnter=enterInfoService.findAllEnterpise();
		//获得餐饮的小类别
		List listSmallType=foodInfoService.findFoodSmallType();
		
		request.setAttribute("listBigType", listBigType);
		request.setAttribute("listFoodState1", listFoodState1);
		request.setAttribute("listFoodState2", listFoodState2);
		request.setAttribute("listEnter", listEnter);
		request.setAttribute("listSmallType", listSmallType);
		//页面跳转
		return mapping.findForward("ok");
	}
}