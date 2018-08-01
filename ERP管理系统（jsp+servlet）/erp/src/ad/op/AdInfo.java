package ad.op;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.Bill;

@SuppressWarnings("serial")
public class AdInfo extends HttpServlet
{

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RequestDispatcher rd = request.getRequestDispatcher("ad/select/info.jsp");
		Integer a=Integer.valueOf(request.getParameter("id"));
		Bill bill = new Bill();
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			String sql = "select * from bill where billid = " + a;
			ResultSet rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					bill.setBillId(rs.getInt("billid"));
					bill.setSortId(rs.getInt("sortid"));
					bill.setBillNo(rs.getString("billno"));
					bill.setBillTypeId(rs.getInt("billtype"));
					bill.setBillPrice(rs.getInt("billprice"));
					bill.setBillState(rs.getString("billstate"));
					bill.setBillBargainMoney(rs.getInt("billbargainmoney"));
					bill.setBillBargainTime(rs.getInt("billbargaintime"));
					bill.setBillRemark(rs.getString("billremark"));
					bill.setPersonnelId(rs.getInt("perid"));
					bill.setCompanyId(rs.getInt("comid"));
					request.setAttribute("bill", bill);
				}
			}
			catch (SQLException e)
			{
				request.setAttribute("error", "查找广告位详情出错了");
				rd = request.getRequestDispatcher("/error.jsp");
				e.printStackTrace();
			}
			finally
			{
				cm.close();
			}
		}
		rd.forward(request, response);
	}

}
