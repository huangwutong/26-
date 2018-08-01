<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="eeffff">
  <c:if test="${sessionScope.user==null}">
			<table width="150" border="0">
				<tr>
					<td width="140">
						<form action="userLogin" method="post">
							<c:if test="${requestScope.message!=null}">${requestScope.message}</c:if>
							<p>
								&nbsp;用户名
								<label>
									<input name="uname" type="text" size="16" maxlength="16" />
								</label>
							</p>
							<p>
								&nbsp;密码
								<label></label>
								<label>
									<input name="passwd" type="password" size="16" maxlength="16" />
								</label>
							</p>
							<p>
								<label>
									&nbsp;
									<input type="submit" value="登入" />
									<input type="reset" value="清除" />
								</label>

								
							</p>
						</form>
						<p>
							&nbsp;
						</p>
					</td>
				</tr>
			</table>
		</c:if>
     
      
    <hr size="2" color="pink"/>
   <table width="150">
   
    <tr><td colspan="2" align="center"><div align="center">
						<c:if test="${sessionScope.user!=null}">
							<font color=red size=4>${sessionScope.user}:欢迎你</font>
						</c:if>
						<br>
						<c:if test="${sessionScope.count!=null}">
							<a href="showUser"><font color=blue size=4>当前在线人数&nbsp;${sessionScope.count}&nbsp;人</font></a>
						</c:if>
					</div></td></tr>
   
      <tr><td colspan="2" align="center"><a href="index.jsp?page=jieshao.jsp">公司简介</a></td></tr>
      
      
      <tr> <td colspan="2" align="center"> <a href="index.jsp?page=yehu.jsp">公司业务</a></td></tr>
      <tr> <td colspan="2" align="center"> <a href="index.jsp?page=userRegist.jsp">用户注册</a></td></tr>
      <tr><td colspan="2"align="center"><a href="index.jsp?page=zhuce.jsp">注册显示</a></td></tr>
      <tr> <td colspan="2" align="center"><a href="index.jsp?page=chanpin.jsp">产品类种</a></td></tr>
      <tr><td colspan="2"align="center"><a href="index.jsp?page=huankui.jsp">客户反馈</a></td></tr>
      
      <tr><td colspan="2"align="center"><a href="index.jsp?page=catagorylist.jsp">图书类别信息</a></td></tr>
      <tr><td colspan="2"align="center"><a href="index.jsp?page=booklist.jsp">图书信息</a></td></tr>
      
       <tr><td colspan="2"align="center"> <c:if test="${sessionScope.user!=null}">
							<a href="index.jsp?page=cartItem.jsp">查看购物车</a>
						</c:if></td></tr>
      
      <tr><td colspan="2"align="center"> <a href="index.jsp?page=administer.jsp">后台管理</a></td></tr>
      <tr><td colspan="2"align="center"> <c:if test="${sessionScope.user!=null}">
  	<a href="ExitAdminLoginServlet">退出登录</a>
    </c:if><br></td></tr>
      <tr><td colspan="2"align="center"></td></tr>
    </table>  
  </body>
</html>
