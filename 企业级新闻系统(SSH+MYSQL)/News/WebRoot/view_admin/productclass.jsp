<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<html>
<head>
  <title>productclass</title>
  <LINK href="/News/css/css.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#d4d0c8">
  <table borderColor="#535353" cellSpacing="0" borderColorDark="#FFFFFF" width="95%" border="1" align="center">
    <tr>
      <td align="center" valign="top"><br><br>
        <table borderColor="#535353" cellSpacing="0" borderColorDark="#FFFFFF" width="95%" border="1" align="center">
          <tr>
            <td width="50%" height="30" align="center" bgcolor="#999999"><strong>栏目名称</strong></td>
            <td height="30" align="center" bgcolor="#999999"><strong>操作选项</strong></td>
          </tr>

          <c:forEach items="${aList}" var="productBigClass">
            <tr bgcolor="#E3E3E3" class="tdbg">
              <td width="233" height="22" bgcolor="#C0C0C0"><img src="/News/view_admin/images/+.gif" width="15" height="15">${productBigClass.bigclassname}</td>
              <td><html:link href="productBigClass_Action.do?method=delProductBigClass&id=${productBigClass.id}">大类删除</html:link></td>
            </tr>
            <c:forEach items="${productBigClass.productsmallclass}" var="productSmallClass">
              <tr bgcolor="#EAEAEA" class="tdbg">
                <td width="233" height="22">&nbsp;&nbsp;<img src="/News/view_admin/images/-.gif" width="15" height="15">${productSmallClass.smallclassname}</td>
                <td align="right" style="padding-right:10">
                  <html:link href="productSmallClass_Action.do?method=delProductSmallClass&id=${productSmallClass.id}">删除</html:link>
                </td>
              </tr>
            </c:forEach>
          </c:forEach>

        </table><br>
      </td>
   </tr>
 </table>
</body>
</html>
