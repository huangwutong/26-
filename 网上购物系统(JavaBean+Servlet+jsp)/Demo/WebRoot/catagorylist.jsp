<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'catagoryinfo.jsp' starting page</title>

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
	
		<hr size="2" color="blue">
		<center><font size="6" color="blue">图书类别信息</font></center>
		<table border="1" width="100%">
			<tr style="color: fuchsia">
				<td>
					类别ID
				</td>
				<td>
					类别名称
				</td>
				<td>
					类别摘要
				</td>
				<c:if test="${sessionScope.user!=null}">
						<td>操作</td>
						</c:if>
				
			</tr>
			<c:if test="${list!=null}">
				<c:forEach var="cata" items="${list}">
					<tr style="color: menutext;">
						<td>
							${cata.crono}
						</td>
						<td>
							${cata.cname}
						</td>
						<td>
							${cata.xeplain}
						</td>
						
					
						<c:if test="${sessionScope.user!=null}">
						<td><a href="showCatagoryBook?crono=${cata.crono}">查看${cata.cname}类别图书信息</a></td>
						</c:if>
						
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<table width="100%"><tr><td>
		<CENTER>
		<a href="pageShowCatagoryList?currentPage=0" >第一页</a>
		<c:if test="${(currentPage-1)>=0}">
		<a href="pageShowCatagoryList?currentPage=${currentPage-1}&totalPage=${totalPage}" >上一页</a>
		</c:if>
		<c:if test="${(currentPage+1)<=(totalPage-1)}">
		<a href="pageShowCatagoryList?currentPage=${currentPage+1}&totalPage=${totalPage}" >下一页</a>
		</c:if>
		<a href="pageShowCatagoryList?currentPage=${totalPage-1}&totalPage=${totalPage}" >最后页</a>
		<font size="4" color="red"><b>当前页：${currentPage+1}&nbsp;
		总页数：${totalPage}
		</b></font>
		</CENTER>
		</td></tr></table>
		<hr size="2" color="blue">
		
	</body>
</html>
