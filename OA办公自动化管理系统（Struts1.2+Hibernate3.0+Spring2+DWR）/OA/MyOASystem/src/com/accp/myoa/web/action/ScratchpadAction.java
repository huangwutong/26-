
package com.accp.myoa.web.action;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.Scratchpad;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.ScratchpadService;


public class ScratchpadAction extends DispatchAction {
	private ScratchpadService scratchpadService;
		
	public void setScratchpadService(ScratchpadService scratchpadService) {
		this.scratchpadService = scratchpadService;
	}

	
	//个人便签(日程按排)
	public ActionForward toAlertInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
	//	System.out.println("*"+request.getAttribute("year")+"*");
		if(request.getParameter("year")!=null){
		//	System.out.println("1");
			Calendar c=Calendar.getInstance();
			
			String year=(String)request.getParameter("year");//获得年
			String month=(String)request.getParameter("month");//获得月
			request.setAttribute("year",year);
			request.setAttribute("month",month);//传真实的月份
			request.setAttribute("day", c.get(Calendar.DAY_OF_MONTH));
			if(month.equals(String.valueOf(c.get(Calendar.MONTH)+1))  && year.equals(String.valueOf(c.get(Calendar.YEAR)))){
				request.setAttribute("isToday", "is");
			}else{
				request.setAttribute("isToday", "no");
			}
		
			//这个月的总天数
			int daycount=scratchpadService.getCountDaysOfThisMonth(year, month);
			request.setAttribute("daycount", daycount);
			
			//这个月1号是星期几,1为星期日，2为星期一
			int firstDayWeek=scratchpadService.getThisMonthFirstDayWeek(year,month);
			request.setAttribute("firstDayWeek", firstDayWeek);
			
			HttpSession session=request.getSession();
			
			//通过年月，获得这个月的便签
			List<Scratchpad> scratchpad=scratchpadService.
					getScratchpadByDate(year, month, (User)session.getAttribute("user"));
			request.setAttribute("list", scratchpad);
		}else{
			//System.out.println("2");
			Calendar c=Calendar.getInstance();
			request.setAttribute("year", c.get(Calendar.YEAR));
			request.setAttribute("month",String.valueOf(c.get(Calendar.MONTH)+1));//传真实的月份
			request.setAttribute("day", c.get(Calendar.DAY_OF_MONTH));
			request.setAttribute("isToday", "is");
			//这个月的总天数
			int daycount=scratchpadService.getCountDaysOfThisMonth(String.valueOf(c.get(Calendar.YEAR)), String.valueOf(c.get(Calendar.MONTH)+1));
			request.setAttribute("daycount", daycount);
			
			//这个月1号是星期几,1为星期日，2为星期一
			int firstDayWeek=scratchpadService.getThisMonthFirstDayWeek(String.valueOf(c.get(Calendar.YEAR)),String.valueOf(c.get(Calendar.MONTH)+1));
			request.setAttribute("firstDayWeek", firstDayWeek);
			
			HttpSession session=request.getSession();
			
			//通过年月，获得这个月的便签
			List<Scratchpad> scratchpad=scratchpadService.
					getScratchpadByDate(String.valueOf(c.get(Calendar.YEAR)), String.valueOf(c.get(Calendar.MONTH)+1), (User)session.getAttribute("user"));
			request.setAttribute("list", scratchpad);
		}
		
		return mapping.findForward("alertInfo");
	}
	
	//这个可能不用
	public ActionForward toGetScratchpad(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String day=request.getParameter("day");
	//	/scratchpad
		HttpSession session=request.getSession();
		
		//List<Scratchpad> list=scratchpadBiz.getScratchpadByDate(year, month, day, (User)session.getAttribute("user"));
		//request.setAttribute("list", list);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("id", ((User)session.getAttribute("user")).getUserId());
		
		return mapping.findForward("scratchpadShowAndAdd");
	}
}
	
