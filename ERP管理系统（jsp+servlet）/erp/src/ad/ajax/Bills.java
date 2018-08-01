package ad.ajax;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Bill;
import sys.dao.bean.Personnel;
import sys.dao.bean.Sort;

@SuppressWarnings("serial")
public class Bills extends HttpServlet
{

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Integer a=Integer.valueOf(request.getParameter("a"));
		String backtrack ="";
		Sort sort = new Sort();
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			String sql = "select * from sort where sortid = " + a;
			ResultSet rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					sort.setSortId(rs.getInt("sortid"));
					sort.setIndustryId(rs.getInt("industryid"));
					sort.setSortName(rs.getString("sortname"));
					sort.setUrl(rs.getString("url"));
				}
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				cm.close();
			}
		}
		backtrack = "<table width='100%' border='0' cellpadding='8' cellspacing='1' class='contentArea'>";
		backtrack=backtrack +
		"<tr><td class='searchBar'>广告位编号</td><td class='searchBar'>状态</td>" +
		"<td class='searchBar'>类型</td><td class='searchBar'>报价</td><td class='searchBar'>广告位操作</td><td class='searchBar'>广告位详情</td></tr>";
		List<Bill> bills = sort.getBills();
		if (bills!=null)
		{
			for (int i = 0; i < bills.size(); i++)
			{
				Bill bill = bills.get(i);
				backtrack=backtrack +
				"<tr><td class='searchBar'>"+bill.getBillNo()+"</td><td class='searchBar'>";
				if ("A".equals(bill.getBillState()))
				{
					backtrack=backtrack + "闲置";
				}
				if ("B".equals(bill.getBillState()))
				{
					backtrack=backtrack + "已预定";
				}
				if ("C".equals(bill.getBillState()))
				{
					backtrack=backtrack + "已售出";
				}
				backtrack=backtrack+"</td>" +
				"<td class='searchBar'>"+bill.getBillType().getBillTypeName()+"</td><td class='searchBar'>"+
				bill.getBillPrice()+"</td>";
				backtrack=backtrack+"<td class='searchBar'>&nbsp;";
				if (((Personnel)request.getSession().getAttribute("user")).getDept().getDeptname().indexOf("市场")>=0)
				{
					backtrack=backtrack+"<a href=javascript:update('"+bill.getBillNo()+"',"+bill.getBillType().getBillTypeId()+",'"+
					bill.getBillPrice()+"','"+bill.getBillRemark()+"',"+bill.getBillId()+"); class='pagenum'>修改</a>";
				}
				if (((Personnel)request.getSession().getAttribute("user")).getDept().getDeptname().indexOf("广告")>=0&&"A".equals(bill.getBillState()))
				{
					backtrack=backtrack+"<a href='turn?type=destine&id="+bill.getBillId()+"' class='pagenum'>预定</a>";
				}
				if (((Personnel)request.getSession().getAttribute("user")).getDept().getDeptname().indexOf("广告")>=0&&"A".equals(bill.getBillState()))
				{
					backtrack=backtrack+"<a href='#' class='pagenum'>续定</a>";
				}
				backtrack=backtrack+"</td>";
				backtrack=backtrack+"<td class='searchBar'><a href=AdInfo?id="+bill.getBillId()+" class='pagenum'>详情</a></td></tr>";
			}
		}
		backtrack =backtrack +"</table></br>";
		backtrack = backtrack +"<img Width=770 src='"+sort.getUrl()+"'/>";
		response.getWriter().println(backtrack);
	}
}
