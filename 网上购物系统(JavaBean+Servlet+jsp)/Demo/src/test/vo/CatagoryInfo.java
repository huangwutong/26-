package test.vo;

public class CatagoryInfo {
	
	private int crono;
	private String cname;
	private String xeplain;
	public CatagoryInfo() {
		
	}
	
	public CatagoryInfo(String cname, String xeplain) {
		
		this.cname = cname;
		this.xeplain = xeplain;
	}

	public CatagoryInfo(int crono, String cname, String xeplain) {
		
		this.crono = crono;
		this.cname = cname;
		this.xeplain = xeplain;
	}

	public int getCrono() {
		return crono;
	}

	public void setCrono(int crono) {
		this.crono = crono;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getXeplain() {
		return xeplain;
	}

	public void setXeplain(String xeplain) {
		this.xeplain = xeplain;
	}

	
}
