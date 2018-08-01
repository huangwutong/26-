package com.action.print;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.print.PrintServices;

public class OilprintAction extends ActionSupport {

	//初始化所有的车辆的车牌号
	private PrintServices printServices;
	private List carselect;
	private String selectAction;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectoil";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//维修信息
	public String repar() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectrepar";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//保养信息
	public String mam() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectmainm";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//保险信息
	public String insrm() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectinsrm";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//规费信息
	public String feesm() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectfeesm";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//年检信息
	public String annum() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectannum";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//违章信息
	public String violm() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectviolm";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	
	
	
	public String getSelectAction() {
		return selectAction;
	}

	public void setSelectAction(String selectAction) {
		this.selectAction = selectAction;
	}

	public PrintServices getPrintServices() {
		return printServices;
	}
	public void setPrintServices(PrintServices printServices) {
		this.printServices = printServices;
	}
	public List getCarselect() {
		return carselect;
	}
	public void setCarselect(List carselect) {
		this.carselect = carselect;
	}
	

}
