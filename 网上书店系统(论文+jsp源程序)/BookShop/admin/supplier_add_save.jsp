<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新增供应商</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<jsp:useBean id="supplier" scope="page" class="BookShop.MyDb" /></head>
</head>
<%
	String suppliername=(String)request.getParameter("suppliername");
	String sname=(String)request.getParameter("sname");
	String phone=(String)request.getParameter("phone");
	String address=(String)request.getParameter("address");
		suppliername=supplier.inStr(suppliername);
		sname=supplier.inStr(sname);
		phone=supplier.inStr(phone);
		address=supplier.inStr(address);
	String sqls="SELECT * FROM supplier WHERE suppliername='"+suppliername+"'";
	String sqli="INSERT INTO supplier(suppliername,sname,phone,address) VALUES('"+suppliername+"','"+sname+"','"+phone+"','"+address+"')";
	int temp=-2;
	temp=supplier.select(sqls);
	if(temp>0){
		out.println("<script>alert('出版商以存在');history.go(-1);</script>");
	}else{
		temp=0;
		temp=supplier.update(sqli);
		response.sendRedirect("supplier.jsp");
	}
%>
</html>
