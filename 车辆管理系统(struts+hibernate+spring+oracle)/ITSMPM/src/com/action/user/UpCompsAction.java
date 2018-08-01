package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Comps;
import com.java.Roletb;
import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class UpCompsAction extends ActionSupport {

	private String comname;
	private Long compsid;
	private String comdes;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Comps rol=new Comps();
		rol.setComdes(comdes);
		rol.setComname(comname);
		rol.setCompsid(compsid);
		userService.upComps(rol);
		addActionMessage("数据修改成功！");
		return SUCCESS;
	}
	   

	@Override
	public void validate() {
		// TODO Auto-generated method stub
		if(comname==null||comname.trim().equals("")){
			addActionError("权限必须填写！");
		}
		List l=new ArrayList();
		l=userService.QueryByTabId("Comps", "compsid", compsid);
		//判断是否修改
		if(l.size()!=0){
			for(int i=0;i<l.size();i++){
				Comps comps=new Comps();
				comps=(Comps)l.get(i);
				if(comps.getComname().equals(comname.trim())){
					System.out.println("mei gai");
				}else{
					List n=new ArrayList();
					n=userService.QueryByTab("Comps", "comname", comname);
					if(n.size()!=0){
						addActionError("该权限已经存在！");
					}
				}
			}
		}
	}
	
	public String getComname() {
		return comname;
	}
	public void setComname(String comname) {
		this.comname = comname;
	}
	public Long getCompsid() {
		return compsid;
	}
	public void setCompsid(Long compsid) {
		this.compsid = compsid;
	}
	public String getComdes() {
		return comdes;
	}
	public void setComdes(String comdes) {
		this.comdes = comdes;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
