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
    <title>My JSP 'Drivershow.jsp' starting page</title>

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
    Vector drivervc=(Vector)request.getSession(true).getAttribute("drivervc");
    //变成json字符串 
    String json="{totalProperty:"+ drivervc.size() +",root:["; 
   	if(drivervc.size()-index<pageSize){ 
    for(int i=index;i<drivervc.size();i++){ 
     MarsDriverInfoForm driverf=(MarsDriverInfoForm)drivervc.get(i);
     json+="{driverid:"+ driverf.getDriverid() +",branchid:'"+ driverf.getBranchid() +"',drivername:'"+ driverf.getDrivername() 
     +"',driverage:'"+ driverf.getDriverage() +"',driversex:'"+ driverf.getDriversex()+"',driverphoto:'"+ driverf.getDriverphoto() 
     +"',driverdrivecardid:'"+ driverf.getDriverdrivecardid() +"',drivercardid:'"+ driverf.getDrivercardid() +"',driverphone:'"+ driverf.getDriverphone() 
     +"',drivermemo:'"+ driverf.getDrivermemo() +"',driverisvacancy:'"+ driverf.getDriverisvacancy() +"'}";
     if(i!=drivervc.size()-1){
     json+=",";
     }
   } 
    json+="]}"; 
    }else{
    for(int i=index;i<pageSize + index;i++){ 
      MarsDriverInfoForm driverf=(MarsDriverInfoForm)drivervc.get(i);
     json+="{driverid:"+ driverf.getDriverid() +",branchid:'"+ driverf.getBranchid() +"',drivername:'"+ driverf.getDrivername() 
     +"',driverage:'"+ driverf.getDriverage() +"',driversex:'"+ driverf.getDriversex()+"',driverphoto:'"+ driverf.getDriverphoto() 
     +"',driverdrivecardid:'"+ driverf.getDriverdrivecardid() +"',drivercardid:'"+ driverf.getDrivercardid() +"',driverphone:'"+ driverf.getDriverphone() 
     +"',drivermemo:'"+ driverf.getDrivermemo() +"',driverisvacancy:'"+ driverf.getDriverisvacancy() +"'}";
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
