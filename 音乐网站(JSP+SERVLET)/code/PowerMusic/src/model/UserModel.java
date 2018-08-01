package model;
import java.sql.Date;
/**
 * 普通用户模块
 */
import java.io.Serializable;

public class UserModel implements Serializable{
	private int userid;
	private String username;
	private String password;
	private String usersex;
	private String useremail;
	private String userqq;
	private int rule;
	private Date regtime;
	
	public UserModel(){
		
	}
	public void setUserid(int userid){
		this.userid = userid;
	}
	public int getUserid(){
		return this.userid;
	}
	public void setUsername(String username){
		this.username = username;
	}
	public String getUsername(){
		return this.username;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public String getPassword(){
		return this.password;
	}
	public void setUsersex(String usersex){
		this.usersex = usersex;
	}
	public String getUsersex(){
		return this.usersex;
	}
	public void setUseremail(String useremail){
		this.useremail = useremail;
	}
	public String getUseremail(){
		return this.useremail;
	}
	public void setUserqq(String userqq){
		this.userqq = userqq;
	}
	public String getUserqq(){
		return this.userqq;
	}
	public void setUserRule(int rule){
		this.rule = rule;
	}
	public int getUserRule(){
		return this.rule;
	}
	public void setRegtime(Date regtime){
		this.regtime = regtime;
	}
	public Date getRegtime(){
		return this.regtime;
	}
}
