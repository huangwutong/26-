package com.action.login;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.service.intface.user.UserService;
import com.service.utils.Constants;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.java.ResP;
import com.java.Resfun;
import com.opensymphony.xwork2.ActionSupport;
/*
 * 王树伟
 * 2010-9-9
 * */

public class LoginAction extends ActionSupport {
//负责登录人员的验证，及所具有的权限
/*在action中将对象进行封装，相同父类名字的只封装一次，
 * 其它设置为空白，在页面上进行判断，如果是空白怎不进入第二轮循环
 * 
 * */
	//将用户对象的信息放在map集合里面
	private Map listmap =new HashMap();;
	private List message;
	private List nn;
	private UserService userService;
	
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public Map getListmap() {
		return listmap;
	}
	public void setListmap(Map listmap) {
		this.listmap = listmap;
	}
	
	public List getNn() {
		return nn;
	}
	public void setNn(List nn) {
		this.nn = nn;
	}
	
	@Override
	public String execute() throws Exception {
		message=new ArrayList();
		// TODO Auto-generated method stub
		//进行网络请求时，我们必须先进性网络的配置
		HttpServletRequest re = ServletActionContext.getRequest();
		HttpSession session = re.getSession();
//		随机范文set/get方法我们用Arraylist比较合适，直接访问动态的数据，
//		而linkedlist则是链表结构，我们用来执行curd操作比较好
		LinkedList<ResP> l=new LinkedList<ResP>();
//		将id封装为一个数字的对象，而不再是一个进行数字类型了
		Long id=new Long(0);
		if(session.getAttribute(Constants.COMPSID)!=null){
			id=(Long)session.getAttribute(Constants.COMPSID);
		}
		System.out.println("id==="+id);
		l=userService.getRespBycompid(id);
	 
		if(l.size()!=0){
			System.out.println(l.size()+"===");
			//List newlist = new ArrayList();
			String str="";
			for(ResP resp:l){
				 
				Resfun rf=new Resfun();
				if(session.getAttribute(Constants.SHOWMESSAGE)==null){
					nn=new ArrayList();
					
					//如果session中没有，说明是第一次进来，对其进行赋值
					session.setAttribute(Constants.SHOWMESSAGE, resp.getResfun().getPname());
					//rf.setPname(resp.getResfun().getPname());
					str=resp.getResfun().getPname();
					rf.setCaction(resp.getResfun().getCaction());
					rf.setCname(resp.getResfun().getCname());
					//newlist.add(rf);
					System.out.println(resp.getResfun().getPname()+"1111");
					nn.add(rf);
					if(session.getAttribute("nnlist")!=null){
						session.removeAttribute("nnlist");
						session.setAttribute("nnlist",nn);
					}else{
					   session.setAttribute("nnlist",nn);
					 }
				}else{
					String pnm=(String)session.getAttribute(Constants.SHOWMESSAGE);
					System.out.println(pnm+"===pnm");
					if(pnm.equals(resp.getResfun().getPname())){
						//如果相等下面所有的设置为空
						//rf.setPname(null);
						rf.setCaction(resp.getResfun().getCaction());
						rf.setCname(resp.getResfun().getCname());
						if(session.getAttribute("nnlist")!=null){
							List nn=(List)session.getAttribute("nnlist");
							nn.add(rf);
							session.setAttribute("nnlist", nn);
						} 
						System.out.println("l.getLast().getResfun().getPname()="+l.getLast().getResfun().getPname());
						if(l.getLast().getResfun().getPname().equals(pnm)){
							System.out.print("到最后一个了！");
							Map listmap1=new HashMap();
							if(session.getAttribute("nnlist")!=null){
								List nn=(List)session.getAttribute("nnlist");
								listmap1.put(str, nn);
								listmap.putAll(listmap1);
							} 
						}
					}else{
						Map listmap1=new HashMap();
						if(session.getAttribute("nnlist")!=null){
							List nn=(List)session.getAttribute("nnlist");
							listmap1.put(str, nn);
							listmap.putAll(listmap1);
						} 
						nn=new ArrayList();
						str=resp.getResfun().getPname();
						System.out.println(str+"====str");
						
						//rf.setPname(resp.getResfun().getPname());
						rf.setCaction(resp.getResfun().getCaction());
						rf.setCname(resp.getResfun().getCname());
						nn.add(rf);
						if(session.getAttribute("nnlist")!=null){
							session.removeAttribute("nnlist");
							session.setAttribute("nnlist",nn);
						}else{
						   session.setAttribute("nnlist",nn);
						 }
						if(l.getLast().getResfun().getPname().equals(str)){
							System.out.print("到最后一个了！");
							Map listmap2=new HashMap();
							if(session.getAttribute("nnlist")!=null){
								List nn=(List)session.getAttribute("nnlist");
								listmap2.put(str, nn);
								listmap.putAll(listmap2);
							} 
						}
						session.removeAttribute(Constants.SHOWMESSAGE);
						session.setAttribute(Constants.SHOWMESSAGE, resp.getResfun().getPname());
					}
				}
			}
		}else{
			addActionError("非法操作请与系统管理员联系！");
			return INPUT;
		}
		
		/*listmap=new HashMap();
		for(int i=0;i<4;i++){
			Map listmap1=new HashMap();
			System.out.println("aaa"+i);
			nn=new ArrayList();
			Resfun rf=new Resfun();
			str="车辆管理";
			rf.setCname("车辆信息");
			rf.setCaction("ls/asd.action");
			Resfun rf1=new Resfun();
			rf1.setCname("车辆状态");
			rf1.setCaction("ls1/asd1.action");
			nn.add(rf);
			nn.add(rf1);
			listmap1.put(str+i, nn);
			listmap.putAll(listmap1);
		}*/
		System.out.println(listmap.size());
		
		message.add(listmap);
		session.removeAttribute(Constants.SHOWMESSAGE);
		session.removeAttribute("nnlist");
		return SUCCESS;
	}
	
  public LinkedList getResfun(){
	  LinkedList<Resfun> l=new LinkedList<Resfun>();
	  Resfun rf=new Resfun();
		rf.setPname("车辆管理");
		rf.setCname("车辆信息");
		rf.setCaction("ls/asd.action");
		l.add(rf);
		Resfun rf1=new Resfun();
		rf1.setPname("车辆管理");
		rf1.setCname("车辆状态");
		rf1.setCaction("ls1/asd1.action");
		l.add(rf1);
		Resfun rf2=new Resfun();
		rf2.setPname("任务管理");
		rf2.setCname("用车申请");
		rf2.setCaction("ls2/asd2.action");
		l.add(rf2);
		Resfun rf3=new Resfun();
		rf3.setPname("任务管理");
		rf3.setCname("审批管理");
		rf3.setCaction("ls3/asd3.action");
		l.add(rf3);
		Resfun rf4=new Resfun();
		rf4.setPname("到期管理");
		rf4.setCname("到期管理4");
		rf4.setCaction("ls4/asd4.action");
		l.add(rf4);
		Resfun rf5=new Resfun();
		rf5.setPname("到期管理");
		rf5.setCname("到期管理5");
		rf5.setCaction("ls5/asd5.action");
		l.add(rf5);
		/*Resfun rf6=new Resfun();
		rf6.setPname("");
		rf6.setCname("");
		rf6.setCaction("");
		l.add(rf6);*/
		Collections.reverse(l);
		return l;
  }
public List getMessage() {
	return message;
}
public void setMessage(List message) {
	this.message = message;
} 
  
}
