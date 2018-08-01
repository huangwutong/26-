<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.xh369.actions.*,java.util.ResourceBundle" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<%@ taglib prefix="display" uri="/WEB-INF/displaytag.tld" %>
<head>
<title>article_all</title>
  <style type="text/css" media="all">
      @import url("/News/css/maven-base.css");
      @import url("/News/css/maven-theme.css");
      @import url("/News/css/site.css");
      @import url("/News/css/screen.css");
  </style>
<link rel="stylesheet" href="/News/css/print.css" type="text/css" media="print" />
<html:base/>
</head>
  <%
      ResourceBundle rb = ResourceBundle.getBundle("ApplicationResources");
      String title = rb.getString("Article.News.title");
      String deployer = rb.getString("Article.deployer");
      String onetype = rb.getString("Article.own.onetype");
      String twotype = rb.getString("Article.own.twotype");
      String deploytime = rb.getString("Article.deploytime");
      String operate = rb.getString("Article.operate");
      pageContext.setAttribute("title", title);
      pageContext.setAttribute("deployer", deployer);
      pageContext.setAttribute("onetype", onetype);
      pageContext.setAttribute("twotype", twotype);
      pageContext.setAttribute("deploytime", deploytime);
      pageContext.setAttribute("operate", operate);
  %>
  <center>
    <display:table name="${articlesviewsList}" export="true" id="currentRowObject" cellspacing="0" pagesize="20">
        <display:column property="id.id" title="ID"/>
        <display:column title="${title}">
          <html:link href="/News/article_Action.do?method=searchDesc&id=${currentRowObject.id.id}">
            <c:out value="${currentRowObject.id.title}" />
          </html:link>
        </display:column>
        <display:column title="${deployer}">
          ${username}
        </display:column>
        <display:column property="id.bigclassname" title="${onetype}"/>
        <display:column property="id.smallclassname" title="${twotype}"/>
        <display:column title="${deploytime}">
          <fmt:formatDate value="${currentRowObject.id.deploytime}" pattern="yyyy-MM-dd"/>
        </display:column>
        <display:column title="${operate}">
          <html:link href="/News/article_Action.do?method=updateArticle&id=${currentRowObject.id.id}"><bean:message key="Article.update"/></html:link>
          <html:link href="/News/article_Action.do?method=deleteArticle&id=${currentRowObject.id.id}"><bean:message key="Article.delete"/></html:link>
        </display:column>
        <display:setProperty name="export.rtf.filename" value="example.rtf"/>
        <display:setProperty name="export.pdf" value="true" />
    </display:table>
  </center>