<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<html>
<head>
  <title>product_oper</title>
  <LINK href="/News/css/css.css" rel="stylesheet" type="text/css">
</head>
<script type="">
 function goto(){
   document.forms[0].action = "/News/product_Action.do?method=searchPage&page=" + document.forms[0].page.value;
   document.forms[0].submit();
 }
</script>
<body bgcolor="#d4d0c8">
  <html:form action="product_Action" method="post">
    <table class="tableBorder" width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#183789">
      <tr>
        <td width="3%" height="25" align="center" background="/News/view_admin/images/admin_bg_1.gif">ID</td>
        <td width="15%" align="center" background="/News/view_admin/images/admin_bg_1.gif">名称</td>
        <td width="9%" align="center" background="/News/view_admin/images/admin_bg_1.gif">大类</td>
        <td width="9%" align="center" background="/News/view_admin/images/admin_bg_1.gif">小类</td>
        <td width="7%" align="center" background="/News/view_admin/images/admin_bg_1.gif">品牌</td>
        <td width="7%" align="center" background="/News/view_admin/images/admin_bg_1.gif">市场价</td>
        <td width="7%" align="center" background="/News/view_admin/images/admin_bg_1.gif">现价</td>
        <td width="7%" align="center" background="/News/view_admin/images/admin_bg_1.gif">推荐</td>
        <td width="7%" align="center" background="/News/view_admin/images/admin_bg_1.gif">新品</td>
        <td width="7%" align="center" background="/News/view_admin/images/admin_bg_1.gif">简介</td>
        <td width="12%" align="center" background="/News/view_admin/images/admin_bg_1.gif">操作</td>
      </tr>
      
      <c:forEach items="${aList}" var="product">
        <tr height="40" bgcolor="#fbfbfb">
          <td height="22" align="center">${product.id.id}</td>
          <td align="center">&nbsp;${product.id.productname}</td>
          <td align="center">&nbsp;${product.id.bigclassname}</td>
          <td align="center">&nbsp;${product.id.smallclassname}</td>
          <td align="center">&nbsp;${product.id.productmodel}</td>
          <td align="center">&nbsp;${product.id.marketprice}</td>
          <td align="center">&nbsp;${product.id.preferentialprice}</td>
          <c:if test="${product.id.vouch == true}">
            <td align="center">&nbsp;√</td>
          </c:if>
          <c:if test="${product.id.vouch != true}">
            <td align="center">&nbsp;×</td>
          </c:if>

          <c:if test="${product.id.newproduct == true}">
            <td align="center">&nbsp;√</td>
          </c:if>
          <c:if test="${product.id.newproduct != true}">
            <td align="center">&nbsp;×</td>
          </c:if>
          <td align="center">&nbsp;${product.id.introduct}</td>
          <td align="center">
            <html:link href="/News/product_Action.do?method=showProduct&id=${product.id.id}">
         修改
            </html:link>
            <html:link href="/News/product_Action.do?method=delProduct&id=${product.id.id}">
         删除
            </html:link>
          </td>
        </tr>
      </c:forEach>
    </table>

    <table borderColor=#535353 cellpadding="3" cellSpacing=1 borderColorDark=#ffffff width="90%" align=center border=1>
      <tr>
        <td height="20"></td>
      </tr>
      <tr bgColor=#eeeeee>
        <td align=center height=30><html:link href="/News/product_Action.do?method=searchPage&page=1"><bean:message key="Article.firstpage"/></html:link>
          &nbsp;&nbsp;
          <c:if test="${currpage>1}">
            <html:link href="/News/product_Action.do?method=searchPage&page=${currpage-1}"><bean:message key="Article.frontpage"/></html:link>
          </c:if>
          <c:if test="${currpage<=1}">
            <bean:message key="Article.frontpage"/>
          </c:if>
          &nbsp;&nbsp;
          <c:if test="${currpage<totalPage}">
            <html:link href="/News/product_Action.do?method=searchPage&page=${currpage+1}"><bean:message key="Article.nextpage"/></html:link>
          </c:if>
          <c:if test="${currpage>=totalPage}">
            <bean:message key="Article.nextpage"/>
          &nbsp;&nbsp;
          </c:if><html:link href="/News/product_Action.do?method=searchPage&page=${totalPage}"><bean:message key="Article.endpage"/></html:link>
          &nbsp;<bean:message key="Article.pagecount"/>
          <STRONG><FONT color=red>${currpage}</FONT>/${totalPage}</STRONG><bean:message key="Article.page"/> &nbsp;
          <bean:message key="Article.total"/><B><FONT color=#ff0000>${count}</FONT></B><bean:message key="Article.record"/>&nbsp;&nbsp;<B>10</B>
          <bean:message key="Article.record.pag"/>
          <bean:message key="Article.goto"/>
          <select name="page" onchange="goto()">
            <c:forEach items="${aryList}" var="selectpage">
              <c:if test="${selectpage != currpage}">
                <option value="${selectpage}">${selectpage}</option>
              </c:if>
              <c:if test="${selectpage == currpage}">
                <option value="${selectpage}" selected>${selectpage}</option>
              </c:if>
            </c:forEach>
          </select>
        </td>
      </tr>
    </table>
  </html:form>
</body>
</html>
