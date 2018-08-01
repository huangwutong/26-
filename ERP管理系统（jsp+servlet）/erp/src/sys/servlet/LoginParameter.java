package sys.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sys.dao.ConnectManager;
import sys.dao.bean.BillType;
import sys.dao.bean.Dept;
import sys.dao.bean.District;
import sys.dao.bean.Industry;
import sys.dao.bean.Position;

public class LoginParameter extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		ResultSet rs = null;
		String sql = "select * from Dept where gradeid is null";
		ConnectManager cm = ConnectManager.newInstance();
		if (cm.getConnection())
		{
			rs = cm.executeQuery(sql);
			try
			{
				if (rs.next())
				{
					List<Dept> list = new ArrayList<Dept>();
					do
					{
						Dept dept = new Dept();
						dept.setDeptid(rs.getInt("deptid"));
						dept.setGradeid(rs.getInt("gradeid"));
						dept.setDeptname(rs.getString("deptname"));
						dept.setMoneyaim(rs.getInt("moneyaim"));
						dept.setA(rs.getInt("A"));
						dept.setB(rs.getInt("B"));
						dept.setCleartime(rs.getInt("cleartime"));
						list.add(dept);
					}
					while (rs.next());
					request.getSession().getServletContext().setAttribute("dept", list);
				}
				rs.close();

				sql = "select * from position";
				rs = cm.executeQuery(sql);
				if (rs.next())
				{
					List<Position> list = new ArrayList<Position>();
					do
					{
						Position position = new Position();
						position.setPositionid(rs.getInt("positionid"));
						position.setJob(rs.getString("job"));
						list.add(position);
					}
					while (rs.next());
					request.getSession().getServletContext().setAttribute("position", list);
				}
				rs.close();
				
				sql = "select * from district where superiorid is null";
				rs = cm.executeQuery(sql);
				if (rs.next())
				{
					List<District> list = new ArrayList<District>();
					do
					{
						District dis = new District();
						dis.setDistrictid(rs.getInt("districtid"));
						dis.setSuperiorid(rs.getInt("superiorid"));
						dis.setDistrict(rs.getString("district"));
						list.add(dis);
					}
					while (rs.next());
					request.getSession().getServletContext().setAttribute("district", list);
				}
				rs.close();
				sql = "select * from industry order by industry";
				rs = cm.executeQuery(sql);
				if (rs.next())
				{
					List<Industry> list = new ArrayList<Industry>();
					do
					{
						Industry industry = new Industry();
						industry.setIndustryid(rs.getInt("industryid"));
						industry.setIndustry(rs.getString("industry"));
						industry.setIslock(rs.getByte("islock"));
						list.add(industry);
					}
					while (rs.next());
					request.getSession().getServletContext().setAttribute("industrys", list);
				}
				rs.close();
				sql = "select * from industry where islock = 0";
				rs = cm.executeQuery(sql);
				if (rs.next())
				{
					List<Industry> list = new ArrayList<Industry>();
					do
					{
						Industry industry = new Industry();
						industry.setIndustryid(rs.getInt("industryid"));
						industry.setIndustry(rs.getString("industry"));
						industry.setIslock(rs.getByte("islock"));
						list.add(industry);
					}
					while (rs.next());
					request.getSession().getServletContext().setAttribute("industry", list);
				}
				rs.close();
				sql = "select * from billtype";
				rs = cm.executeQuery(sql);
				if (rs.next())
				{
					List<BillType> list = new ArrayList<BillType>();
					do
					{
						BillType billType = new BillType();
						billType.setBillTypeId(rs.getInt("billtypeid"));
						billType.setBillTypeName(rs.getString("billtypename"));
						list.add(billType);
					}
					while (rs.next());
					request.getSession().getServletContext().setAttribute("billType", list);
				}
				rs.close();
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
	}
}
