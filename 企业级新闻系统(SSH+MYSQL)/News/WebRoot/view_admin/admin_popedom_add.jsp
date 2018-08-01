<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<html>
<head>
  <title>admin_popedom_add</title>
  <link href="/News/css/css.css" rel="stylesheet" type="text/css"/>
</head>
<body text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#d4d0c8">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td></td>
        </tr>
      </table><br />

<table borderColor="#535353" cellSpacing="0" borderColorDark="#FFFFFF" width="300" border="1" align="center">
  <tr bgcolor="#CCCCCC">
    <td colspan="2">添加管理员</td>
  </tr>
  <html:form action="admin_Action?method=addAdmin" method="post">
    <tr>
      <td align="right" height="22">用户名</td>
      <td>
        <html:text property="username"/>
      </td>
    </tr>
    <tr>
      <td align="right" height="22">密码</td>
      <td>
        <html:password property="pwd"/>
      </td>
    </tr>
    <tr>
      <td align="right" height="22">Email</td>
      <td>
        <html:text property="email"/>
      </td>
    </tr>
    <tr>
      <td align="right" height="22">权限</td>
      <td>
      		<html:select property="level" size="1" multiple="true">
      			<c:forEach items="${aList}" var="level">
      				<html:option value="${level.id}">${level.popedom}</html:option>
      			</c:forEach>
      		</html:select>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <html:submit>添加</html:submit>
      </td>
    </tr>
  </html:form>
</table><br>
    </td>
  </tr>
</table>
</body>
</html>

