<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

		<title>My JSP 'leaveHistory.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="styles/leaveWord.css">

		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="dwr/interface/leaveWordService.js"></script>
		<script type="text/javascript" src="scripts/leaveword.js"></script>
		<script type="text/javascript">
	window.onload = function () {
	//$("btn").onclick = add;
	$("userList").onchange = userChange;
};
	function mymouseover(the){
		
		the.className="over";
	}
	function mymouseout(the){
		the.className="out";
	}
</script>

<style type="text/css">
<!--
.isuser {color: #42B475;font-family: "宋体";font-size: 16px;}
.notuser {color: #006EFE;font-family: "宋体";font-size: 16px;}
.over{
	border:1px #339999  solid;
	background:#99CCFF;
}
.out{
	border:1px #FFFFFF  solid;
	background:#FFFFFF;
}
-->
</style>
	</head>

	<body style="background-color: #D3DBEE"">

			
		<table align="right">
			<select id="userList" name="userList">
				<option value="0">
					--请选择--
				</option>
				<c:forEach items="${users}" var="user">
					<option value="${user.userId}">
						${user.userName}
					</option>
				</c:forEach>
			</select>
	</table>
		<!-- 历史内容 -->
		<p>	</p><br>
			<table align="center" style="background-color:#FFFFFF; border:1 #999999 solid" cellpadding="4" >
				<tbody id="leaveHistory">
					<c:forEach items="${leaveWordsHistory}" var="leaveWord">
						<tr>
							<td width="400" class="out"  style="word-wrap: break-word"
							 onmouseover="mymouseover(this)" onmouseout="mymouseout(this)">
							<c:if test="${leaveWord.user.userId ne user.userId}">
								<font class="notuser">${leaveWord.user.userName}&nbsp;&nbsp;
								<fmt:formatDate value="${leaveWord.leaveWordDate}" pattern="yyyy-MM-dd HH:mm"/></font>
								<br />
								&nbsp;&nbsp;&nbsp;&nbsp;${leaveWord.leaveWordContent}
								<br>
							</c:if>
							<!-- 是该用户时 -->
							<c:if test="${leaveWord.user.userId eq user.userId}">
								<font class="isuser">${leaveWord.user.userName}&nbsp;&nbsp;
								<fmt:formatDate value="${leaveWord.leaveWordDate}" pattern="yyyy-MM-dd HH:mm"/></font>
								<br />
								&nbsp;&nbsp;&nbsp;&nbsp;${leaveWord.leaveWordContent}
								<br>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		<br>
	</body>
</html>
