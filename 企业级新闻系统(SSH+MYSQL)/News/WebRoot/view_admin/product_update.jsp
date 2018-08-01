<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="fck" %>
<html>
<head>
  <title>product_update</title>
  <LINK href="/News/css/css.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#d4d0c8">
  <table class="tableBorder" width="90%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#183789">
     <tr>
       <td background="images/admin_bg_1.gif"><div align="center">产品添加</div></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="left" height="22">
        <html:form action="product_Action?method=productUpdate">
          &nbsp;产品名称:<html:text property="productname"/><br>
          &nbsp;产品类别:
                        <html:select property="bigclassid">
                          <html:option value="1">
                            1
                          </html:option>
                        </html:select>

                        <html:select property="smallclassid">
                          <html:option value="0">
                            <bean:message key="Article.type.smallclassid"/>
                          </html:option>
                          <html:option value="1">
                            1
                          </html:option>
                        </html:select><br/>
	&nbsp;产品预览:<html:text property="productpic"/><br>
	&nbsp;生产厂家:<html:text property="producefactory"/><br>
	&nbsp;产品型号:<html:text property="productmodel"/><br>
	&nbsp;市场价格:<html:text property="marketprice"/><br>
	&nbsp;优惠价格:<html:text property="preferentialprice"/><br>
	&nbsp;推　　荐:<html:checkbox property="vouch" value="true"/>&nbsp;&nbsp;
	&nbsp;新　　品:<html:checkbox property="newproduct" value="true"/>&nbsp;&nbsp;<br>
	&nbsp;简　　介:<br>
                      <table align="center">
                        <fck:editor
		                  id="introduct"
		                  basePath="/News/"
		                  height="350"
		                  width="650"
		                  skinPath="/News/editor/skins/default/"
		                  toolbarSet="Default"
		                  imageBrowserURL="/News/editor/filemanager/browser/default/browser.html?Type=Image&Connector=connectors/jsp/connector"
		                  linkBrowserURL="/News/editor/filemanager/browser/default/browser.html?Connector=connectors/jsp/connector"
		                  flashBrowserURL="/News/editor/filemanager/browser/default/browser.html?Type=Flash&Connector=connectors/jsp/connector"
		                  imageUploadURL="/News/editor/filemanager/upload/simpleuploader?Type=Image"
		                  linkUploadURL="/News/editor/filemanager/upload/simpleuploader?Type=File"
		                  flashUploadURL="/News/editor/filemanager/upload/simpleuploader?Type=Flash"
		                 >
		                  ${product_ActionForm.introduct}
		                </fck:editor>
                      </table>
	<br><br>
        <div align="center">
          <html:submit>修改</html:submit>
          <html:reset>清除</html:reset>
        </div>
        <html:hidden property="id"/>
      </html:form>
    </td>
  </tr>
 </table>
</body>
</html>
