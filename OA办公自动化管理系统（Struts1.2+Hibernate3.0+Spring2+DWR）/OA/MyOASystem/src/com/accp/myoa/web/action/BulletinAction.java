package com.accp.myoa.web.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.Bulletin;
import com.accp.myoa.entity.BulletinExamine;
import com.accp.myoa.entity.ExamineState;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.BulletinExamineService;
import com.accp.myoa.service.BulletinService;
import com.accp.myoa.web.form.BulletinForm;

public class BulletinAction extends DispatchAction {
	private BulletinService bulletinService;
	private BulletinExamineService bulletinExamineService;
	
	public void setBulletinExamineService(
			BulletinExamineService bulletinExamineService) {
		this.bulletinExamineService = bulletinExamineService;
	}

	public void setBulletinService(BulletinService bulletinService) {
		this.bulletinService = bulletinService;
	}
	
	// 显示全部的公告
	public ActionForward toBulletinsManage(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		int pageNum=1;
		if (request.getParameter("pageNum")!=null) {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		List<Bulletin> list = bulletinService.findByPage(5, pageNum);
		
		int count=bulletinService.getCount();
		int maxPage=count%5>0?(count/5+1):(count/5);
		request.setAttribute("bulletins", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxPage", maxPage);
		return mapping.findForward("toBulletinsManage");
	}
	//跳转到添加公告页面
	public ActionForward toBulletinsAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		return mapping.findForward("toBulletinsAdd");
	}
	//添加公告
	public ActionForward doAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		BulletinForm bf = (BulletinForm) form;
		Bulletin bulletin = bf.getBulletin();	
		bulletin.setBulletinDate(new Date());
		User user=UserGetter.getUser(request);
//		Set<BulletinExamine> bullExams=new HashSet<BulletinExamine>();
//		BulletinExamine be=new BulletinExamine();
//		be.setUser(user);
//		bullExams.add(be);
//		bulletin.setBulletinExamines(bullExams);
		bulletinService.add(bulletin);		
		request.setAttribute("msg", "添加成功！");
		return mapping.findForward("toBulletinsAdd");
	}
	
	public ActionForward doExamine(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int bid = Integer.parseInt(request.getParameter("bid"));
		int esid = Integer.parseInt(request.getParameter("esid"));
		Bulletin bull = bulletinService.load(bid);
		ExamineState es = new ExamineState();
		es.setExamineStateId(esid);
		bull.setExamineState(es);
		bull.setAvailable(1);
		//审批表
		User user=UserGetter.getUser(request);
		BulletinExamine be=new BulletinExamine();
		be.setUser(user);
		be.setBulletin(bull);
		bulletinExamineService.add(be);
		
		bulletinService.update(bull);
		response.sendRedirect("bulletin.do?operate=toBulletinsManage&pageNum="+pageNum);
		return null;
	}

	public ActionForward doAvailable(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int bid = Integer.parseInt(request.getParameter("bid"));
		int available = Integer.parseInt(request.getParameter("available"));
		Bulletin bull = bulletinService.load(bid);
		bull.setAvailable(available);
		bulletinService.update(bull);
		request.getRequestDispatcher("bulletin.do?operate=toBulletinsManage&pageNum="+pageNum).forward(request, response);
		return null;
	}
	
	public ActionForward doDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int bid = Integer.parseInt(request.getParameter("bid"));				
		bulletinService.del(bid);
		request.getRequestDispatcher("bulletin.do?operate=toBulletinsManage&pageNum="+pageNum).forward(request, response);
		return null;
	}

	public ActionForward toBulletinsQuery(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		return mapping.findForward("toBulletinsQuery");
	}
	public ActionForward showDetail(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		int bid = Integer.parseInt(request.getParameter("bid"));
		Bulletin bull = bulletinService.load(bid);
		request.setAttribute("bulletin", bull);
		return mapping.findForward("showBulletinDetail");
	}

	
}
