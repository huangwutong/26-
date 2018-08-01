<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'meetingRead.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
		body {
			font-size: 12pt;
			scrollbar-3dlight-color: #170708;
			scrollbar-arrow-color: #000000;
			scrollbar-base-color: #170708;
			scrollbar-darkshadow-color: #ffffff;
			scrollbar-face-color: #EEEAEB;
			scrollbar-highlight-color: #FBFDFC;
			scrollbar-shadow-color: #170708;
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		
		a {
			font: "宋体";
			font-size: 15px;
			color: #000000;
			text-decoration: none;
		}
		
		a:hover {
			font: "宋体";
			font-size: 15px;
			color: #FF0000;
			text-decoration: none;
		}
		
		a.de {
			font: "宋体";
			font-size: 12px;
			color: #000000;
			text-decoration: underline
		}
		
		a.de:hover {
			font: "宋体";
			font-size: 12px;
			color: #FF0000;
			text-decoration: underline
		}
		
		u {
			font: "宋体";
			font-size: 15px;
			color: #000000;
			text-decoration: none;
		}
		
		u:hover {
			font: "宋体";
			font-size: 15px;
			color: #FF0000;
			text-decoration: none;
		}
		
		td {
			text-align: left;
			height: 5px;
		}
</style>
	<script type="text/javascript">
		function closeWindow(){
			window.close();
		}
	</script>
	</head>

	<body bgcolor="#D3DBEE">
	<table align="center" width="100%" cellpadding="10" cellspacing="0" b>
		<tr>
			<td>会议标题：</td>
			<td>${meeting.meetingTitle }</td>			
		</tr>
		<tr>
			<td>申请人：</td>
			<td>${meeting.userByUserId.userName }</td>			
		</tr>
		<tr>
			<td>申请时间：</td>
			<td>${meeting.meetingTime }</td>			
		</tr>
		<tr>
			<td>会议室：</td>
			<td>${meeting.boardRoom.boardRoomName }</td>			
		</tr>
		<tr>
			<td>会议室管理员：</td>
			<td>${meeting.userByExaminer.userName }</td>			
		</tr>
		<tr>
			<td>会议时间：</td>
			<td>从${meeting.startTime }到${meeting.endTime }</td>			
		</tr>
		<tr>
			<td>会议内容：</td>
			<td>${meeting.meetingContent }</td>			
		</tr>
		<c:if test="${meetingReads ne null}">
				<tr>
					<td rowspan="2">
						会议内部人员：
					</td>
				</tr>				
				<tr>
					<td>
						<c:forEach var="mr" items="${meetingReads}">
							${mr.user.userName }
						</c:forEach>
					
					</td>
					
				</tr>
		</c:if>	
			
	</table>
			<center><input type="button" value="关闭" onclick="closeWindow()"></center>
			
	</body>
</html>
