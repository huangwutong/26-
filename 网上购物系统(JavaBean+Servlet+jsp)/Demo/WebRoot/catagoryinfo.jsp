<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<jsp:useBean id="catagorys" class="test.service.CatagoryServiceImpl"></jsp:useBean>
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
	<script type="text/javascript">
  function checkField()
	{
	
	if(document.catagory1.cataName.value=="")
  		{
  		alert("请输入类别名称");
  		
  		document.catagory1.cataName.focus();
  		return false;
  		}
  	if(document.catagory1.cataContent.value=="")
  		{
  		alert("请输入类别名称");
  		
  		document.catagory1.cataContent.focus();
  		return false;
  		}	
	}
    </script>
	
	
	
	
	
	

	<body bgcolor="#eeffff">
	<a href="index.jsp?page=manage.jsp">管理界面</a>
		<hr size="2" color="blue">
		<center><font size="6" color="blue">图书类别管理</font></center>
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
				<td>
					操作
				</td>
			</tr>
			<c:if test="${catagorys.catagorys!=null}">
				<c:forEach var="cata" items="${catagorys.catagorys}">
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
						<td>
							<a href="delCatagoryInfo?catano=${cata.crono}">删除</a>&nbsp;
							<a href="updateCatagoryInfo?catano=${cata.crono}">更新</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<hr size="2" color="blue">
		<form action="addCatagory" method="post" name="catagory1">
			类别名称：
			<input type="text" name="cataName" /><br><br>
			类别摘要:
			<textarea rows="4" cols="30" name="cataContent"></textarea>
			<input type="submit" value="新增类别" onclick="return checkField()"/>
		</form>
	</body>
</html>
