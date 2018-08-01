<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'bulletinsManage.jsp' starting page</title>

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
	color: #FF0000;
	text-decoration: none;
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
	</script>
	</head>

	<body bgcolor="#D3DBEE">
		<form id="bullForm" action="bulletin.do" onsubmit="return checkNum()">
		<input type="hidden" id="operate" name="operate" value="toBulletinsManage" >
		<input type="hidden" id="bid" name="bid" value="" >
		<input type="hidden" id="maxPage" name="maxPage" value="${maxPage }" >
		<logic:notEmpty name="bulletins" scope="request">
			<div style="width: 100%;height: 50%">
			<table align="center" width="100%" cellpadding="10" cellspacing="0" >
				<tr bgcolor="white">
					<td align="center" width="10%">
						发布人
					</td>
					<td align="center" width="25%">
						标题
					</td>
					<td align="center" width="20%">
						发布时间
					</td>
					<td align="center" width="12%">
						审批状态
					</td>
					<td align="center" width="10%">
						有效性
					</td>
					<c:if test="${user.deptPosition.deptPositionId eq 1}">
						<td align="center"  width="25%">
							操作
						</td>
					</c:if>


				</tr>
				<logic:iterate id="bull" name="bulletins">
					<tr>
						<td align="center">
							<u title="发布人：${bull.user.deptPosition.deptPositionRemark  }" style="cursor:hand">${bull.user.userName }</u>
						</td>
						<td align="center">
							<a style="outline: background"
								href="bulletin.do?operate=showDetail&bid=${bull.bulletinId }" target="_blank">${bull.bulletinTitle
								}</a>
						</td>
						<td align="center">
							${bull.bulletinDate }
						</td>
						<td align="center">
								${bull.examineState.examineStateName }
						</td>
						<logic:equal value="1" name="bull" property="available">
							<td align="center">
								有效
							</td>
						</logic:equal>
						<logic:equal value="0" name="bull" property="available">
							<td align="center">
								无效
							</td>
						</logic:equal>
						<c:if test="${user.deptPosition.deptPositionId eq 1}">
							<td align="center">
								<c:if test="${bull.examineState.examineStateId eq 1}">
									<a
										href="bulletin.do?operate=doExamine&bid=${bull.bulletinId }&esid=2&pageNum=${pageNum }" >批准</a>
									<a
										href="bulletin.do?operate=doExamine&bid=${bull.bulletinId }&esid=3&pageNum=${pageNum }">不批</a>
								</c:if>
								<c:if test="${bull.examineState.examineStateId eq 2}">
								<c:if test="${bull.available eq 1}">
									<a href="bulletin.do?operate=doAvailable&bid=${bull.bulletinId }&available=0&pageNum=${pageNum }">无效</a>
								</c:if>
								<c:if test="${bull.available eq 0}">
									<a href="bulletin.do?operate=doAvailable&bid=${bull.bulletinId }&available=1&pageNum=${pageNum }">有效</a>
								</c:if>
								</c:if>
								<a href="bulletin.do?operate=doDel&bid=${bull.bulletinId }&pageNum=${pageNum }"
									onclick="return confirm('确认删除？')">删除</a>
							</td>
						</c:if>
					</tr>
				</logic:iterate>
				
			</table>
			</div>
			<table align="center" width="100%" cellpadding="10" cellspacing="0">
				<tr height="10px">
					
					<td>
					<c:if test="${pageNum eq 1 }">
						<a>首页</a> <a>上一页</a> 
					</c:if>
					<c:if test="${pageNum gt 1 }">
						<a  href="bulletin.do?operate=toBulletinsManage">首页</a>
						<a  href="bulletin.do?operate=toBulletinsManage&pageNum=${pageNum-1 }">上一页</a>
					</c:if>
					<c:if test="${pageNum eq maxPage }">
						<a>下一页</a> <a>尾页</a> 
					</c:if>
					<c:if test="${pageNum lt maxPage }">
						<a href="bulletin.do?operate=toBulletinsManage&pageNum=${pageNum+1 }">下一页</a>
						<a href="bulletin.do?operate=toBulletinsManage&pageNum=${maxPage }">尾页</a>
					</c:if>
					</td>
					<td >
						 第<input type="text" style="width: 20px" maxlength="2"  name="pageNum" value="${pageNum }" id="pageNum" >/${maxPage }页 
						 <input type="submit" value="GO">
					</td>
				</tr>
			</table>
		</logic:notEmpty>
		<logic:empty name="bulletins" scope="request">
			没有记录
		</logic:empty>
	</form>
	</body>
</html>
