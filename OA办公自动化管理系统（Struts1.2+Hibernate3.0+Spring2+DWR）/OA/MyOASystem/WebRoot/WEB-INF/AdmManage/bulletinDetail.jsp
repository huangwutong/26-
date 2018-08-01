<%@ page language="java"  pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'bulletinDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body  style="width: 300px;">


  <table border="0" width="100%" cellpadding="0" cellspacing="0"  class="small" align="center">
    <tr>
      <td style="background-color: #D3DBEE" align="center">标题：${bulletin.bulletinTitle }
      </td>
    </tr>
    <tr>
      <td class="TableContent" align="right">
      <u title="部门：${bulletin.user.deptPosition.dept.deptName  }" style="cursor:hand">${bulletin.user.userName }</u>&nbsp;&nbsp;
      发布于：<i>${bulletin.bulletinDate }</i>
      </td>
    </tr>
    <tr>
    	<td align="center" style="background-color: #D3DBEE">内容：</td>
    </tr>
    <tr>
    
      <td class="TableData" colspan="2"  height="160" valign="top">
		${bulletin.bulletinContent }
     </td>
    </tr>
    <tr align="center" class="TableControl">
      <td>
        <input type="button" value="关闭" class="BigButton" onClick="javascript:window.close();">
      </td>
    </tr>
  </table>

</body>
</html>
