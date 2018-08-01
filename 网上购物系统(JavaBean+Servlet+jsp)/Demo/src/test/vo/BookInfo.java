package test.vo;

public class BookInfo {
	private int bookno;
	private int crono;
	private String bname;
	private String author;
	private String pdate;
	private String publisher;
	private String remark;
	private float price;
	
	public BookInfo() {
		
	}

	public BookInfo(String bname, String author, String pdate,
			String publisher, String remark, float price) {
		
		this.bname = bname;
		this.author = author;
		this.pdate = pdate;
		this.publisher = publisher;
		this.remark = remark;
		this.price = price;
	}

	public BookInfo(int bookno, int crono, String bname, String author,
			String pdate, String publisher, String remark, float price) {
		
		this.bookno = bookno;
		this.crono = crono;
		this.bname = bname;
		this.author = author;
		this.pdate = pdate;
		this.publisher = publisher;
		this.remark = remark;
		this.price = price;
	}

	public int getBookno() {
		return bookno;
	}

	public void setBookno(int bookno) {
		this.bookno = bookno;
	}

	public int getCrono() {
		return crono;
	}

	public void setCrono(int crono) {
		this.crono = crono;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
	
	
}
