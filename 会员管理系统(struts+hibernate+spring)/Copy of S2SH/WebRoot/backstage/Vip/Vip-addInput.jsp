<%@ page language="java" pageEncoding="utf-8"%>
<%@page  contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>addVip</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<STYLE type=text/css> 
body{
 background-color:#708090;
 }
</style>
  </head>
  
  <body>
    <h2>添加会员</h2>
<hr>
		<form action="backstage/Vip/Vip-addInput" method="post">
			学号:
			<input type="text" name="vip.id">
			<br />
			<br />
			姓名:
			<input type="text" name="vip.name">
			<br />
			<br />
			密码:
			<input type="text" name="vip.password">
			<br />
			<br />
			性别:
			<input type="text" name="vip.sex">
			<br />
			<br />
			电话:
			<input type="text" name="vip.telephone">
			<br />
			<br />
			Q&nbsp;&nbsp;Q:
			<input type="text" name="vip.qq">
			<br />
			<br />
			状态:
			<input type="text" name="vip.status">
			<br />
			<br />
			<hr>
			<input type="submit" value="提交">
		</form>

	</body>
</html>
