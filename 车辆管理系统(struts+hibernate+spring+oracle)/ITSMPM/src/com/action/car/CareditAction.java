package com.action.car;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Carbstb;
import com.java.Comps;
import com.java.Roletb;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.car.CarService;
import com.service.intface.user.UserService;

public class CareditAction extends ActionSupport {
	private CarService carService;
	private List message;
	public List getMessage() {
		return message;
	}
	public void setMessage(List message) {
		this.message = message;
	}
 
	public String dele() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		//获得一个parmeter的集合
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Carbstb pr=new Carbstb();
		if(a[0]!=null){
			pr = carService.QueryCarbstbById(new Long(a[0].trim()));
			carService.deleCarbstb(pr);
			addActionMessage("数据删除成功！");
		}else{
			System.out.println("删除信息时出错！");
		}
		return SUCCESS;
	}
	public String edit() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Carbstb pr=new Carbstb();
		if(a[0]!=null){
			pr = carService.QueryCarbstbById(new Long(a[0].trim()));
		} 
		List l=new ArrayList();
		//将修改好的信息放在一个集合里面
		l.add(pr);
		setMessage(l);
		return SUCCESS;
	}
	public CarService getCarService() {
		return carService;
	}
	public void setCarService(CarService carService) {
		this.carService = carService;
	}
	  
}
