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
    
    <title>My JSP 'UserinfoShow.jsp' starting page</title>
    
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
    //获取后台用户信息
    Vector uservc=(Vector)request.getSession(true).getAttribute("uservc");
    //转换成json数组
    String json="{totalProperty:"+ uservc.size() +",root:["; 
    if(uservc.size()-index<pageSize){ 
    for(int i=index;i<uservc.size();i++){ 
     MarsUserInfoForm userf=(MarsUserInfoForm)uservc.get(i);
     
     json+="{userid:"+ userf.getUserid() +",username:'"+ userf.getUsername() +"',branchid:'"+ userf.getBranchid() 
     +"',userrname:'"+ userf.getUsername() +"',userpassword:'"+ userf.getUserpassword() +"',usersex:'"+ userf.getUsersex() 
     +"',departmentname:'"+ userf.getDepartmentname() +"',userphone:'"+ userf.getUserphone() +"',usercardid:'"+ userf.getUsercardid() 
     +"',userrolename:'"+ userf.getUserrolename() +"',userloginnum:'"+ userf.getUserloginnum() +"',userregdata:'"+ userf.getUserregdata() +"'}";
     if(i!=uservc.size()-1){
     json+=",";
     }
   } 
    json+="]}"; 
    }else{
    for(int i=index;i<uservc.size();i++){ 
     MarsUserInfoForm userf=(MarsUserInfoForm)uservc.get(i);
     json+="{userid:"+ userf.getUserid() +",username:'"+ userf.getUsername() +"',branchid:'"+ userf.getBranchid() 
     +"',userrname:'"+ userf.getUsername() +"',userpassword:'"+ userf.getUserpassword() +"',usersex:'"+ userf.getUsersex() 
     +"',departmentname:'"+ userf.getDepartmentname() +"',userphone:'"+ userf.getUserphone() +"',usercardid:'"+ userf.getUsercardid() 
     +"',userrolename:'"+ userf.getUserrolename() +"',userloginnum:'"+ userf.getUserloginnum() +"',userlogindata:'"+ userf.getUserlogindata() +"',userregdata:'"+ userf.getUserregdata() +"'}";
     if(i!=uservc.size()-1){
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
