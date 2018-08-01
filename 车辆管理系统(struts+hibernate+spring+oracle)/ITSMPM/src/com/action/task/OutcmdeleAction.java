package com.action.task;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.java.Outcm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class OutcmdeleAction extends ActionSupport {
	//删除出车单信息
	private TaskService taskService;
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		//出车的信息
		Outcm pr=new Outcm();
		if(a[0]!=null){
			pr = taskService.QueryOutcmById(new Long(a[0].trim()));
			//获得收车的代码
			if(pr.getWhincom().equals("否")){
				addActionError("删除失败，该项任务没有收车！");
				return INPUT;
			}
			taskService.deleOutcm(pr);
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
