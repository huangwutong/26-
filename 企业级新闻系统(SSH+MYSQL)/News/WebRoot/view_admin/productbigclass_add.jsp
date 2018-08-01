<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<html>
<head>
  <title>productbigclass_add</title>
  <LINK href="/News/css/css.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ffffff">
<table width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td><br>
    <td align="center" valign="top"><strong>产品类别设置</strong><br>
  <html:form action="productBigClass_Action?method=productBigClass_Add" method="post">
    <table width="350" border="0" align="center" cellpadding="0" cellspacing="2" class="border">
      <tr bgcolor="#999999" class="title">
            <td height="25" colspan="2" align="center"><strong>添加大类</strong></td>
          </tr>
      <tr bgcolor="#E3E3E3">
        <td width="126" height="22" bgcolor="#C0C0C0"><div align="right"><strong><bean:message key="Article.bigclass_name"/></strong></div></td>
        <td width="218" bgcolor="#E3E3E3"><html:text property="bigclassname" size="20" maxlength="30" styleClass="input"/>
        </td>
      </tr>
      <tr bgcolor="#C0C0C0">
        <td height="22" align="center" bgcolor="#C0C0C0">&nbsp; </td>
        <td height="22" align="center" bgcolor="#E3E3E3">
          <div align="left">
            <html:submit property="submit" styleClass="btn">
              <bean:message key="Article.bigclass.add"/>
            </html:submit>
          </div>
        </td>
      </tr>
    </table>
  </html:form>
  </td>
  </tr>
</table>
</body>
</html>
