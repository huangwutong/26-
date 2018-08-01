<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.struts.form.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Customershow.jsp' starting page</title>
    
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
   //获取分页参数 
    String start=request.getParameter("start").toString(); 
    String limit=request.getParameter("limit").toString(); 
    int index=Integer.parseInt(start); 
    int pageSize=Integer.parseInt(limit); 
    //获取后台用户数据
    Vector customervc=(Vector)request.getSession(true).getAttribute("customervc");
    //变成json字符串 
    String json="{totalProperty:"+ customervc.size() +",root:["; 
   	if(customervc.size()-index<pageSize){ 
    for(int i=index;i<customervc.size();i++){ 
     MarsCustomerInfoForm customerf=(MarsCustomerInfoForm)customervc.get(i);
     json+="{customerid:"+ customerf.getCustomerid() +",customername:'"+ customerf.getCustomername() +"',customerlinkman:'"+ customerf.getCustomerlinkman() 
     +"',customersex:'"+ customerf.getCustomersex() +"',customerphone:'"+ customerf.getCustomerphone()+"',customerfax:'"+ customerf.getCustomerfax() 
     +"',customerpostid:'"+ customerf.getCustomerpostid() +"',customeremail:'"+ customerf.getCustomeremail() +"',customerregdata:'"+ customerf.getCustomerregdata() 
     +"',branchid:'"+ customerf.getBranchid() +"'}";
     if(i!=customervc.size()-1){
     json+=",";
     }
   } 
    json+="]}"; 
    }else{
    for(int i=index;i<pageSize + index;i++){ 
     MarsCustomerInfoForm customerf=(MarsCustomerInfoForm)customervc.get(i);
     json+="{customerid:"+ customerf.getCustomerid() +",customername:'"+ customerf.getCustomername() +"',customerlinkman:'"+ customerf.getCustomerlinkman() 
     +"',customersex:'"+ customerf.getCustomersex() +"',customerphone:'"+ customerf.getCustomerphone() +"',customerfax:'"+ customerf.getCustomerfax() 
     +"',customerpostid:'"+ customerf.getCustomerpostid() +"',customeremail:'"+ customerf.getCustomeremail() +"',customerregdata:'"+ customerf.getCustomerregdata() 
     +"',branchid:'"+ customerf.getBranchid() +"'}";
     if(i!=pageSize + index-1){
     json+=",";
     }
    } 
    json+="]}"; 
    }
    response.getWriter().write(json);
    response.getWriter().close();
   %>
   
  </body>
</html>
