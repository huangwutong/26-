package crm.sales;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.bean.Company;


public class Turn extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String type = request.getParameter("type");
		RequestDispatcher rd = null;
		if ("add".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/add/addCompany.jsp");
		}
		if ("al".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/a/addLinkman.jsp");
		}
		if ("ai".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/a/info.jsp");
		}
		if ("an".equals(type))
		{
			request.setAttribute("size",((Company)request.getSession().getAttribute("info")).getCompanynarrate().length());
			rd = request.getRequestDispatcher("/crm/a/addNarrate.jsp");
		}
		if ("av".equals(type))
		{
			request.setAttribute("linkman",request.getParameter("linkmanid"));
			rd = request.getRequestDispatcher("/crm/a/addvisit.jsp");
		}
		if ("bl".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/b/addLinkman.jsp");
		}
		if ("bn".equals(type))
		{
			request.setAttribute("size",((Company)request.getSession().getAttribute("info")).getCompanynarrate().length());
			rd = request.getRequestDispatcher("/crm/b/addNarrate.jsp");
		}
		if ("bv".equals(type))
		{
			request.setAttribute("linkman",request.getParameter("linkmanid"));
			rd = request.getRequestDispatcher("/crm/b/addvisit.jsp");
		}
		if ("bi".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/b/info.jsp");
		}
		if ("mc".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/manager/mcompany.jsp");
		}
		if ("aim".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/manager/aim.jsp");
		}
		if ("vl".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/manager/visitList.jsp");
		}
		if ("fvl".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/filiale/visitList.jsp");
		}
		if ("fsc".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/filiale/search.jsp");
		}
		if ("fst".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/filiale/statistic.jsp");
		}
		if ("bill".equals(type))
		{
			rd = request.getRequestDispatcher("/ad/select/adselect.jsp");
		}
		if ("fc".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/filiale/fcompany.jsp");
		}
		if ("ap".equals(type))
		{
			rd = request.getRequestDispatcher("/hrm/add/addpersonnel.jsp");
		}
		if ("alav".equals(type))
		{
			rd = request.getRequestDispatcher("/crm/a/addLinkmanandvisit.jsp");
		}
		if ("addSort".equals(type))
		{
			rd = request.getRequestDispatcher("/ad/add/addsort.jsp");
		}
		if ("addBill".equals(type))
		{
			rd = request.getRequestDispatcher("/ad/add/addbill.jsp");
		}
		if ("destine".equals(type))
		{
			request.setAttribute("id", request.getParameter("id"));
			rd = request.getRequestDispatcher("/ad/select/destine.jsp");
		}
		rd.forward(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String type = request.getParameter("type");
		RequestDispatcher rd = null;
		if ("adc".equals(type))
		{
			request.setAttribute("cleintids",request.getParameter("cleintids"));
			rd = request.getRequestDispatcher("/crm/a/deleteCompany.jsp");
		}
		if ("aa".equals(type))
		{
			request.setAttribute("cleintids",request.getParameter("cleintids"));
			rd = request.getRequestDispatcher("/crm/a/attorn.jsp");
		}
		if ("bdc".equals(type))
		{
			request.setAttribute("cleintids",request.getParameter("cleintids"));
			rd = request.getRequestDispatcher("/crm/b/deleteCompany.jsp");
		}
		if ("ba".equals(type))
		{
			request.setAttribute("cleintids",request.getParameter("cleintids"));
			rd = request.getRequestDispatcher("/crm/b/attorn.jsp");
		}
		if ("ma".equals(type))
		{
			request.setAttribute("cleintids",request.getParameter("cleintids"));
			rd = request.getRequestDispatcher("/crm/manager/attorn.jsp");
		}
		if ("fa".equals(type))
		{
			request.setAttribute("cleintids",request.getParameter("cleintids"));
			rd = request.getRequestDispatcher("/crm/filiale/attorn.jsp");
		}
		if ("all".equals(type))
		{
			request.setAttribute("personnel",request.getParameter("personnel"));
			rd = request.getRequestDispatcher("/crm/filiale/attornall.jsp");
		}
		rd.forward(request, response);
	}
}
