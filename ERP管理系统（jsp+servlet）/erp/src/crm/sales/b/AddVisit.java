package crm.sales.b;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.Replace;
import sys.dao.ConnectManager;
import sys.dao.bean.Company;
import sys.dao.bean.Personnel;
import sys.dao.bean.Visit;


public class AddVisit extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//添加拜访记录
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Visit visit = new Visit();
		Personnel user = (Personnel)request.getSession().getAttribute("user");
		Company company = (Company)request.getSession().getAttribute("info");
		visit.setCompanyid(company.getCompanyid());
		visit.setLinkmanid(Integer.valueOf(Replace.pep(request.getParameter("linkmanid"))));
		visit.setPersonnelid(user.getPersonnelid());
		visit.setVisittype(Replace.pep(request.getParameter("visittype")));
		visit.setVisitlog(Replace.pep(request.getParameter("delectSake"))+"--"+user.getRealname()+"-"+user.getDept().getDeptname());
		visit.insert();
		String sql = "update company set lastvisitdate ='"+Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new java.util.Date()))+"',type = '"+Replace.pep(request.getParameter("type"))+"',visitcount = visitcount+1 where companyid = "+company.getCompanyid();
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			try
			{
				cm.executeUpdate(sql);
			}
			finally
			{
				cm.close();
			}
		}
		request.setAttribute("success", "添加拜访记录成功!<a href='infoB?companyid="+company.getCompanyid()+"' class='pagenum' >返回</a>");
		request.getRequestDispatcher("/succ.jsp").forward(request, response);
	}
}
