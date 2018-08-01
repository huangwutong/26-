package com.action.car;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Outcm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.car.CarService;
import com.service.utils.Constants;
public class OutcarAction extends ActionSupport {
	//出车记录的数据表
	private CarService carService;
	private List message;
	public List getMessage() {
		return message;
	}
	public void setMessage(List message) {
		this.message = message;
	}
	public String out() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		List l=new ArrayList();
		if(a[0]!=null){
			l = carService.QueryById(new Long(a[0].trim()),Constants.OUTCM);
		} 
		setMessage(l);
		return SUCCESS;
	}
	
	
	public String oil() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		List l=new ArrayList();
		if(a[0]!=null){
			l = carService.QueryById(new Long(a[0].trim()),Constants.OILM);
		} 
		setMessage(l);
		return SUCCESS;
	}
//	维修记录的数据
	public String wx() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		List l=new ArrayList();
		if(a[0]!=null){
			l = carService.QueryById(new Long(a[0].trim()),Constants.SERM);
		} 
		setMessage(l);
		return SUCCESS;
	}
	public String gf() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		List l=new ArrayList();
		if(a[0]!=null){
			l = carService.QueryById(new Long(a[0].trim()),Constants.FEESM);
		} 
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
