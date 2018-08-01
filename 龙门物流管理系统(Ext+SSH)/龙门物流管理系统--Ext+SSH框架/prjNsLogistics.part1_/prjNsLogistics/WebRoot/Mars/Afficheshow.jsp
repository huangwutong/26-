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
		<title>My JSP 'Afficheshow.jsp' starting page</title>

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
    Vector affichevc=(Vector)request.getSession(true).getAttribute("affichevc");
    //变成json字符串 
    String json="{totalProperty:"+ affichevc.size() +",root:["; 
    
   	if(affichevc.size()-index<pageSize){ 
   	
    for(int i=index;i<affichevc.size();i++){ 
    
     MarsAfficheInfoForm affichef=(MarsAfficheInfoForm)affichevc.get(i);
     json+="{afficheid:"+ affichef.getAfficheid() +",userid:'"+ affichef.getUserid() +"',affichetitle:'"+ affichef.getAffichetitle() 
     +"',affichecontent:'"+ affichef.getAffichecontent() +"',affichedata:'"+ affichef.getAffichedata()+"',branchid:'"+ affichef.getBranchid() 
     +"'}";
     if(i!=affichevc.size()-1){
     json+=",";
     }
   } 
    json+="]}"; 
    
    }else{
    
   for (int i = index; i < pageSize + index; i++) {
     MarsAfficheInfoForm affichef=(MarsAfficheInfoForm)affichevc.get(i);
     json+="{afficheid:"+ affichef.getAfficheid() +",userid:'"+ affichef.getUserid() +"',affichetitle:'"+ affichef.getAffichetitle() 
     +"',affichecontent:'"+ affichef.getAffichecontent() +"',affichedata:'"+ affichef.getAffichedata()+"',branchid:'"+ affichef.getBranchid() 
     +"'}";
     if(i != pageSize + index - 1){
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
