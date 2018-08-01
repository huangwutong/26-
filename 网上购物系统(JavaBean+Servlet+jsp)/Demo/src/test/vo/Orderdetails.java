package test.vo;

public class Orderdetails {
	private int orderdetailno;
	private int orderno;
	private String uname;
	private String address;
	private String bname;
	private double price;
	private int num;
	private int status;

	public Orderdetails(int orderdetailno, int orderno, String uname,
			String address, String bname, double price, int num, int status) {

		this.orderdetailno = orderdetailno;
		this.orderno = orderno;
		this.uname = uname;
		this.address = address;
		this.bname = bname;
		this.price = price;
		this.num = num;
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getOrderdetailno() {
		return orderdetailno;
	}

	public void setOrderdetailno(int orderdetailno) {
		this.orderdetailno = orderdetailno;
	}

	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
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

	public Orderdetails() {

	}
}
