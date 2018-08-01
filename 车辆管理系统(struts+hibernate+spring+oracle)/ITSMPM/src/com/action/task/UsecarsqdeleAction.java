package com.action.task;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Outcm;
import com.java.RP;
import com.java.Ucapli;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class UsecarsqdeleAction extends ActionSupport {
	private TaskService taskService;
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Ucapli pr=new Ucapli();
		Outcm ocm=new Outcm();
		if(a[0]!=null){
			//根据id查询出车单表，判断如果还没收车就提示，删不了
			List l =new ArrayList();
			l=taskService.getOutcmByUcapliId(new Long(a[0].trim()));
			if(l.size()!=0){
				for(int i=0;i<l.size();i++){//没收车
					if(((Outcm)l.get(i)).getWhincom().equals("否")){
						addActionError("删除失败，该项任务没有收车！");
						return INPUT;
					}
				}
			}
//			获得所有的数据对象
			pr = taskService.QueryUcapliById(new Long(a[0].trim()));
			taskService.deleUca(pr);
			addActionMessage("数据删除成功！");
		}else{
			System.out.println("删除信息时出错！");
		}
		return SUCCESS;
	}
	public TaskService getTaskService() {
		return taskService;
	}
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	
}
