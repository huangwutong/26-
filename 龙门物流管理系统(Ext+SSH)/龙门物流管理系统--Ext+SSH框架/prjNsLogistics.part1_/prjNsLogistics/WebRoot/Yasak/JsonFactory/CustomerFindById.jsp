<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.struts.form.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'CustomerFindById.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    	Yasak_CustomerForm ycf = (Yasak_CustomerForm)request.getAttribute("cusId");
    	String json = "{totalProperty:1,root:[";
    		json+="{";
    		json+="customerId:'"+ycf.getCustomerId()+"',";
    		json+="customerName:'"+ycf.getCustomerName()+"',";
    		json+="customerLinkMan:'"+ycf.getCustomerLinkMan()+"',";
    		json+="customerSex:'"+ycf.getCustomerSex()+"',";
    		json+="customerPhone:'"+ycf.getCustomerPhone()+"',";
    		json+="customerFax:'"+ycf.getCustomerFax()+"',";
    		json+="customerPostId:'"+ycf.getCustomerPostId()+"',";
    		json+="customerEmail:'"+ycf.getCustomerEmail()+"',";
    		json+="customerRegData:'"+ycf.getCustomerRegData()+"',";
    		json+="branchId:'"+ycf.getBranchId()+"',";
    		json+="}";
    	json+="]}";
    	
    	response.getWriter().write(json);
    	response.getWriter().close();
     %>
  </body>
</html>
