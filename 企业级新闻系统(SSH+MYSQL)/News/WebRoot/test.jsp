<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="fck" %>
<html>
  <head>
    <title>Test</title>
  </head>
  
  <body>
	<FORM action="test1.jsp">
    <fck:editor id="testfck" basePath="/FCKeditor/"
    	height="100%"
    	skinPath="/FCKeditor/editor/skins/default/"
    	toolbarSet="Default"
    	imageBrowserURL="/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Image&Connector=connectors/jsp/connector"
		linkBrowserURL="/FCKeditor/editor/filemanager/browser/default/browser.html?Connector=connectors/jsp/connector"
		flashBrowserURL="/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Flash&Connector=connectors/jsp/connector"
    	imageUploadURL="/FCKeditor/editor/filemanager/upload/simpleuploader?Type=Image"
		linkUploadURL="/FCKeditor/editor/filemanager/upload/simpleuploader?Type=File"
		flashUploadURL="/FCKeditor/editor/filemanager/upload/simpleuploader?Type=Flash">
    </fck:editor>
    </FORM>
  </body>
</html>
