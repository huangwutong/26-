package model;
import java.io.Serializable;
import java.sql.Date;

/************************
 **@管理员模块
 * 
 ******************/
public class AdminModel implements Serializable{
	private String adminname;
	private String adminpwd;
	private int adminid;
	private Date regtime;
	
	public void setAdminname(String adminname){
		this.adminname = adminname;
	}
	public String getAdminname(){
		return this.adminname;
	}
	public void setAdminpwd(String adminpwd){
		this.adminpwd = adminpwd;
	}
	public String getAdminpwd(){
		return this.adminpwd;
	}
	public void setAdminid(int adminid){
		this.adminid = adminid;
	}
	public int getAdminid(){
		return this.adminid;
	}
	public void setRegtime(Date regtime){
		this.regtime = regtime;
	}
	public Date getRegtime(){
		return this.regtime;
	}
}
