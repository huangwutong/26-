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
    <title>My JSP 'Truckshow.jsp' starting page</title>

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
    Vector truckvc=(Vector)request.getSession(true).getAttribute("truckvc");
    //变成json字符串 
    String json="{totalProperty:"+ truckvc.size() +",root:["; 
   	if(truckvc.size()-index<pageSize){ 
    for(int i=index;i<truckvc.size();i++){ 
     MarsTruckInfoForm truckf=(MarsTruckInfoForm)truckvc.get(i);
     json+="{truckid:"+ truckf.getTruckid() +",truckenginenum:'"+ truckf.getTruckenginenum() +"',truckrunnum:'"+ truckf.getTruckrunnum() 
     +"',truckinsurancenum:'"+ truckf.getTruckinsurancenum() +"',truckcolor:'"+ truckf.getTruckcolor()+"',truckphoto:'"+ truckf.getTruckphoto() 
     +"',trucknum:'"+ truckf.getTrucknum() +"',tmid:'"+ truckf.getTmid() +"',truckbuydata:'"+ truckf.getTruckbuydata() 
     +"',branchid:'"+ truckf.getBranchid() +"',truckisvacancy:'"+ truckf.getTruckisvacancy() +"'}";
     if(i!=truckvc.size()-1){
     json+=",";
     }
   } 
    json+="]}"; 
    }else{
    for(int i=index;i<pageSize + index;i++){ 
     MarsTruckInfoForm truckf=(MarsTruckInfoForm)truckvc.get(i);
     json+="{truckid:"+ truckf.getTruckid() +",truckenginenum:'"+ truckf.getTruckenginenum() +"',truckrunnum:'"+ truckf.getTruckrunnum() 
     +"',truckinsurancenum:'"+ truckf.getTruckinsurancenum() +"',truckcolor:'"+ truckf.getTruckcolor()+"',truckphoto:'"+ truckf.getTruckphoto() 
     +"',trucknum:'"+ truckf.getTrucknum() +"',tmid:'"+ truckf.getTmid() +"',truckbuydata:'"+ truckf.getTruckbuydata() 
     +"',branchid:'"+ truckf.getBranchid() +"',truckisvacancy:'"+ truckf.getTruckisvacancy() +"'}";
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
