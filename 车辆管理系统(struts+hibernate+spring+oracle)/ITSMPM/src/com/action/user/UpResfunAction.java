package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.java.Comps;
import com.java.Resfun;
import com.java.Roletb;
import com.java.Xxuser;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class UpResfunAction extends ActionSupport {

	private String pname;
	private Long resfunid;
	private String cname;
	private String caction;
	private UserService userService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Resfun rol=new Resfun();
		rol.setCaction(caction);
		rol.setCname(cname);
		rol.setPname(pname);
		rol.setResfunid(resfunid);
		userService.upResfun(rol);
		addActionMessage("数据修改成功！");
		return SUCCESS;
	}
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		 if(pname==null||pname.toString().equals("")){
			 addActionError("父项节点名称必填！");
		 }
		 if(cname==null||cname.toString().equals("")){
			 addActionError("子项节点名称必填！");
		 }
		 if(caction==null||caction.toString().equals("")){
			 addActionError("子项节点动作必填！");
		 }
		 
		 List l=new ArrayList();
			l=userService.QueryByTabId("Resfun", "resfunid", resfunid);
			//判断是否修改
			if(l.size()!=0){
				
				for(int i=0;i<l.size();i++){
					Resfun rf=new Resfun();
					rf=(Resfun)l.get(i);
					if(rf.getCaction().equals(caction.trim())&&rf.getCname().equals(cname)&&rf.getPname().equals(pname)){
						System.out.println("mei gai");
					}else{
						List n=new ArrayList();
						n=userService.QueryByPcac("Resfun", "pname", pname, "cname", cname, "caction", caction);
						if(n.size()!=0){
							addActionError("该记录已经存在！");
						}
					}
				}
			
			
				
			}
		 
		 
		 
		 
	}
 
	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public Long getResfunid() {
		return resfunid;
	}


	public void setResfunid(Long resfunid) {
		this.resfunid = resfunid;
	}


	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public String getCaction() {
		return caction;
	}


	public void setCaction(String caction) {
		this.caction = caction;
	}


	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
