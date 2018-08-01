<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

		<title>My JSP 'toMeetingApply.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
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
			color: red;
			text-decoration: underline;
			cursor: hand;
		}
		
		td {
			text-align: center;
			height: 5px;
		}
</style>
<script type="text/javascript">
		function checkNum(){
			if(document.getElementById("pageNum").value>document.getElementById("maxPage").value){
				alert("请输入1到"+document.getElementById("maxPage").value+"之间的数字");	
				return false;
			}
			return true;
		}
		function show_reader(NOTIFY_ID)
{
 URL="meeting.do?operate=showDetail&mid="+NOTIFY_ID;
 myleft=(screen.availWidth-500)/2;
 window.open(URL,"read_notify","height=400,width=500,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top=150,left="+myleft+",resizable=yes");
}

		
	</script>
	</head>

	<body bgcolor="#D3DBEE">
		<div style="width: 100%; height: 50%">
		<form action="meeting.do" onsubmit="return checkNum()">
		<input type="hidden" name="operate" value="toMeetManage">
		<input type="hidden" id="maxPage" name="maxPage" value="${maxPage }" >
			<logic:empty scope="request" name="meetings">
				<span class="">没有记录</span>
			</logic:empty>
			<logic:notEmpty scope="request" name="meetings">
				<table align="center" width="100%" cellpadding="10" cellspacing="0">
					<tr bgcolor="white">
						<td width="10%">
							标题
						</td>						
						<td width="11%">
							审批状态
						</td>
						<td width="11%">
							会议状态
						</td>
						<td width="12%">
							开始时间
						</td>
						<td width="12%">
							结束时间
						</td>
						<td width="10%">
							会议室
						</td>						
						<c:if test="${user.deptPosition.deptPositionId eq 1 or user.deptPosition.deptPositionId eq 12}">
							<td >
								操作
							</td>
						</c:if>
					</tr>
					<logic:iterate id="meeting" scope="request" name="meetings">
						<tr>
							<td>
								<u name="${meeting.meetingId }" style="color: red;"  title="查看详情"  onclick="show_reader(this.name)">${meeting.meetingTitle }</u>
							</td>							
							<td>
								${meeting.examineState.examineStateName }
							</td>
							<td>
								${meeting.meetingstate.meetingStateName }
							</td>
							<td>
								${meeting.startTime }
							</td>
							<td>
								${meeting.endTime }
							</td>
							<td>
								${meeting.boardRoom.boardRoomName }
							</td>							
							<td>
								
								<c:if test="${user.deptPosition.deptPositionId eq 1}">
									<c:if test="${meeting.examineState.examineStateId eq 1}">
									<a href="meeting.do?operate=doExamine&mid=${meeting.meetingId }&esid=2&pageNum=${pageNum }">批准</a>
									<a href="meeting.do?operate=doExamine&mid=${meeting.meetingId }&esid=2&pageNum=${pageNum }">不批</a>
									</c:if>									
									<a href="meeting.do?operate=toEdit&mid=${meeting.meetingId }" target="_blank">修改</a>									
									<a href="meeting.do?operate=doDel&mid=${meeting.meetingId }&pageNum=${pageNum }"
										onclick="return confirm('确定删除此会议？')">删除</a>
								</c:if>
								
								<c:if test="${meeting.meetingstate.meetingStateId eq 1}">
								<a href="meeting.do?operate=doBegin&mid=${meeting.meetingId }&pageNum=${pageNum }">开始</a>
								</c:if>
								<c:if test="${meeting.meetingstate.meetingStateId eq 2}">
									<a href="meeting.do?operate=doEnd&mid=${meeting.meetingId }&pageNum=${pageNum }">结束</a>
								</c:if>
								<c:if test="${meeting.meetingstate.meetingStateId eq 2}">
									<a href="meeting.do?operate=doEnd&mid=${meeting.meetingId }&pageNum=${pageNum }">写会议记录</a>
								</c:if>
							</td>
						</tr>
					</logic:iterate>
				</table>			
			<table align="center" width="100%" cellpadding="10" cellspacing="0">
					<tr height="10px">
						<td>
							<c:if test="${pageNum eq 1 }">
								<a>首页</a>
								<a>上一页</a>
							</c:if>
							<c:if test="${pageNum gt 1 }">
								<a href="meeting.do?operate=toMeetManage">首页</a>
								<a
									href="meeting.do?operate=toMeetManage&pageNum=${pageNum-1 }">上一页</a>
							</c:if>
							<c:if test="${pageNum eq maxPage }">
								<a>下一页</a>
								<a>尾页</a>
							</c:if>
							<c:if test="${pageNum lt maxPage }">
								<a
									href="meeting.do?operate=toMeetManage&pageNum=${pageNum+1 }">下一页</a>
								<a
									href="meeting.do?operate=toMeetManage&pageNum=${maxPage }">尾页</a>
							</c:if>
						</td>
						<td>
							第
							<input type="text" style="width: 20px" maxlength="2" id="pageNum" 
								name="pageNum" value="${pageNum }">
							/${maxPage }页
							<input type="submit" value="GO">
						</td>
					</tr>
				</table>
				</logic:notEmpty>
			</form>
		</div>
	</body>
</html>
