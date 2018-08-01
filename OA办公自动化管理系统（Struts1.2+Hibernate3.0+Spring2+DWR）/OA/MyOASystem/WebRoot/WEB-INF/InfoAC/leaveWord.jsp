<%@ page language="java" pageEncoding="utf-8"%>
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

		<title>留言版</title>

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
	$("btn").onclick = add;
	$("leaveWord.leaveWordConent").focus();
	//$("userList").onchange = userChange;
	$("divChat").scrollTop = 1000;
};
</script>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		
<style type="text/css">
<!--
.isuser {color: #42B475;font-family: "宋体";font-size: 16px;}
.notuser {color: #006EFE;font-family: "宋体";font-size: 16px;}
-->
</style>
	</head>

	<body style="overflow:hidden;">
		<form action="leaveWord.do" method="post" id="leaveForm"
			name="leaveForm">
			<table
				style="text-align: center; border: 0px; width: 100%; height: 100%; background-color: #D3DBEE">
				<tr>
					<td>
						<table>
							<tr>
								<td>
									<input type="hidden" id="operate" name="operate"
										value="doLeaveWord">
									<input type="hidden" id="user" name="userId"
										value="${user.userId}">
								</td>
							</tr>
							<tr>
								<td>
									<!-- 显示的聊天记录 -->
									<div id="divChat"
										style="overflow-y: scroll; border: 0px; background-color: white; width: 500px; height: 300px;scroll-top = 1000">
										<table style="width: 300px">
											<tbody id="leaveWordContentInfo">
												<c:forEach items="${leaveWords}" var="leaveWord">
													<tr>
														<td width="400" style="word-wrap: break-word">
															<!-- 不是用户时 -->
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
									</div>

								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="leaveWord.leaveWordConent"
										style="width: 503px; height: 100px;" id="leaveWordContent" />
								</td>
							</tr>
							<tr>
								<td style="text-align: center">
									<img src="image/pwdsubmit.jpg" id="btn" style="cursor:hand" name="btn" />
									<img src="image/btnhistory.jpg"  onclick="javascript:location='leaveWord.do?operate=doLeaveWordByUserId'" style="cursor:hand"  />
								</td>
							</tr>
						</table>

					</td>
				</tr>
			</table>

		</form>
	</body>
</html>
