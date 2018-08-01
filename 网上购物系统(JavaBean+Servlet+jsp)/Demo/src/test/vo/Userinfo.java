package test.vo;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class Userinfo implements HttpSessionBindingListener{
	
private int	userno;
private String uname;
private String passwd;   
private String usex;
private String uinterest;
private String email;                
private String address;              
private String telephone;            
private String city; 
private UserList userList=UserList.getInstance();

public Userinfo() {
	
}
public Userinfo(String uname) {
	
	this.uname = uname;
}

public Userinfo(int userno, String uname, String passwd) {
	
	this.userno = userno;
	this.uname = uname;
	this.passwd = passwd;
}

public Userinfo(int userno, String uname, String passwd, String usex,
		String uinterest, String email, String address, String telephone,
		String city) {
	
	this.userno = userno;
	this.uname = uname;
	this.passwd = passwd;
	this.usex = usex;
	this.uinterest = uinterest;
	this.email = email;
	this.address = address;
	this.telephone = telephone;
	this.city = city;
	
}



public String getUinterest() {
	return uinterest;
}



public void setUinterest(String uinterest) {
	this.uinterest = uinterest;
}



public int getUserno() {
	return userno;
}


public void setUserno(int userno) {
	this.userno = userno;
}


public String getUname() {
	return uname;
}


public void setUname(String uname) {
	this.uname = uname;
}


public String getPasswd() {
	return passwd;
}


public void setPasswd(String passwd) {
	this.passwd = passwd;
}


public String getUsex() {
	return usex;
}

public void setUsex(String usex) {
	this.usex = usex;
}

public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public String getAddress() {
	return address;
}


public void setAddress(String address) {
	this.address = address;
}


public String getTelephone() {
	return telephone;
}


public void setTelephone(String telephone) {
	this.telephone = telephone;
}


public String getCity() {
	return city;
}


public void setCity(String city) {
	this.city = city;
}


public void valueBound(HttpSessionBindingEvent event) {
	userList.addUser(uname);
}


public void valueUnbound(HttpSessionBindingEvent event) {
	userList.removeUser(uname);	
}




}
