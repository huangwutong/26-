package test.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import test.util.DbConnectionService;
import test.vo.Order;

public class OrderServiceImpl implements IOrderService {
	private Connection conn;
	private ResultSet res;
	private Statement stmt;

	public OrderServiceImpl() {
		conn = DbConnectionService.getConnection();
	}

	

	public Order SaveObject(Order o) {
		Order order = new Order();
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			String sql = "insert into orders(uname,status,userno,orderdate) values"
					+ "('" + o.getUname() + "'," + o.getStatus() + ","
					+ o.getUserno() + ",'"+dateFormat.format(date)+"')";
			stmt = conn.createStatement();
			int c = stmt.executeUpdate(sql);
						
			String sql2 = "select * from orders ";
			res = stmt.executeQuery(sql2);
			while (res.next()) {
				int orderno = res.getInt(1);
				String uname = res.getString(3);
				int status = res.getInt(4);
				int userno = res.getInt(2);
				Date orderdate = res.getDate(5);
				
				order = new Order(orderno,uname,status,userno,orderdate);
				
			}
			if (c > 0)
				return order;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			
		}
		return order;
	}

	public boolean DeleteObject(int orderno) {
		try {
			String sql = "delete from orders where orderno=" + orderno;
			stmt = conn.createStatement();
			int c = stmt.executeUpdate(sql);
			if (c > 0)
				return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			
		}
		return false;
	}

	public boolean UpdateObject(int orderno) {
		try {
			String sql = "update orders set status=1 where orderno=" + orderno;
			String sql2 = "update orderdetail set status=1 where orderno="
					+ orderno;
			stmt = conn.createStatement();
			int c = stmt.executeUpdate(sql);
			int d = stmt.executeUpdate(sql2);
			if (c > 0 || d > 0)
				return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			
		}
		return false;
	}

	public List getAllOrdersByuserID(int userno) {
		List orders = new ArrayList();
		try {
			stmt = conn.createStatement();
			String sql = "select * from orders where userno="+ userno ;
			res = stmt.executeQuery(sql);
			while (res.next()) {
				int orderno = res.getInt(1);
				String uname = res.getString(3);
				int status = res.getInt(4);
				int userno1 = res.getInt(2);
				Date orderdate = res.getDate(5);
				
				Order o = new Order(orderno,uname,status,userno1,orderdate);
				orders.add(o);
				
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			
		}
		return orders;
	}

	public List getAllOrders() {
		List orders = new ArrayList();
		try {
			stmt = conn.createStatement();
			res = stmt.executeQuery("select * from orders order by orderno");
			while (res.next()) {
				
				int orderno = res.getInt(1);
				String uname = res.getString(3);
				int status = res.getInt(4);
				int userno = res.getInt(2);
				Date orderdate = res.getDate(5);
				
				Order o = new Order(orderno,uname,status,userno,orderdate);
				orders.add(o);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			
		}
		return orders;
	}

	public Order getOneOrderByorderID(int orderno) {
		Order order = new Order();
		try {
			String sql = "select * from orders where orderno=" + orderno + " ";
			stmt = conn.createStatement();
			res = stmt.executeQuery(sql);
			if (res.next()) {
				order = new Order(res.getInt(1), res.getString(2), res
						.getInt(3), res.getInt(4), res.getDate(5));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			
		}
		return order;
	}

	

	
}
