<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<head>
	<title>article_all</title>
	 <!-- 本例使用的css样式表文件-->
<LINK href="/News/css/lightbox.css" type=text/css rel=stylesheet>
<!--prototype类文件-->
<script type="text/javascript" src="/News/view_admin/js/prototype.js" ></script>
<!--本例使用的javascript代码-->
<script type="text/javascript" src="/News/view_admin/js/lightbox.js" ></script>
	<html:base/>
	<style type="text/css" media="screen">
			body {
				font: 12px arial;
			}
			.suggest_link {
				background-color: #FFFFFF;
				padding: 2px 6px 2px 6px;
			}
			.suggest_link_over {
				cursor: hand;
				background-color: #ff9900;
				padding: 2px 6px 2px 6px;
			}
			.search_show {
				position: absolute;
				left: 120px;
				top: 95px;
				background-color: #FFFFFF; 
				text-align: left; 
				border: 1px solid #000000;			
			}		
			.search_suggest {
				position: absolute;
				left: 120px;
				top: 95px;
				background-color: #FFFFFF; 
				text-align: left; 
				border: 0px solid #000000;			
			}		
		</style>
<script type="">
 function goto(){
   document.forms[0].action = "/News/article_Action.do?method=searchPage&page=" + document.forms[0].page.value + "&title=" + document.forms[0].title.value + "&id=" + document.forms[0].id.value + "&click=true&swi=1";
   document.forms[0].submit();
 }
</script>
<script language="JavaScript" type="text/javascript" src="/News/view_admin/js/ajax_search.js"></script>
</head>
<table cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
  <tr align="center">
  	<td>
  		<div align="center">
  			<a href="/News/view_admin/exit.jsp" target="main" class="lbOn">锁定屏幕</a>
  		</div>
  	</td>
  </tr>
  <tr>
    <td>
      <c:forEach items="${arrList}" var="bigclass" varStatus="statusCount">
        <c:if test="${statusCount.count == 1}">
          <c:set scope="page" var="smallclass" value="${bigclass.smallclass}"></c:set>
        </c:if>
        &nbsp;|&nbsp;<html:link href="/News/article_Action.do?method=search&searchid=${bigclass.id}">
                      ${bigclass.bigclassname}
                     </html:link>
      </c:forEach>
    </td>
  </tr>

  <tr id="smallclassview" style="display:${dis}">
    <td>
      <c:forEach items="${smallclass}" var="articleSmallClass">
        <c:if test="${searchid == articleSmallClass.bigclass.id}">
          &nbsp;-|&nbsp;<html:link href="/News/article_Action.do?method=search&searchid=${articleSmallClass.bigclass.id}&bigclassname=${articleSmallClass.bigclass.bigclassname}&smallclassname=${articleSmallClass.smallclassname}">
                         ${articleSmallClass.smallclassname}
                        </html:link>
        </c:if>
      </c:forEach>
    </td>
  </tr>
<html:form action="/article_Action?method=search" method="POST">
    <tr>
      <td>
        <bean:message key="Article.title"/><INPUT type="text" id="title" name="title" size="10" autocomplete="off" onkeyup="searchSuggest();">&nbsp;
        ID:<html:text property="id" size="2" value=""></html:text>&nbsp;
        <html:submit>
          <bean:message key="Article.select"/>
        </html:submit><br/>
        <div id="search_suggest" class="search_suggest"></div>
      </td>
    </tr>
</table>

<table borderColor="#535353" cellSpacing="0" borderColorDark="#FFFFFF" width="95%" border="1" align="center">
   <tr>
    ${noRecords}
    <td width="5%" height="25" align="center" bgcolor="#cdcdcd">ID</td>
    <td width="25%" align="center" bgcolor="#cdcdcd"><bean:message key="Article.News.title"/></td>
    <td width="10%" align="center" bgcolor="#cdcdcd"><bean:message key="Article.deployer"/></td>
    <td width="15%" align="center" bgcolor="#cdcdcd"><bean:message key="Article.own.onetype"/></td>
    <td width="15%" align="center" bgcolor="#cdcdcd"><bean:message key="Article.own.twotype"/></td>
    <td width="20%" align="center" bgcolor="#cdcdcd"><bean:message key="Article.deploytime"/></td>
    <td width="10%" align="center" bgcolor="#cdcdcd"><bean:message key="Article.operate"/></td>
   </tr>
   <c:forEach items="${aList}" var="articlesviews">
     <tr>
      <td align=center height=22>${articlesviews.id.id}</td>
      <td>
         <html:link href="/News/article_Action.do?method=searchDesc&id=${articlesviews.id.id}" titleKey="Article.click.content">
            ${articlesviews.id.title}
         </html:link>
      </td>
      <td align=center>${username}</td>
      <td align=center>${articlesviews.id.bigclassname}</td>
      <td align=center>${articlesviews.id.smallclassname}</td>
      <td align=center>
        <fmt:formatDate value="${articlesviews.id.deploytime}" pattern="yyyy-MM-dd"/>
      </td>
      <td align=center>
        <html:link href="/News/article_Action.do?method=updateArticle&id=${articlesviews.id.id}"><bean:message key="Article.update"/></html:link>
        <html:link href="/News/article_Action.do?method=deleteArticle&id=${articlesviews.id.id}"><bean:message key="Article.delete"/></html:link>
      </td>
     </tr>
  </c:forEach>
</table>

<table borderColor=#535353 cellSpacing=0 borderColorDark=#ffffff width="95%" align=center border=1>
  <tr>
    <td height="20"></td>
  </tr>
  <tr bgColor=#eeeeee>
    <td align=center height=30><html:link href="/News/article_Action.do?method=searchPage&page=1&swi=1"><bean:message key="Article.firstpage"/></html:link>
      &nbsp;&nbsp;
      <c:if test="${currpage>1}">
        <html:link href="/News/article_Action.do?method=searchPage&page=${currpage-1}&swi=1"><bean:message key="Article.frontpage"/></html:link>
      </c:if>
      <c:if test="${currpage<=1}">
        <bean:message key="Article.frontpage"/>
      </c:if>
      &nbsp;&nbsp;
      <c:if test="${currpage<totalPage}">
        <html:link href="/News/article_Action.do?method=searchPage&page=${currpage+1}&swi=1"><bean:message key="Article.nextpage"/></html:link>
      </c:if>
      <c:if test="${currpage>=totalPage}">
        <bean:message key="Article.nextpage"/>
      &nbsp;&nbsp;
      </c:if><html:link href="/News/article_Action.do?method=searchPage&page=${totalPage}&swi=1"><bean:message key="Article.endpage"/></html:link>
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
