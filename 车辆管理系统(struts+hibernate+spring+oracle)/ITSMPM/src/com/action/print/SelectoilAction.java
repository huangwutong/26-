package com.action.print;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.print.PrintServices;
import com.service.utils.Constants;
public class SelectoilAction extends ActionSupport {

	private Long carbstbid;
	private PrintServices printServices;
	private List message;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re=ServletActionContext.getRequest();
		HttpSession session=re.getSession();
		List l=new ArrayList();
			l=printServices.PrintCarnum(carbstbid, Constants.OILM);
			if(session.getAttribute(Constants.oilprintlist)!=null){
				session.removeAttribute(Constants.oilprintlist);
				session.setAttribute(Constants.oilprintlist, l);
			}else{
				session.setAttribute(Constants.oilprintlist, l);
			}
			setMessage(l);
	 
		
		return SUCCESS;
	}
	//维修信息
	public String repar() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re=ServletActionContext.getRequest();
		HttpSession session=re.getSession();
		List l=new ArrayList();
			l=printServices.PrintCarnum(carbstbid, Constants.SERM);
			if(session.getAttribute(Constants.reparprintlist)!=null){
				session.removeAttribute(Constants.reparprintlist);
				session.setAttribute(Constants.reparprintlist, l);
			}else{
				session.setAttribute(Constants.reparprintlist, l);
			}
			setMessage(l);
	 
		
		return SUCCESS;
	}
	//保养信息
	public String mam() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re=ServletActionContext.getRequest();
		HttpSession session=re.getSession();
		List l=new ArrayList();
			l=printServices.PrintCarnum(carbstbid, Constants.MAINM);
			if(session.getAttribute(Constants.mainmprintlist)!=null){
				session.removeAttribute(Constants.mainmprintlist);
				session.setAttribute(Constants.mainmprintlist, l);
			}else{
				session.setAttribute(Constants.mainmprintlist, l);
			}
			setMessage(l);
		return SUCCESS;
	}
	//保险信息
	public String insrm() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re=ServletActionContext.getRequest();
		HttpSession session=re.getSession();
		List l=new ArrayList();
			l=printServices.PrintCarnum(carbstbid, Constants.INSRM);
			if(session.getAttribute(Constants.insrmprintlist)!=null){
				session.removeAttribute(Constants.insrmprintlist);
				session.setAttribute(Constants.insrmprintlist, l);
			}else{
				session.setAttribute(Constants.insrmprintlist, l);
			}
			setMessage(l);
		return SUCCESS;
	}
	//规费信息
	public String feesm() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re=ServletActionContext.getRequest();
		HttpSession session=re.getSession();
		List l=new ArrayList();
			l=printServices.PrintCarnum(carbstbid, Constants.FEESM);
			if(session.getAttribute(Constants.feesmprintlist)!=null){
				session.removeAttribute(Constants.feesmprintlist);
				session.setAttribute(Constants.feesmprintlist, l);
			}else{
				session.setAttribute(Constants.feesmprintlist, l);
			}
			setMessage(l);
		return SUCCESS;
	}
	//年检信息
	public String annum() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re=ServletActionContext.getRequest();
		HttpSession session=re.getSession();
		List l=new ArrayList();
			l=printServices.PrintCarnum(carbstbid, Constants.ANNUM);
			if(session.getAttribute(Constants.annumprintlist)!=null){
				session.removeAttribute(Constants.annumprintlist);
				session.setAttribute(Constants.annumprintlist, l);
			}else{
				session.setAttribute(Constants.annumprintlist, l);
			}
			setMessage(l);
		return SUCCESS;
	}
	//年检信息
	public String violm() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re=ServletActionContext.getRequest();
		HttpSession session=re.getSession();
		List l=new ArrayList();
			l=printServices.PrintCarnum(carbstbid, Constants.VIOLM);
			if(session.getAttribute(Constants.violmprintlist)!=null){
				session.removeAttribute(Constants.violmprintlist);
				session.setAttribute(Constants.violmprintlist, l);
			}else{
				session.setAttribute(Constants.violmprintlist, l);
			}
			setMessage(l);
		return SUCCESS;
	}
	
	
	
	public Long getCarbstbid() {
		return carbstbid;
	}
	public void setCarbstbid(Long carbstbid) {
		this.carbstbid = carbstbid;
	}
	public PrintServices getPrintServices() {
		return printServices;
	}
	public void setPrintServices(PrintServices printServices) {
		this.printServices = printServices;
	}
	public List getMessage() {
		return message;
	}
	public void setMessage(List message) {
		this.message = message;
	}
	 

	
	
}
