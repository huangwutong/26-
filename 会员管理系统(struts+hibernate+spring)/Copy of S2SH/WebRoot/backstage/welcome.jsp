<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("id");
if(id==null){
     id = "admin";
     }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
</head>
<body>
<center>欢迎管理员:&nbsp;&nbsp;<u><%=id %></u></center>
</BODY>
</HTML>
