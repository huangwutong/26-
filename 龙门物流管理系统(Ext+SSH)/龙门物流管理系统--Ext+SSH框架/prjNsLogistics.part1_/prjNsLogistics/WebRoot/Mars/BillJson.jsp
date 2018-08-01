<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.struts.form.*"%>
<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BillJson.jsp' starting page</title>
    
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
    System.out.println(pageSize);
     //获取后台的货票数据 
    Vector billvc=(Vector)request.getSession(true).getAttribute("billvc"); 
    
    //变成json字符串 
    String json="{totalProperty:"+ billvc.size() +",root:["; 
    if(billvc.size()-index<pageSize){ 
    for(int i=index;i<billvc.size();i++){ 
    MarsBillInfoForm billf=(MarsBillInfoForm)billvc.get(i);
    json+="{billid:"+ billf.getBillid() +",sendcusname:'"+ billf.getSendcusname() +"',receivecusname:'"+ billf.getReceivecusname() 
    +"',truckline:'"+ billf.getTruckline() +"',payername:'"+ billf.getPayername() +"',username:'"+ billf.getUsername()
    +"',billdata:'"+ billf.getBilldata() +"',billstatename:'"+ billf.getBillstatename() +"',billmemo:'"+ billf.getBillmemo() 
    +"',sendbranchname:'"+ billf.getSendbranchname() +"',receivebranchname:'"+ billf.getReceivebranchname() +"'}";
    if(i!=billvc.size()-1){
    json+=",";
     }
   } 
   json+="]}"; 
   }else{
   for(int i=index;i<pageSize + index;i++){ 
    MarsBillInfoForm billf=(MarsBillInfoForm)billvc.get(i);
   json+="{billid:"+ billf.getBillid() +",sendcusname:'"+ billf.getSendcusname() +"',receivecusname:'"+ billf.getReceivecusname() 
   +"',truckline:'"+ billf.getTruckline() +"',payername:'"+ billf.getPayername() +"',username:'"+ billf.getUsername()
   +"',billdata:'"+ billf.getBilldata() +"',billstatename:'"+ billf.getBillstatename() +"',billmemo:'"+ billf.getBillmemo() 
   +"',sendbranchname:'"+ billf.getSendbranchname() +"',receivebranchname:'"+ billf.getReceivebranchname() +"'}";
     if(i!=pageSize + index -1){
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
