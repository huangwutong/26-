<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<html>
<head>
  <title>articlesmallclass_add</title>
  <link href="/News/css/css.css" rel="stylesheet" type="text/css"/>
</head>
<body bgcolor="#ffffff">
<table width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><br>
      <html:link page="/article_Action.do?method=searchClass"><strong><bean:message key="Article.bigclasstype"/></strong></html:link><br>
      <html:form action="/smallClass_Action?method=addSmall" method="post">
        <table width="350" border="0" align="center" cellpadding="0" cellspacing="2" class="border">
          <tr bgcolor="#999999" class="title">
            <td height="25" colspan="2" align="center"><strong><bean:message key="Article.smallclass_add"/></strong></td>
          </tr>
          <tr class="tdbg">
            <td width="126" height="22" bgcolor="#C0C0C0"><strong><bean:message key="Article.own.bigclasss"/></strong></td>
            <td width="218" bgcolor="#E3E3E3">
             <input type="text" name="bigclassname" value="${bigClass.bigclassname}" readonly/>
             <input type="hidden" name="bigclassid" value="${bigClass.id}"/>
            </td>
          </tr>
          <tr class="tdbg">
            <td width="126" height="22" bgcolor="#C0C0C0"><strong><bean:message key="Article.smallclassname"/></strong></td>
            <td bgcolor="#E3E3E3"><html:text property="smallclassname"/></td>
          </tr>
          <tr class="tdbg">
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
