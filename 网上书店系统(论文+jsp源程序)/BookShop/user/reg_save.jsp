<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<jsp:useBean id="reg" class="BookShop.MyDb" scope="page"/>
</head>
<%  
	//获取注册数据
	String id=(String)request.getParameter("id");
	String username=(String)request.getParameter("username");
	String password=(String)request.getParameter("password");
	String phone=(String)request.getParameter("phone");
	String email=(String)request.getParameter("email");
	String state=(String)request.getParameter("state");
	String city=(String)request.getParameter("city");
	String address=(String)request.getParameter("address");
	int zip=Integer.parseInt((String)request.getParameter("zip"));
	//转码
	id=reg.inStr(id);
	username=reg.inStr(username);
	password=reg.inStr(password);
	phone=reg.inStr(phone);
	email=reg.inStr(email);
	state=reg.inStr(state);
	city=reg.inStr(city);
	address=reg.inStr(address);
	//插入注册id
	String sqli="INSERT INTO customers(idcustomer,username,password,phone,email,state,city,address,zip) VALUES('"+id+"','"+username+"','"+password+"','"+phone+"','"+email+"','"+state+"','"+city+"','"+address+"','"+zip+"')";
	int temp=-2;
	temp=reg.update(sqli);
	if(temp>0){
		session.setAttribute("id",id);
		response.sendRedirect("reg_ok.jsp");
	}else{
		session.setAttribute("error","注册失败");
		response.sendRedirect("../error/errorpage.jsp");
	}
%>
</html>