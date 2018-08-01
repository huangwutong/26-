<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp"%>
<html>
<head>
<title>articlebigclass_update</title>
<link href="/News/css/css.css" rel="stylesheet" type="text/css"/>
</head>
<body bgcolor="#ffffff">
  <table width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><br><html:link page="/article_Action.do?method=searchClass"><strong><bean:message key="Article.bigclasstype"/></strong></html:link><br><br>
      <html:form action="bigClass_Action?method=updateOnlyBigClass" method="post">
        <table width="350" border="0" align="center" cellpadding="0" cellspacing="2" class="border">
          <tr class="title">
            <td height="25" colspan="2" align="center" bgcolor="#999999"><strong><bean:message key="Article.bigclassname_update"/></strong></td>
          </tr>
          <tr class="tdbg">
            <td width="126" bgcolor="#C0C0C0"><strong><bean:message key="Article.bigclassid"/></strong></td>
            <td width="204" bgcolor="#E3E3E3">
              <html:text property="id" value="${bid}" readonly="true"/>
            </td>
          </tr>
          <tr class="tdbg">
            <td width="126" bgcolor="#C0C0C0"><strong><bean:message key="Article.bigclassname"/></strong></td>
            <td bgcolor="#E3E3E3">
              <html:text property="bigclassname"/>
            </td>
          </tr>
          <tr class="tdbg">
            <td align="center" bgcolor="#C0C0C0"></td>
            <td align="center" bgcolor="#E3E3E3">
              <div align="left">
                <html:submit styleClass="btn">
                  <bean:message key="Article.bigclass_update"/>
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
