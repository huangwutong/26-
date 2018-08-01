package com.bookma.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.Bookinfo;
import com.BookinfoDAO;
import com.bookma.service.BookmaService;
import com.bookma.struts.dao.BookmaDAO;
import com.bookma.struts.form.BookmaForm;
import com.laodong.framework.MyDispatchAction;
import com.laodong.pub.util.StringUtil;
import com.laodong.pub.util.dao.NLLDDAOTool;

public class BookmaAction extends MyDispatchAction{
	private BookinfoDAO bookinfoDAO;
	private BookmaService bookmaService;
	public static Logger logger=Logger.getRootLogger();
	public BookmaService getBookmaService() {
		return bookmaService;
	}
	public void setBookmaService(BookmaService bookmaService) {
		this.bookmaService = bookmaService;
	}
	public BookinfoDAO getBookinfoDAO() {
		return bookinfoDAO;
	}
	public void setBookinfoDAO(BookinfoDAO bookinfoDAO) {
		this.bookinfoDAO = bookinfoDAO;
	}
	/***********ͼ����Ϣ����*************/
	public ActionForward booklist(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){	
		BookmaDAO dao = (BookmaDAO)NLLDDAOTool.getBean("bookmaDAO");

		try {		
			//DEBUG��INFO��WARN��ERROR��FATAL
            logger.debug("----̫���� debug---");
            logger.info("----̫���� info---");
            logger.warn("----̫���� warn---");
            logger.error("----̫���� error---");
            logger.fatal("----̫���� fatal---");
//			bookinfoDAO.isValidUser("��","e");
            System.out.println(bookinfoDAO.getName() + " : " + bookinfoDAO.getMoney());
//			List llist = bookmaService.findAllBookinfoObjList();
//			request.setAttribute("list", llist);
		} catch (Exception e) {
			request.setAttribute("myerror", e.getMessage());
			e.printStackTrace();
		}
		return mapping.findForward("booklist");
	}
	public ActionForward addbook(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		return mapping.findForward("addbook");
	}
	public ActionForward addbooksave(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		
		BookmaForm cform = (BookmaForm)form;
		Bookinfo obj = cform.getBookinfoobj();
		try {

//             dao.gg();
			//             dao.isValidUser("s", "d");
			bookmaService.taxInsBookinfoObj(obj);
			request.setAttribute("myerror", "�����ɹ���");
		} catch (Exception e) {
			request.setAttribute("myerror", e.getMessage());
			e.printStackTrace();
		}
		return booklist(mapping, form, request, response);
	}

	public ActionForward updbook(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		BookmaDAO dao = (BookmaDAO)NLLDDAOTool.getBean("bookmaDAO");
		BookmaForm cform = (BookmaForm)form;
		int id = StringUtil.getId(request, "id");
		try {
			Bookinfo obj = dao.findBookinfoObjById(id);
			cform.setBookinfoobj(obj);
		} catch (Exception e) {
			request.setAttribute("myerror", e.getMessage());
			e.printStackTrace();
		}
		return mapping.findForward("updbook");
	}
	public ActionForward updbooksave(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		BookmaDAO dao = (BookmaDAO)NLLDDAOTool.getBean("bookmaDAO");
		BookmaForm cform = (BookmaForm)form;
		Bookinfo obj = cform.getBookinfoobj();
		try {
			dao.updBookinfoObj(obj);
			request.setAttribute("myerror", "�޸ĳɹ���");
		} catch (Exception e) {
			request.setAttribute("myerror", e.getMessage());
			e.printStackTrace();
		}
		return booklist(mapping, form, request, response);
	}
	public ActionForward delbook(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		BookmaDAO dao = (BookmaDAO)NLLDDAOTool.getBean("bookmaDAO");
		BookmaForm cform = (BookmaForm)form;
		int id = cform.getBookinfoobj().getId().intValue();
		try {
			dao.delBookinfoObj(id);
			request.setAttribute("myerror", "ɾ���ɹ���");
		} catch (Exception e) {
			request.setAttribute("myerror", e.getMessage());
			e.printStackTrace();
		}
		return booklist(mapping, form, request, response);
	}
	public ActionForward viewbook(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		BookmaDAO dao = (BookmaDAO)NLLDDAOTool.getBean("bookmaDAO");
		BookmaForm cform = (BookmaForm)form;
		int id = StringUtil.getId(request, "id");
		try {
			Bookinfo obj = dao.findBookinfoObjById(id);
			cform.setBookinfoobj(obj);
		} catch (Exception e) {
			request.setAttribute("myerror", e.getMessage());
			e.printStackTrace();
		}
		return mapping.findForward("viewbook");
	}
}
