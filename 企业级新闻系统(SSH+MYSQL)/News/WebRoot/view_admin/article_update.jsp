<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*,com.xh369.dto.SmallClass,com.xh369.dto.BigClass" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="fck" %>
<script language="JavaScript" type="text/javascript" src="/view_admin/js/checkForm.js"></script>
<script language="javascript" type="text/javascript" src="/view_admin/editorFiles/editor_js/editorFunction.js"></script>
<html:html>
<head>
<title>article_update</title>
<link href="/News/css/css.css" rel="stylesheet" type="text/css">
<script type="" language="javascript">
 var onecount;
 subcat = new Array();
 <%
   int count = 0;
   List list = (ArrayList) request.getAttribute("arrList");
   //遍历所有小类
   for(int i = 0; i < list.size(); i++){
     BigClass bigClass = (BigClass) list.get(i);
     Iterator it = bigClass.getSmallclass().iterator();
     SmallClass smallClass = null;
     while(it.hasNext()){
       smallClass = (SmallClass) it.next();
       pageContext.setAttribute("smallClass", smallClass);
 %>
       //数组(小类ID值、小类中大类的外键值、小类名)
       subcat[<%= count%>] = new Array("<%=smallClass.getId()%>", "<%=smallClass.getBigclass().getId()%>", "<%=smallClass.getSmallclassname()%>");
 <%
       count += 1;
     }
   }
 %>
 //共有多少个小类
 onecount = <%= count%>;
 function changelocation(locationid){
   //一个初始值，“不指定小类”占了一个值即为0
   document.article_ActionForm.smallclassid.length = 1;
   var locationid = locationid;
   var j;
   for(j = 0; j < onecount; j++){
     if(subcat[j][1] == locationid){
       //当第一次循环时，document.myform.SmallClassName.length为1，第二次则自动取值得到列表框的组数，注意不要忘记“不指定小类”是0
       document.article_ActionForm.smallclassid.options[document.article_ActionForm.smallclassid.length] = new Option(subcat[j][2], subcat[j][0]);
     }
   }
 }
</script>
</head>
<body bgcolor="#d4d0c8">
  <table border="0" align="center">
    <TR>
      <TD>
        <html:form action="/article_Action?method=updateOnlyArticle" method="POST">
          <table width="600" border="0" align="center">
            <tr>
              <td align="right"><bean:message key="Article.title"/></td>
              <td><html:text property="title"/></td>
            </tr>
            <br/>

            <tr>
              <td align="right"><bean:message key="Article.pic"/></td>
              <td>
                <html:select property="picpath">
                  <html:option value="0">
                    <bean:message key="Article.pic.option"/>
                  </html:option>
                </html:select>&nbsp;<bean:message key="Article.pic.option.description"/>
              </td>
            </tr>
            <br/>

            <tr>
              <td align="right"><bean:message key="Article.type"/></td>
                <td>
                    <html:select property="bigclassid"
                    onchange="changelocation(document.article_ActionForm.bigclassid.options[document.article_ActionForm.bigclassid.selectedIndex].value)">
                       <c:forEach items="${arrList}" var="articleBigClass" varStatus="statusCount">
                         <c:if test="${statusCount.count == 1}">
                           <c:set scope="page" var="smallclass" value="${articleBigClass.smallclass}"></c:set>
                         </c:if>
                        <html:option value="${articleBigClass.id}">
                          ${articleBigClass.bigclassname}
                        </html:option>
                       </c:forEach>
                    </html:select>

                    <html:select property="smallclassid">
                      <html:option value="0">
                        <bean:message key="Article.type.smallclassid"/>
                      </html:option>
                        <c:forEach items="${smallclass}" var="articleSmallClass">
                          <html:option value="${articleSmallClass.id}">
                            ${articleSmallClass.smallclassname}
                          </html:option>
                        </c:forEach>
                    </html:select>
                </td>
            </tr>
            <br/>

            <tr>
              <td valign="middle" align="right"><bean:message key="Article.content"/></td>
              <td>
                <fck:editor
                  id="content"
                  basePath="/News/"
                  height="350"
                  skinPath="/News/editor/skins/default/"
                  toolbarSet="Default"
                  imageBrowserURL="/News/editor/filemanager/browser/default/browser.html?Type=Image&Connector=connectors/jsp/connector"
                  linkBrowserURL="/News/editor/filemanager/browser/default/browser.html?Connector=connectors/jsp/connector"
                  flashBrowserURL="/News/editor/filemanager/browser/default/browser.html?Type=Flash&Connector=connectors/jsp/connector"
                  imageUploadURL="/News/editor/filemanager/upload/simpleuploader?Type=Image"
                  linkUploadURL="/News/editor/filemanager/upload/simpleuploader?Type=File"
                  flashUploadURL="/News/editor/filemanager/upload/simpleuploader?Type=Flash"
                 >
                 ${article_ActionForm.content}
                </fck:editor>
              </td>
            </tr>
            <br/>

            <tr>
              <td></td>
              <td align="center">
                <html:submit property="submit" styleClass="btn">
                  <bean:message key="Article.submit"/>
                </html:submit>
                &nbsp;
                <html:reset styleClass="btn">
                  <bean:message key="Article.reset"/>
                </html:reset>
              </td>
            </tr>
          </table>
           <html:hidden property="id"/>
           <html:hidden property="deploytime"/>
        </html:form>
      </TD>
    </TR>
  </TABLE>
</body>
</html:html>
