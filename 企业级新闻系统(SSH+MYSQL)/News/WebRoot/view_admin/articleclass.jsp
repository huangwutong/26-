<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp"%>
<html>
<head>
<title>articleclass</title>
<link href="/News/css/css.css" rel="stylesheet" type="text/css"/>
</head>
<body bgcolor="#d4d0c8">
<html:form action="bigClass_Action" method="post">
  <table borderColor="#535353" cellSpacing="0" borderColorDark="#FFFFFF" width="95%" border="0" align="center">
  <tr>
    <td align="center" valign="top"><br>
      <a href="/News/view_admin/articlebigclass_add.jsp"><strong><font color="#FF0000"><u><bean:message key="Article.bigclasstype_add"/></u></font></strong></a><br>
      <br>
      <table borderColor="#535353" cellSpacing="0" borderColorDark="#FFFFFF" width="95%" border="1" align="center">
        <tr>
          <td width="50%" height="30" align="center" bgcolor="799ae1"><strong><bean:message key="Article.name"/></strong></td>
          <td height="30" align="center" bgcolor="799ae1"><strong><bean:message key="Article.operate.select"/></strong></td>
        </tr>

        <c:forEach items="${arrList}" var="searchbigclass">
          <tr bgcolor="#E3E3E3" class="tdbg">
            <td width="50%" height="22" bgcolor="#C0C0C0"><img src="/News/view_admin/images/+.gif" width="15" height="15">${searchbigclass.bigclassname}</td>
            <td align="right" bgcolor="#C0C0C0" style="padding-right:10">
              <html:link href="/News/smallClass_Action.do?method=addSmallClass&bigclassid=${searchbigclass.id}" target="main">
                <font color="#FF0000"><bean:message key="Article.smallclasstype_add"/></font>
              </html:link>
              |<html:link href="/News/bigClass_Action.do?method=updateBigClass&bigclassid=${searchbigclass.id}&bigname=${searchbigclass.bigclassname}">
                <bean:message key="Article.update"/>
               </html:link>
              |<html:link href="/News/bigClass_Action.do?method=deleteBigClass&bigclassid=${searchbigclass.id}">
                <bean:message key="Article.delete"/>
               </html:link>
            </td>
          </tr>

          <c:forEach items="${searchbigclass.smallclass}" var="searchsmallclass">
            <tr bgcolor="#EAEAEA" class="tdbg">
              <td width="50%" height="22">&nbsp;&nbsp;<img src="/News/view_admin/images/-.gif" width="15" height="15">${searchsmallclass.smallclassname}</td>
              <td align="right" style="padding-right:10">
                <html:link href="/News/smallClass_Action.do?method=updateSmallClass&id=${searchsmallclass.id}&smallclassname=${searchsmallclass.smallclassname}&bid=${searchbigclass.id}&bigclassname=${searchbigclass.bigclassname}">
                  <bean:message key="Article.update"/>
                </html:link>
                |<html:link href="/News/smallClass_Action.do?method=deleteSmallClass&id=${searchsmallclass.id}">
                   <bean:message key="Article.delete"/>
                 </html:link>
              </td>
            </tr>
          </c:forEach>
        </c:forEach>

      </table>
      <br>
    </td>
  </tr>
</table>
</html:form>
</body>
</html>
