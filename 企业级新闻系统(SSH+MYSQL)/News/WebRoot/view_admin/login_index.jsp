<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<html:html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <title><bean:message key="Login.about"/></title>
  <link href="/News/css/style.css" rel="stylesheet" type="text/css">
</head>
<BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" bgcolor="#799AE1">
<br>
<br>
<br>

  <html:form action="/admin_Action.do?method=login" method="POST">
    <table width="413" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#EEEAD6">

      <tr>
        <td height="29" colspan="3" background="images/topbg.gif">
          <table width="95%" align="right" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="left" valign="middle">
                <B><bean:message key="Login.titlelogin"/>
              </td>
              <td width="8%" align="right"></td>
            </tr>
          </table>
        </td>
      </tr>

      <tr>
        <td width="3" background="images/link.GIF"></td>

        <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="75" background="images/bgtop.gif">
                <table width="100%" height="75" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="30%" align=center>
                      <bean:message key="Login.versionlogin"/>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td>
                <table width="95%" border="0" align="center">
                  <tr>
                    <td>
                      <fieldset>
                        <legend accesskey="F" align="left"><bean:message key="Login.form"/></legend>
                        <table width="100%" border="0" cellspacing="2" cellpadding="2">
                          <tr>
                            <td width="10%"></td>
                            <td width="20%"></td>
                            <td>
                              <bean:message key="Login.username"/>
                              <html:text property="username"/>
                            </td>
                          </tr>
                          <tr>
                            <td width="10%"></td>
                            <td width="20%"></td>
                            <td>
                              <bean:message key="Login.pwd"/>&nbsp;&nbsp;&nbsp;
                              <html:password property="pwd"/>
                            </td>
                          </tr>
                          <tr>
                            <td width="10%"></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          
                          <tr>
                            <td colspan="3" align="center">
                              <html:submit property="submit">
                                <bean:message key="Login.submit"/>
                              </html:submit>
                            </td>
                          </tr>
                          
                        </table>
                      </fieldset>
                      &nbsp;
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
        <td width="3" background="images/link.GIF"></td>
      </tr>

      <tr>
        <td height="3" background="images/linkbom.GIF" colspan="3"></td>
      </tr>
  </table>
</html:form>
</body>
</html:html>
