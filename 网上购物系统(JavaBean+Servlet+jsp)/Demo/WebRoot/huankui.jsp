<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'huankui.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="#eeffff">
  <h2 align="center">用户反馈</h2>
  <form method="post" action="param.jsp">
         <p>姓名：<input type="text" name="username" size="15"/></p>
         <p>密码：<input type="password" name="password" size="15"/></p>
         
         <p>产品质量：<select name="old">
                 <option value="10">好</option>
                 <option value="20">一般</option>
                 <option value="30">很好</option>
                 <option value="40">差</option>
                 </select>
                 </p>
         <p>产品风格：<input type="checkbox" name="habit" value="Reading"/>美观
                 <input type="checkbox" name="habit" value="Movie"/>流行
                 <input type="checkbox" name="habit" value="Travel"/>一般
                 <input type="checkbox" name="habit" value="Music"/>落伍
                 <input type="checkbox" name="habit" value="Sports"/>时尚</p>
                 
                 
          <p>用户意见:<textarea rows="8" cols="30"></textarea></p>      
                 
         <p>     <input type="submit" value="提交">
                 <input type="reset" value="清除">
         </p>
         </form>
  </body>
</html>
