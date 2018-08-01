<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="com.struts.form.MarsBranchInfoForm"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Branchshow.jsp' starting page</title>
    
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
    Vector branchvc=(Vector)request.getSession(true).getAttribute("branchvc");
    //变成json字符串 
    String json="{totalProperty:"+ branchvc.size() +",root:["; 
   	if(branchvc.size()-index<pageSize){ 
    for(int i=index;i<branchvc.size();i++){ 
     MarsBranchInfoForm branchf=(MarsBranchInfoForm)branchvc.get(i);
     json+="{branchid:"+ branchf.getBranchid() +",branchname:'"+ branchf.getBranchname() +"',branchlinkman:'"+ branchf.getBranchlinkman() 
     +"',branchphone:'"+ branchf.getBranchphone() +"',branchaddress:'"+ branchf.getBranchaddress()+"',branchemail:'"+ branchf.getBranchemail() 
     +"'}";
     if(i!=branchvc.size()-1){
     json+=",";
     }
   } 
    json+="]}"; 
    }else{
    for(int i=index;i<pageSize + index;i++){ 
     MarsBranchInfoForm branchf=(MarsBranchInfoForm)branchvc.get(i);
     json+="{branchid:"+ branchf.getBranchid() +",branchname:'"+ branchf.getBranchname() +"',branchlinkman:'"+ branchf.getBranchlinkman() 
     +"',branchphone:'"+ branchf.getBranchphone() +"',branchaddress:'"+ branchf.getBranchaddress()+"',branchemail:'"+ branchf.getBranchemail() 
     +"'}";
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
