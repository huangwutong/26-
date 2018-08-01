package com.laodong.pub.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import com.laodong.pub.product.spring.UserService;
import com.laodong.pub.pubinf.PubinfConstants;
import com.laodong.pub.util.DateUtil;
import com.laodong.pub.util.dao.NLLDDAOTool;

public class LoginAction extends DispatchAction {
	/** ע�� */
	public ActionForward regist(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		LoginForm myform = (LoginForm) form;

		UserDAO dao = (UserDAO) NLLDDAOTool.getBean("lgUserDAO");
		try {
			LoginObj obj = dao.findLoginObjByUserid(myform.getUserid());
			if (obj != null) {
				request.setAttribute("myerror", "���û��Ѵ��ڣ�");
				return mapping.findForward("login");
			}

			request.setAttribute("myerror", "ע��ɹ���");
		} catch (Exception e) {
			request.setAttribute("myerror", "ע��ʧ�ܣ�");
			e.printStackTrace();
		}
		return mapping.findForward("login");
	}
	/** ��ʼ���޸����� */
	public ActionForward updpassword(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userid = (String) session
				.getAttribute(PubinfConstants.userLonginName);
		if (userid == null) {
			request.setAttribute("mymessage", "�������ȵ�¼ϵͳ�����ܽ��뱾ҳ��");
			return mapping.findForward("FAILURE");
		}
		return mapping.findForward("updpassword");
	}
	/** �޸����� */
	public ActionForward updpasswordsave(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String userid = (String) session
				.getAttribute(PubinfConstants.userLonginName);
		LoginForm myform = (LoginForm) form;

		UserDAO dao = (UserDAO) NLLDDAOTool.getBean("lgUserDAO");
		try {
			LoginObj obj = null;
			if (obj == null) {
				request.setAttribute("myerror", "�����벻�ԣ�");
				return mapping.findForward("login");
			}
			dao.updpassword(userid, myform.getNewpassword());
			request.setAttribute("myerror", "�޸ĳɹ���");
		} catch (Exception e) {
			request.setAttribute("myerror", "�޸�ʧ�ܣ�");
			e.printStackTrace();
		}
		myform.setPassword(null);
		myform.setNewpassword(null);
		return mapping.findForward("updpassword");
	}

	/**
	 * @�������� ��ʱ����spring�ķ���
	 * @ҵ������
	 * 
	 * @author lhh
	 * @ʱ�� 2007-7-12 21:55:26
	 */
	public ActionForward query(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mymz", "haha1");

		UserService user = (UserService) NLLDDAOTool.getBean("UserService");
		try {
			user.taxd12();
			// user.ptd12();
			// TestJdbc.aa();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapping.findForward("login");
	}

	/** ��¼ */
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		LoginForm myform = (LoginForm) form;

//		UserDAO dao = (UserDAO) NLLDDAOTool.getBean("lgUserDAO");
//
//		try {
//			LoginObj obj = dao.findLoginObjByUserid(myform.getUserid());
//			if (obj == null) {
//				request.setAttribute("myerror", "�û������ڣ�");
//				return mapping.findForward("login");
//			}
//
//			if (obj == null) {
//				request.setAttribute("myerror", "�������");
//				return mapping.findForward("login");
//			} else {
//				HttpSession session = request.getSession(true);
//				session.setAttribute(PubinfConstants.userLonginName, obj
//						.getUserid());
//				session.setAttribute(PubinfConstants.userInjzdeptid, "" + 0);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		HttpSession session = request.getSession(true);
		session.setAttribute("userid", myform.getUserid());
		return mapping.findForward("login");
	}

	/** �˳� */
	public ActionForward loginOut(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		String userid = (String) session
				.getAttribute(PubinfConstants.userLonginName);
		try {

		} catch (Exception e) {

			e.printStackTrace();
		}
		session.invalidate();
		request.setAttribute("myerror", "�ɹ��˳���");
		return mapping.findForward("login");
	}
	public ActionForward myindex(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		return mapping.findForward("myindex");
	}

}
