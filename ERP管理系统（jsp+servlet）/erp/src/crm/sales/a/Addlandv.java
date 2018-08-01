package crm.sales.a;

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
import sys.dao.bean.Linkman;
import sys.dao.bean.Personnel;
import sys.dao.bean.Visit;


public class Addlandv extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	//添加联系人
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Linkman linkman = new Linkman();
		linkman.setLinkmanname(Replace.pep(request.getParameter("linkmanName")));
		linkman.setLinkmanphone(Replace.pep(request.getParameter("linkmanPhone")));
		linkman.setLinkmanmoblie(Replace.pep(request.getParameter("linkmanMoblie")));
		linkman.setLinkmanemail(Replace.pep(request.getParameter("linkmanEmail")));
		linkman.setJob(Replace.pep(request.getParameter("job")));
		Integer compageid = Integer.valueOf(Replace.pep(request.getParameter("companyid")));
		linkman.setCompanyid(compageid);
		linkman.insert();
		linkman.getnew();
		Visit visit = new Visit();
		Personnel user = (Personnel)request.getSession().getAttribute("user");
		Company company = (Company)request.getSession().getAttribute("info");
		visit.setCompanyid(company.getCompanyid());
		visit.setLinkmanid(linkman.getLinkmanid());
		visit.setPersonnelid(user.getPersonnelid());
		visit.setVisittype(Replace.pep(request.getParameter("visittype")));
		visit.setVisitlog(Replace.pep(request.getParameter("delectSake"))+"--"+user.getRealname()+"-"+user.getDept().getDeptname());
		visit.insert();
		String sql = "update company set lastvisitdate ='"+Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new java.util.Date()))+"',type = '"+request.getParameter("type")+"',visitcount = visitcount+1 where companyid = "+company.getCompanyid();
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
		request.setAttribute("success", "添加联系人与拜访成功!<a href='infoA?companyid="+compageid+"' class='pagenum' >返回</a>");
		request.getRequestDispatcher("/succ.jsp").forward(request, response);
	}
}
