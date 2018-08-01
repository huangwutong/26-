package test.vo;

import java.util.Date;

public class Order {
	private int orderno;
	private String uname;
	private int status;
	private int userno;
	private Date orderdate;

	public Order(int orderno, String uname, int status, int userno,
			Date orderdate) {

		this.orderno = orderno;
		this.uname = uname;
		this.status = status;
		this.userno = userno;
		this.orderdate = orderdate;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public Order() {
		// TODO Auto-generated constructor stub
	}

}
