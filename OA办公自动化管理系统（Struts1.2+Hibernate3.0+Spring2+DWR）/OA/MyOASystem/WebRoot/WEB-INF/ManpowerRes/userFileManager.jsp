<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>

		<link rel="stylesheet" type="text/css" href="styles/style.css"></link>
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="dwr/interface/UserServices.js"></script>
		<script type="text/javascript" src="dwr/interface/PositionService.js"></script>
		<script type="text/javascript" src="dwr/interface/DeptPositionService.js"></script>
		<script type="text/javascript" src="scripts/user.js"></script>
	</head>

	<body>
		<form action="user.do" method="post" name="form1" id="form1">
			<div style="text-align: center; background-color: #D3DBEE">
				<table border="0" width="95%" cellpadding="2" cellspacing="1"
					align="center" class="small">
					<tr>
						<td>
							<input type="hidden" id="operate" name="operate" value="doAdd"/>
						</td>
						<td>
							
						</td>
						<td>
							
						</td>
					</tr>
					<tr>
						<td nowrap class="TableContent" width="187">
							所属部门：
						</td>
						<td class="TableData">
							<select name="dept" class="BigSelect" id="dept">
								<option value="0">
									--请选择--
								</option>
								<c:forEach items="${depts}" var="dept">
									<option value="${dept.deptId}">
										${dept.deptName}
									</option>
								</c:forEach>
							</select>
						</td>
						<td class="TableData">
							职位：
						</td>
						<td class="TableData">
							<label>
								<select name="position" id="position">
									<option value="0">
										--请选择--
									</option>
								</select>
							</label>
						</td>
					</tr>
					<tr>
						<td nowrap class="TableContent" width="187">
							登录名
						</td>
						<td class="TableData" width="264">
							<input name="user.loginName" type="text" class="BigInput"
								id="loginName" value="" size="15" maxlength="100" />
						</td>
						<td class="TableData" width="174">
							真实姓名:
						</td>
						<td class="TableData" width="303">
							<label>
								<input type="text" name="user.userName" id="userName" class="BigInput" />
							</label>
						</td>
					</tr>
					<tr>
						<td nowrap class="TableContent">
							性别：
						</td>
						<td class="TableData">
							<select name="user.sex" class="BigSelect" id="sex">
								<option value=""></option>
								<option value="0" selected="selected">
									男
								</option>
								<option value="1">
									女
								</option>
							</select>
						</td>
						<td nowrap class="TableContent">
							年龄：
						</td>
						<td class="TableData" nowrap>
							<label>
								<input type="text" name="user.age" id="age" class="BigInput" />
							</label>
						</td>
					</tr>
					<tr>
						<td nowrap class="TableContent">
							出生日期：
						</td>
						<td class="TableData" nowrap colspan="3">
							<input name="user.birthday" type="text" class="BigStatic"
								id="birthday" value="" size="10" maxlength="10"/>
								日期格式形如 1999-1-2 
						</td>
					</tr>
					<tr>
						<td nowrap class="TableContent">
							身份证号码：
						</td>
						<td class="TableData">
							<input type="text" name="user.idCard" id="idCard" size="15" maxlength="25"
								class="BigInput" value=""/>
						</td>
						<td nowrap class="TableContent">
							&nbsp;
						</td>
						<td class="TableData">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td nowrap class="TableContent">
							家庭住址：
						</td>
						<td class="TableData" colspan="3">
							<input type="text" name="user.address" id="address" size="15" maxlength="100"
								class="BigInput" value=""/>
						</td>
					</tr>
					<tr>
						<td nowrap class="TableContent"> 
						 
							电子邮件：</td>
						<td class="TableData">
							<input type="text" name="user.email" class="BigInput" id="email" value="" size="15" maxlength="100" />
						</td>
						<td nowrap class="TableContent"> 
						联系电话：
						</td>
						<td class="TableData">
							<input type="text" name="user.mobilePhone" class="BigInput" id="mobilePhone" value="" size="15" maxlength="100" />
						</td>
					</tr>
					<tr>
						<td nowrap class="TableContent">
							备 注：
						</td>
						<td class="TableData">
							<textarea name="user.remark" cols="18" rows="2" wrap="on"
								class="BigInput" id="remark"></textarea>
						</td>
						<td nowrap class="TableContent">
							&nbsp;
						</td>
						<td class="TableData">
							&nbsp;
						</td>
					</tr>

					<tr class="TableControl">
						<td nowrap colspan="4" align="center">
							<input type="button" id="btn" name="btn" value="添加" class="BigButton"/>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>

