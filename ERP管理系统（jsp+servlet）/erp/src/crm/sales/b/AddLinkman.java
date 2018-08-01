package crm.sales.b;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.cls.Replace;
import sys.dao.bean.Linkman;


public class AddLinkman extends HttpServlet
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
		request.setAttribute("success", "添加联系人成功!<a href='infoB?companyid="+compageid+"' class='pagenum' >返回</a>&nbsp;&nbsp;&nbsp;<a href='turn?type=bv&linkmanid="+linkman.getLinkmanid()+"' class='pagenum'>添加拜访记录</a>");
		request.getRequestDispatcher("/succ.jsp").forward(request, response);
	}
}
