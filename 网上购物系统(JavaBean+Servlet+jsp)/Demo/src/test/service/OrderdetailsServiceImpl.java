package test.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import test.util.DbConnectionService;
import test.vo.BookInfo;
import test.vo.Order;
import test.vo.Orderdetails;

public class OrderdetailsServiceImpl implements IOrderdetailsService {
	private Connection conn;
	private ResultSet res;
	private Statement stmt;

	public OrderdetailsServiceImpl() {
		conn = DbConnectionService.getConnection();
	}

	public boolean SaveObject(Orderdetails o) {
		try {
			String sql = "insert into orderdetail(ORDERNO,UNAME,ADDRESS,BNAME,PRICE,NUM,STATUS)values("
					+ o.getOrderno()
					+ ",'"
					+ o.getUname()
					+ "','"
					+ o.getAddress()
					+ "','"
					+ o.getBname()
					+ "',"
					+ o.getPrice()
					+ ","
					+ o.getNum()
					+ ","
					+ o.getStatus()
					+ ")";
			stmt = conn.createStatement();
			int c = stmt.executeUpdate(sql);
			if (c > 0)
				return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean DeleteObject(int odID) {
		try {
			String sql = "delete from orderdetail where orderdetailno=" + odID;
			stmt = conn.createStatement();
			int c = stmt.executeUpdate(sql);
			if (c > 0)
				return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean DeleteObjectByorderID(int orderID) {
		try {
			String sql = "delete from orderdetail where orderno=" + orderID;
			stmt = conn.createStatement();
			int c = stmt.executeUpdate(sql);
			if (c > 0)
				return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public boolean UpdateObject(Orderdetails o) {
		return false;
	}

	public Order getOneOrderdetailByoID(int odID) {
		return null;
	}

	public List getAllOrderdetailsByoID(int odID) {
		List o = new ArrayList();
		try {
			String sql = "select * from orderdetail where ORDERNO=" + odID
					+ " order by ORDERDETAILNO";
			stmt = conn.createStatement();
			res = stmt.executeQuery(sql);
			while (res.next()) {
				Orderdetails orderdetails = new Orderdetails();
				Orderdetails od = new Orderdetails(res.getInt(1), res
						.getInt(2), res.getString(3), res.getString(4), res
						.getString(5), res.getDouble(6), res.getInt(7), res
						.getInt(8));
				o.add(od);
			}
		} catch (SQLException ex) {
		}
		return o;
	}

	public List getAllOrderdetails() {
		List o = new ArrayList();
		try {
			stmt = conn.createStatement();
			res = stmt
					.executeQuery("select * from orderdetail  order by ORDERDETAILNO");
			while (res.next()) {
				Orderdetails od = new Orderdetails(res.getInt(1), res
						.getInt(2), res.getString(3), res.getString(4), res
						.getString(5), res.getDouble(6), res.getInt(7), res
						.getInt(8));
				o.add(od);
			}
		} catch (SQLException ex) {
		}
		return o;
	}
	
	public Orderdetails getOrderdetails(int ordID)
	{
		Orderdetails orderdetails = new Orderdetails();
		try {
			stmt = conn.createStatement();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			String sql = "select * from orderdetail where orderno='"+ordID+"'" ;
			System.out.println(sql);
			try {
			res = stmt.executeQuery(sql);
			while(res.next())
			{
				orderdetails.setAddress(res.getString(4));
				orderdetails.setBname(res.getString(5));
				orderdetails.setNum(res.getInt(7));
				orderdetails.setOrderdetailno(res.getInt(1));
				orderdetails.setOrderno(res.getInt(2));
				orderdetails.setPrice(res.getDouble(6));
				orderdetails.setStatus(res.getInt(8));
				orderdetails.setUname(res.getString(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return orderdetails;
	}

	
}
