<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<jsp:useBean id="change" class="BookShop.MyDb" scope="page"/>
</head>
<%  
	//获取修改数据
	String id=(String)session.getAttribute("id");
	String username=(String)request.getParameter("username");
	String password=(String)request.getParameter("password");
	String phone=(String)request.getParameter("phone");
	String email=(String)request.getParameter("email");
	String state=(String)request.getParameter("state");
	String city=(String)request.getParameter("city");
	String address=(String)request.getParameter("address");
	int zip=Integer.parseInt((String)request.getParameter("zip"));
	//转码
	username=change.inStr(username);
	password=change.inStr(password);
	phone=change.inStr(phone);
	email=change.inStr(email);
	state=change.inStr(state);
	city=change.inStr(city);
	address=change.inStr(address);
	//插入注册id
	String sqli="UPDATE customers SET username='"+username+"',password='"+password+"',phone='"+phone+"',email='"+email+"',state='"+state+"',city='"+city+"',address='"+address+"',zip="+zip+" WHERE idcustomer='"+id+"'";
	int temp=-2;
	temp=change.update(sqli);
	if(temp>0){
		session.setAttribute("id",id);
		response.sendRedirect("change_ok.jsp");
	}else{
		session.setAttribute("error","修改失败");
		response.sendRedirect("../error/errorpage.jsp");
	}
%>
</html>